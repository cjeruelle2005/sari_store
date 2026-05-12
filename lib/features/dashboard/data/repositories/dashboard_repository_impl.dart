import 'package:sari_store/core/errors/result.dart';
import 'package:sari_store/core/errors/failures.dart';
import 'package:sari_store/core/logger/app_logger.dart';
import 'package:sari_store/features/dashboard/domain/entities/dashboard_data.dart';
import 'package:sari_store/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:sari_store/shared/data/database/app_database.dart';
import 'package:sari_store/shared/data/database/tables.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final AppDatabase _db;

  DashboardRepositoryImpl({required AppDatabase database}) : _db = database;

  @override
  Future<Result<DashboardData>> getDashboardData() async {
    try {
      final now = DateTime.now();
      final todayStart = DateTime(now.year, now.month, now.day);
      final tomorrowStart = todayStart.add(const Duration(days: 1));
      final monthStart = DateTime(now.year, now.month, 1);
      final nextMonthStart = DateTime(now.year, now.month + 1, 1);

      // Daily sales (sum of completed transactions today)
      final dailySalesResult = await _db.customSelect(
        'SELECT COALESCE(SUM(total_amount), 0) as total FROM transactions WHERE status = ? AND transaction_date >= ? AND transaction_date < ?',
        variables: [
          Variable.withString('completed'),
          Variable.withDateTime(todayStart),
          Variable.withDateTime(tomorrowStart),
        ],
      );
      final dailySales = (dailySalesResult.first.data['total'] as double?) ?? 0.0;

      // Monthly sales (this month)
      final monthlySalesResult = await _db.customSelect(
        'SELECT COALESCE(SUM(total_amount), 0) as total FROM transactions WHERE status = ? AND transaction_date >= ? AND transaction_date < ?',
        variables: [
          Variable.withString('completed'),
          Variable.withDateTime(monthStart),
          Variable.withDateTime(nextMonthStart),
        ],
      );
      final monthlySales = (monthlySalesResult.first.data['total'] as double?) ?? 0.0;

      // Total expenses this month
      final expensesResult = await _db.customSelect(
        'SELECT COALESCE(SUM(amount), 0) as total FROM expenses WHERE date >= ? AND date < ?',
        variables: [
          Variable.withDateTime(monthStart),
          Variable.withDateTime(nextMonthStart),
        ],
      );
      final totalExpenses = (expensesResult.first.data['total'] as double?) ?? 0.0;

      // Low stock count
      final lowStockQuery = _db.select(_db.products)
        ..where((t) => t.stockQuantity.isSmallerOrEqualValue(t.lowStockThreshold) & t.isActive.equals(true));
      final lowStockProducts = await lowStockQuery.get();
      final lowStockCount = lowStockProducts.length;

      // Best sellers (top 5 products by quantity sold this month)
      final bestSellersResult = await _db.customSelect(
        '''
        SELECT p.name, SUM(ti.quantity) as qty_sold, SUM(ti.total_price) as total_sales
        FROM transaction_items ti
        JOIN transactions t ON ti.transaction_id = t.id
        JOIN products p ON ti.product_id = p.id
        WHERE t.status = ? AND t.transaction_date >= ? AND t.transaction_date < ?
        GROUP BY ti.product_id
        ORDER BY SUM(ti.quantity) DESC
        LIMIT 5
        ''',
        variables: [
          Variable.withString('completed'),
          Variable.withDateTime(monthStart),
          Variable.withDateTime(nextMonthStart),
        ],
      );
      final bestSellers = bestSellersResult.map((row) {
        return BestSeller(
          productName: row.data['name'] as String,
          quantitySold: (row.data['qty_sold'] as int?) ?? 0,
          totalAmount: (row.data['total_sales'] as double?) ?? 0.0,
        );
      }).toList();

      // Recent transactions (last 5 completed)
      final recentTransactionsQuery = _db.select(_db.transactions)
        ..where((t) => t.status.equals('completed'))
        ..orderBy([(t) => OrderingTerm.desc(t.transactionDate)])
        ..limit(5);
      final recentTransactionsRaw = await recentTransactionsQuery.get();
      final List<RecentTransaction> recentTransactions = [];
      for (final tx in recentTransactionsRaw) {
        final cashier = await _db.userDao.getUserById(tx.cashierId);
        final itemCountResult = await _db.customSelect(
          'SELECT COUNT(*) as cnt FROM transaction_items WHERE transaction_id = ?',
          variables: [Variable.withInt(tx.id)],
        );
        final itemCount = itemCountResult.first.data['cnt'] as int? ?? 0;
        recentTransactions.add(RecentTransaction(
          id: tx.id,
          invoiceNumber: tx.invoiceNumber,
          totalAmount: tx.totalAmount,
          date: tx.transactionDate,
          cashierName: cashier?.fullName ?? 'Unknown',
          itemCount: itemCount,
        ));
      }

      return Result.success(
        DashboardData(
          dailySales: dailySales,
          monthlySales: monthlySales,
          totalRevenue: monthlySales, // We'll treat monthly sales as revenue for now
          totalExpenses: totalExpenses,
          lowStockCount: lowStockCount,
          bestSellers: bestSellers,
          recentTransactions: recentTransactions,
        ),
      );
    } catch (e, stack) {
      AppLogger.error('Error fetching dashboard data', e, stack);
      return Result.failure(Failure.database(message: 'Failed to load dashboard data'));
    }
  }
}