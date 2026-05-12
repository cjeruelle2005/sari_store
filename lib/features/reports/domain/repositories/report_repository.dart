import 'package:sari_store/core/errors/result.dart';
import 'package:sari_store/features/reports/domain/entities/sales_report.dart';
import 'package:sari_store/features/reports/domain/entities/profit_report.dart';
import 'package:sari_store/features/reports/domain/entities/expense_report.dart';
import 'package:sari_store/features/reports/domain/entities/inventory_report.dart';
import 'package:sari_store/features/reports/domain/entities/utang_report.dart';

abstract class ReportRepository {
  Future<Result<SalesReport>> getSalesReport({required DateTime from, required DateTime to});
  Future<Result<ProfitReport>> getProfitReport({required DateTime from, required DateTime to});
  Future<Result<ExpenseReport>> getExpenseReport({required DateTime from, required DateTime to});
  Future<Result<InventoryReport>> getInventoryReport();
  Future<Result<UtangReport>> getUtangReport();
}