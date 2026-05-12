import 'package:sari_store/core/errors/result.dart';
import 'package:sari_store/features/reports/domain/entities/sales_report.dart';
import 'package:sari_store/features/reports/domain/repositories/report_repository.dart';

class GetSalesReportUseCase {
  final ReportRepository repository;
  GetSalesReportUseCase(this.repository);

  Future<Result<SalesReport>> call(DateTime from, DateTime to) =>
      repository.getSalesReport(from: from, to: to);
}