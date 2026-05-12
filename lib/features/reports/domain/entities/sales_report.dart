import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_report.freezed.dart';
part 'sales_report.g.dart';

@freezed
class SalesReport with _$SalesReport {
  const factory SalesReport({
    required DateTime from,
    required DateTime to,
    required double totalSales,
    required int totalTransactions,
    required double averageTransaction,
    required List<DailySales> dailyBreakdown,
    required List<ProductSales> topProducts,
  }) = _SalesReport;

  factory SalesReport.fromJson(Map<String, dynamic> json) =>
      _$SalesReportFromJson(json);
}

@freezed
class DailySales with _$DailySales {
  const factory DailySales({
    required DateTime date,
    required double total,
    required int transactions,
  }) = _DailySales;

  factory DailySales.fromJson(Map<String, dynamic> json) =>
      _$DailySalesFromJson(json);
}

@freezed
class ProductSales with _$ProductSales {
  const factory ProductSales({
    required String productName,
    required int quantitySold,
    required double totalAmount,
  }) = _ProductSales;

  factory ProductSales.fromJson(Map<String, dynamic> json) =>
      _$ProductSalesFromJson(json);
}