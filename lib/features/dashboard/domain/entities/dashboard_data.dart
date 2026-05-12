import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_data.freezed.dart';
part 'dashboard_data.g.dart';

@freezed
class DashboardData with _$DashboardData {
  const factory DashboardData({
    required double dailySales,
    required double monthlySales,
    required double totalRevenue, // All-time sales sum (or month? We'll use month-to-date.)
    required double totalExpenses,
    required int lowStockCount,
    required List<BestSeller> bestSellers,
    required List<RecentTransaction> recentTransactions,
  }) = _DashboardData;

  factory DashboardData.fromJson(Map<String, dynamic> json) => _$DashboardDataFromJson(json);
}

@freezed
class BestSeller with _$BestSeller {
  const factory BestSeller({
    required String productName,
    required int quantitySold,
    required double totalAmount,
  }) = _BestSeller;

  factory BestSeller.fromJson(Map<String, dynamic> json) => _$BestSellerFromJson(json);
}

@freezed
class RecentTransaction with _$RecentTransaction {
  const factory RecentTransaction({
    required int id,
    required String invoiceNumber,
    required double totalAmount,
    required DateTime date,
    required String cashierName,
    required int itemCount,
  }) = _RecentTransaction;

  factory RecentTransaction.fromJson(Map<String, dynamic> json) => _$RecentTransactionFromJson(json);
}