import 'package:freezed_annotation/freezed_annotation.dart';

part 'utang_report.freezed.dart';
part 'utang_report.g.dart';

@freezed
class UtangReport with _$UtangReport {
  const factory UtangReport({
    required int totalCustomers,
    required double totalOutstandingBalance,
    required List<CustomerBalance> topDebtors,
  }) = _UtangReport;

  factory UtangReport.fromJson(Map<String, dynamic> json) =>
      _$UtangReportFromJson(json);
}

@freezed
class CustomerBalance with _$CustomerBalance {
  const factory CustomerBalance({
    required String customerName,
    required double balance,
  }) = _CustomerBalance;

  factory CustomerBalance.fromJson(Map<String, dynamic> json) =>
      _$CustomerBalanceFromJson(json);
}