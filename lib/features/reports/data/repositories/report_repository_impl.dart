import 'package:sari_store/core/errors/result.dart';
import 'package:sari_store/core/errors/failures.dart';
import 'package:sari_store/core/logger/app_logger.dart';
import 'package:sari_store/features/reports/domain/entities/sales_report.dart';
import 'package:sari_store/features/reports/domain/entities/profit_report.dart';
import 'package:sari_store/features/reports/domain/entities/expense_report.dart';
import 'package:sari_store/features/reports/domain/entities/inventory_report.dart';
import 'package:sari_store/features/reports/domain/entities/utang_report.dart';
import 'package:sari_store/features/reports/domain/repositories/report_repository.dart';
import 'package:sari_store/shared/data/database/app_database.dart';

class ReportRepositoryImpl implements ReportRepository {
  final AppDatabase _db;

  ReportRepositoryImpl({required AppDatabase database}) : _db = database;

  @override
  Future<Result<SalesReport>> getSalesReport({
    required DateTime from,
    required DateTime to,
  }) async {
    try {
      final endDate = to.add(const Duration(days: 1));
      // Total sales
      final totalResult = await _db.customSelect(
        'SELECT COALESCE(SUM(total_amount), 0) AS total, COUNT(*) as tx_count FROM transactions WHERE status = ? AND transaction_date >= ? AND transaction_date < ?',
        variables: [
          Variable.withString('completed'),
          Variable.withDateTime(from),
          Variable.withDateTime(endDate),
        ],
      );
      final totalSales = (totalResult.first.data['total'] as double?) ?? 0.0;
      final totalTransactions = (totalResult.first.data['tx_count'] as int?) ?? 0;
      final averageTransaction = totalTransactions > 0 ? totalSales / totalTransactions : 0.0;

      // Daily breakdown
      final dailyResult = await _db.customSelect(
        '''
        SELECT DATE(transaction_date) as day, SUM(total_amount) as daily_total, COUNT(*) as daily_count
        FROM transactions
        WHERE status = ? AND transaction_date >= ? AND transaction_date < ?
        GROUP BY day
        ORDER BY day
        ''',
        variables: [
          Variable.withString('completed'),
          Variable.withDateTime(from),
          Variable.withDateTime(endDate),
        ],
      );
      final dailyBreakdown = dailyResult.map((r) {
        return DailySales(
          date: DateTime.parse(r.data['day'] as String),
          total: (r.data['daily_total'] as double?) ?? 0,
          transactions: (r.data['daily_count'] as int?) ?? 0,
        );
      }).toList();

      // Top products
      final topProductsResult = await _db.customSelect(
        '''
        SELECT p.name, SUM(ti.quantity) as qty, SUM(ti.total_price) as amount
        FROM transaction_items ti
        JOIN transactions t ON ti.transaction_id = t.id
        JOIN products p ON ti.product_id = p.id
        WHERE t.status = ? AND t.transaction_date >= ? AND t.transaction_date < ?
        GROUP BY ti.product_id
        ORDER BY amount DESC
        LIMIT 10
        ''',
        variables: [
          Variable.withString('completed'),
          Variable.withDateTime(from),
          Variable.withDateTime(endDate),
        ],
      );
      final topProducts = topProductsResult.map((r) {
        return ProductSales(
          productName: r.data['name'] as String,
          quantitySold: (r.data['qty'] as int?) ?? 0,
          totalAmount: (r.data['amount'] as double?) ?? 0,
        );
      }).toList();

      return Result.success(SalesReport(
        from: from,
        to: to,
        totalSales: totalSales,
        totalTransactions: totalTransactions,
        averageTransaction: averageTransaction,
        dailyBreakdown: dailyBreakdown,
        topProducts: topProducts,
      ));
    } catch (e, stack) {
      AppLogger.error('Failed to generate sales report', e, stack);
      return Result.failure(Failure.database(message: 'Failed to generate sales report'));
    }
  }

  @override
  Future<Result<ProfitReport>> getProfitReport({
    required DateTime from,
    required DateTime to,
  }) async {
    try {
      final endDate = to.add(const Duration(days: 1));
      // Revenue (sales total)
      final revenueResult = await _db.customSelect(
        'SELECT COALESCE(SUM(total_amount), 0) as total FROM transactions WHERE status = ? AND transaction_date >= ? AND transaction_date < ?',
        variables: [
          Variable.withString('completed'),
          Variable.withDateTime(from),
          Variable.withDateTime(endDate),
        ],
      );
      final totalRevenue = (revenueResult.first.data['total'] as double?) ?? 0.0;

      // Cost of goods sold (sum of cost_price * quantity for each transaction item)
      final costResult = await _db.customSelect(
        '''
        SELECT COALESCE(SUM(p.cost_price * ti.quantity), 0) as total_cost
        FROM transaction_items ti
        JOIN products p ON ti.product_id = p.id
        JOIN transactions t ON ti.transaction_id = t.id
        WHERE t.status = ? AND t.transaction_date >= ? AND t.transaction_date < ?
        ''',
        variables: [
          Variable.withString('completed'),
          Variable.withDateTime(from),
          Variable.withDateTime(endDate),
        ],
      );
      final totalCost = (costResult.first.data['total_cost'] as double?) ?? 0.0;

      final grossProfit = totalRevenue - totalCost;

      // Expenses in the same period
      final expensesResult = await _db.customSelect(
        'SELECT COALESCE(SUM(amount), 0) as total FROM expenses WHERE date >= ? AND date < ?',
        variables: [
          Variable.withDateTime(from),
          Variable.withDateTime(endDate),
        ],
      );
      final totalExpenses = (expensesResult.first.data['total'] as double?) ?? 0.0;

      final netProfit = grossProfit - totalExpenses;

      return Result.success(ProfitReport(
        from: from,
        to: to,
        totalRevenue: totalRevenue,
        totalCost: totalCost,
        grossProfit: grossProfit,
        totalExpenses: totalExpenses,
        netProfit: netProfit,
      ));
    } catch (e, stack) {
      AppLogger.error('Failed to generate profit report', e, stack);
      return Result.failure(Failure.database(message: 'Failed to generate profit report'));
    }
  }

  @override
  Future<Result<ExpenseReport>> getExpenseReport({
    required DateTime from,
    required DateTime to,
  }) async {
    try {
      final endDate = to.add(const Duration(days: 1));
      final totalResult = await _db.customSelect(
        'SELECT COALESCE(SUM(amount), 0) as total FROM expenses WHERE date >= ? AND date < ?',
        variables: [
          Variable.withDateTime(from),
          Variable.withDateTime(endDate),
        ],
      );
      final totalExpenses = (totalResult.first.data['total'] as double?) ?? 0.0;

      final breakdownResult = await _db.customSelect(
        '''
        SELECT ec.name, SUM(e.amount) as cat_total, COUNT(e.id) as cat_count
        FROM expenses e
        JOIN expense_categories ec ON e.category_id = ec.id
        WHERE e.date >= ? AND e.date < ?
        GROUP BY e.category_id
        ORDER BY cat_total DESC
        ''',
        variables: [
          Variable.withDateTime(from),
          Variable.withDateTime(endDate),
        ],
      );
      final categoryBreakdown = breakdownResult.map((r) {
        return CategoryExpense(
          categoryName: r.data['name'] as String,
          totalAmount: (r.data['cat_total'] as double?) ?? 0,
          count: (r.data['cat_count'] as int?) ?? 0,
        );
      }).toList();

      return Result.success(ExpenseReport(
        from: from,
        to: to,
        totalExpenses: totalExpenses,
        categoryBreakdown: categoryBreakdown,
      ));
    } catch (e, stack) {
      AppLogger.error('Failed to generate expense report', e, stack);
      return Result.failure(Failure.database(message: 'Failed to generate expense report'));
    }
  }

  @override
  Future<Result<InventoryReport>> getInventoryReport() async {
    try {
      final totalProducts = await _db.customSelect('SELECT COUNT(*) as cnt FROM products').then((r) => r.first.data['cnt'] as int? ?? 0);
      final activeProducts = await _db.customSelect('SELECT COUNT(*) as cnt FROM products WHERE is_active = 1').then((r) => r.first.data['cnt'] as int? ?? 0);
      final lowStock = await _db.customSelect('SELECT COUNT(*) as cnt FROM products WHERE stock_quantity <= low_stock_threshold AND is_active = 1').then((r) => r.first.data['cnt'] as int? ?? 0);
      final totalValue = await _db.customSelect('SELECT COALESCE(SUM(cost_price * stock_quantity), 0) as total_value FROM products').then((r) => r.first.data['total_value'] as double? ?? 0.0);

      return Result.success(InventoryReport(
        totalProducts: totalProducts,
        activeProducts: activeProducts,
        lowStockProducts: lowStock,
        totalInventoryValue: totalValue,
      ));
    } catch (e, stack) {
      AppLogger.error('Failed to generate inventory report', e, stack);
      return Result.failure(Failure.database(message: 'Failed to generate inventory report'));
    }
  }

  @override
  Future<Result<UtangReport>> getUtangReport() async {
    try {
      final totalCustomers = await _db.customSelect('SELECT COUNT(*) as cnt FROM customers').then((r) => r.first.data['cnt'] as int? ?? 0);
      final outstanding = await _db.customSelect('SELECT COALESCE(SUM(balance), 0) as total FROM customers').then((r) => r.first.data['total'] as double? ?? 0.0);
      final topDebtors = await _db.customSelect(
        'SELECT name, balance FROM customers WHERE balance > 0 ORDER BY balance DESC LIMIT 10',
      ).then((rows) => rows.map((r) => CustomerBalance(
        customerName: r.data['name'] as String,
        balance: (r.data['balance'] as double?) ?? 0.0,
      )).toList());

      return Result.success(UtangReport(
        totalCustomers: totalCustomers,
        totalOutstandingBalance: outstanding,
        topDebtors: topDebtors,
      ));
    } catch (e, stack) {
      AppLogger.error('Failed to generate utang report', e, stack);
      return Result.failure(Failure.database(message: 'Failed to generate utang report'));
    }
  }
}