import 'package:sari_store/core/errors/result.dart';
import 'package:sari_store/features/dashboard/domain/entities/dashboard_data.dart';

abstract class DashboardRepository {
  /// Fetches all dashboard statistics for the current date context.
  Future<Result<DashboardData>> getDashboardData();
}