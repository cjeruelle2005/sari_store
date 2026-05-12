import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sari_store/features/reports/data/repositories/report_repository_impl.dart';
import 'package:sari_store/features/reports/domain/entities/sales_report.dart';
import 'package:sari_store/features/reports/domain/repositories/report_repository.dart';
import 'package:sari_store/features/reports/domain/usecases/get_sales_report_usecase.dart';
import 'package:sari_store/features/reports/domain/usecases/get_profit_report_usecase.dart';
import 'package:sari_store/features/reports/domain/usecases/get_expense_report_usecase.dart';
import 'package:sari_store/features/reports/domain/usecases/get_inventory_report_usecase.dart';
import 'package:sari_store/features/reports/domain/usecases/get_utang_report_usecase.dart';
import 'package:sari_store/shared/providers/database_provider.dart';
import 'package:sari_store/services/export_service.dart';

final reportRepositoryProvider = Provider<ReportRepository>((ref) {
  return ReportRepositoryImpl(database: ref.watch(databaseProvider));
});

final getSalesReportUseCaseProvider = Provider(
    (ref) => GetSalesReportUseCase(ref.watch(reportRepositoryProvider)));
final getProfitReportUseCaseProvider = Provider(
    (ref) => GetProfitReportUseCase(ref.watch(reportRepositoryProvider)));
final getExpenseReportUseCaseProvider = Provider(
    (ref) => GetExpenseReportUseCase(ref.watch(reportRepositoryProvider)));
final getInventoryReportUseCaseProvider = Provider(
    (ref) => GetInventoryReportUseCase(ref.watch(reportRepositoryProvider)));
final getUtangReportUseCaseProvider = Provider(
    (ref) => GetUtangReportUseCase(ref.watch(reportRepositoryProvider)));

final exportServiceProvider = Provider<ExportService>((ref) {
  return ExportService(ref.watch(databaseProvider));
});

// Report data providers (family for date range)
final salesReportProvider = FutureProvider.autoDispose.family<SalesReport, DateTimeRange>(
  (ref, range) async {
    final useCase = ref.watch(getSalesReportUseCaseProvider);
    final result = await useCase(range.start, range.end);
    return result.fold(
      onSuccess: (data) => data,
      onFailure: (failure) => throw Exception(failure.message),
    );
  },
);

// Similarly for profit, expense, we'll create generic handling later. For brevity, we'll add in screen.