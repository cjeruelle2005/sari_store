import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sari_store/core/errors/result.dart';
import 'package:sari_store/features/dashboard/data/repositories/dashboard_repository_impl.dart';
import 'package:sari_store/features/dashboard/domain/entities/dashboard_data.dart';
import 'package:sari_store/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:sari_store/features/dashboard/domain/usecases/get_dashboard_data_usecase.dart';
import 'package:sari_store/shared/providers/database_provider.dart';

final dashboardRepositoryProvider = Provider<DashboardRepository>((ref) {
  return DashboardRepositoryImpl(database: ref.watch(databaseProvider));
});

final getDashboardDataUseCaseProvider = Provider<GetDashboardDataUseCase>((ref) {
  return GetDashboardDataUseCase(ref.watch(dashboardRepositoryProvider));
});

// AsyncNotifier for auto-loading dashboard data
final dashboardDataProvider = FutureProvider<DashboardData>((ref) async {
  final useCase = ref.watch(getDashboardDataUseCaseProvider);
  final result = await useCase();
  return result.fold(
    onSuccess: (data) => data,
    onFailure: (failure) => throw Exception(failure.message),
  );
});