// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExpenseReportImpl _$$ExpenseReportImplFromJson(Map<String, dynamic> json) =>
    _$ExpenseReportImpl(
      from: DateTime.parse(json['from'] as String),
      to: DateTime.parse(json['to'] as String),
      totalExpenses: (json['totalExpenses'] as num).toDouble(),
      categoryBreakdown: (json['categoryBreakdown'] as List<dynamic>)
          .map((e) => CategoryExpense.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ExpenseReportImplToJson(_$ExpenseReportImpl instance) =>
    <String, dynamic>{
      'from': instance.from.toIso8601String(),
      'to': instance.to.toIso8601String(),
      'totalExpenses': instance.totalExpenses,
      'categoryBreakdown': instance.categoryBreakdown,
    };

_$CategoryExpenseImpl _$$CategoryExpenseImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoryExpenseImpl(
      categoryName: json['categoryName'] as String,
      totalAmount: (json['totalAmount'] as num).toDouble(),
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$$CategoryExpenseImplToJson(
        _$CategoryExpenseImpl instance) =>
    <String, dynamic>{
      'categoryName': instance.categoryName,
      'totalAmount': instance.totalAmount,
      'count': instance.count,
    };
