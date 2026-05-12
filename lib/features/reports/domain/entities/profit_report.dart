import 'package:freezed_annotation/freezed_annotation.dart';

part 'profit_report.freezed.dart';
part 'profit_report.g.dart';

@freezed
class ProfitReport with _$ProfitReport {
  const factory ProfitReport({
    required DateTime from,
    required DateTime to,
    required double totalRevenue,
    required double totalCost,
    required double grossProfit,
    required double totalExpenses,
    required double netProfit,
  }) = _ProfitReport;

  factory ProfitReport.fromJson(Map<String, dynamic> json) =>
      _$ProfitReportFromJson(json);
}