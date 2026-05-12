import 'package:sari_store/core/errors/result.dart';
import 'package:sari_store/features/reports/domain/entities/profit_report.dart';
import 'package:sari_store/features/reports/domain/repositories/report_repository.dart';

class GetProfitReportUseCase {
  final ReportRepository repository;
  GetProfitReportUseCase(this.repository);

  Future<Result<ProfitReport>> call(DateTime from, DateTime to) =>
      repository.getProfitReport(from: from, to: to);
}