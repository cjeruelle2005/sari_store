import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_report.freezed.dart';
part 'expense_report.g.dart';

@freezed
class ExpenseReport with _$ExpenseReport {
  const factory ExpenseReport({
    required DateTime from,
    required DateTime to,
    required double totalExpenses,
    required List<CategoryExpense> categoryBreakdown,
  }) = _ExpenseReport;

  factory ExpenseReport.fromJson(Map<String, dynamic> json) =>
      _$ExpenseReportFromJson(json);
}

@freezed
class CategoryExpense with _$CategoryExpense {
  const factory CategoryExpense({
    required String categoryName,
    required double totalAmount,
    required int count,
  }) = _CategoryExpense;

  factory CategoryExpense.fromJson(Map<String, dynamic> json) =>
      _$CategoryExpenseFromJson(json);
}