// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profit_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfitReportImpl _$$ProfitReportImplFromJson(Map<String, dynamic> json) =>
    _$ProfitReportImpl(
      from: DateTime.parse(json['from'] as String),
      to: DateTime.parse(json['to'] as String),
      totalRevenue: (json['totalRevenue'] as num).toDouble(),
      totalCost: (json['totalCost'] as num).toDouble(),
      grossProfit: (json['grossProfit'] as num).toDouble(),
      totalExpenses: (json['totalExpenses'] as num).toDouble(),
      netProfit: (json['netProfit'] as num).toDouble(),
    );

Map<String, dynamic> _$$ProfitReportImplToJson(_$ProfitReportImpl instance) =>
    <String, dynamic>{
      'from': instance.from.toIso8601String(),
      'to': instance.to.toIso8601String(),
      'totalRevenue': instance.totalRevenue,
      'totalCost': instance.totalCost,
      'grossProfit': instance.grossProfit,
      'totalExpenses': instance.totalExpenses,
      'netProfit': instance.netProfit,
    };
