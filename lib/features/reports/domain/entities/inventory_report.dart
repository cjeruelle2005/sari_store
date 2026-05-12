import 'package:freezed_annotation/freezed_annotation.dart';

part 'inventory_report.freezed.dart';
part 'inventory_report.g.dart';

@freezed
class InventoryReport with _$InventoryReport {
  const factory InventoryReport({
    required int totalProducts,
    required int activeProducts,
    required int lowStockProducts,
    required double totalInventoryValue,
  }) = _InventoryReport;

  factory InventoryReport.fromJson(Map<String, dynamic> json) =>
      _$InventoryReportFromJson(json);
}