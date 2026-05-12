import 'package:sari_store/core/errors/result.dart';
import 'package:sari_store/features/reports/domain/entities/expense_report.dart';
import 'package:sari_store/features/reports/domain/repositories/report_repository.dart';

class GetExpenseReportUseCase {
  final ReportRepository repository;
  GetExpenseReportUseCase(this.repository);

  Future<Result<ExpenseReport>> call(DateTime from, DateTime to) =>
      repository.getExpenseReport(from: from, to: to);
}