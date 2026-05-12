import 'package:sari_store/core/errors/result.dart';
import 'package:sari_store/features/dashboard/domain/entities/dashboard_data.dart';
import 'package:sari_store/features/dashboard/domain/repositories/dashboard_repository.dart';

class GetDashboardDataUseCase {
  final DashboardRepository repository;

  GetDashboardDataUseCase(this.repository);

  Future<Result<DashboardData>> call() => repository.getDashboardData();
}