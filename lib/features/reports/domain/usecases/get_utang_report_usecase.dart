import 'package:sari_store/core/errors/result.dart';
import 'package:sari_store/features/reports/domain/entities/utang_report.dart';
import 'package:sari_store/features/reports/domain/repositories/report_repository.dart';

class GetUtangReportUseCase {
  final ReportRepository repository;
  GetUtangReportUseCase(this.repository);

  Future<Result<UtangReport>> call() => repository.getUtangReport();
}