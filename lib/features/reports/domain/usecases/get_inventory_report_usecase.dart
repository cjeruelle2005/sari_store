import 'package:sari_store/core/errors/result.dart';
import 'package:sari_store/features/reports/domain/entities/inventory_report.dart';
import 'package:sari_store/features/reports/domain/repositories/report_repository.dart';

class GetInventoryReportUseCase {
  final ReportRepository repository;
  GetInventoryReportUseCase(this.repository);

  Future<Result<InventoryReport>> call() => repository.getInventoryReport();
}