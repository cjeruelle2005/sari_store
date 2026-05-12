// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SalesReportImpl _$$SalesReportImplFromJson(Map<String, dynamic> json) =>
    _$SalesReportImpl(
      from: DateTime.parse(json['from'] as String),
      to: DateTime.parse(json['to'] as String),
      totalSales: (json['totalSales'] as num).toDouble(),
      totalTransactions: (json['totalTransactions'] as num).toInt(),
      averageTransaction: (json['averageTransaction'] as num).toDouble(),
      dailyBreakdown: (json['dailyBreakdown'] as List<dynamic>)
          .map((e) => DailySales.fromJson(e as Map<String, dynamic>))
          .toList(),
      topProducts: (json['topProducts'] as List<dynamic>)
          .map((e) => ProductSales.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SalesReportImplToJson(_$SalesReportImpl instance) =>
    <String, dynamic>{
      'from': instance.from.toIso8601String(),
      'to': instance.to.toIso8601String(),
      'totalSales': instance.totalSales,
      'totalTransactions': instance.totalTransactions,
      'averageTransaction': instance.averageTransaction,
      'dailyBreakdown': instance.dailyBreakdown,
      'topProducts': instance.topProducts,
    };

_$DailySalesImpl _$$DailySalesImplFromJson(Map<String, dynamic> json) =>
    _$DailySalesImpl(
      date: DateTime.parse(json['date'] as String),
      total: (json['total'] as num).toDouble(),
      transactions: (json['transactions'] as num).toInt(),
    );

Map<String, dynamic> _$$DailySalesImplToJson(_$DailySalesImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'total': instance.total,
      'transactions': instance.transactions,
    };

_$ProductSalesImpl _$$ProductSalesImplFromJson(Map<String, dynamic> json) =>
    _$ProductSalesImpl(
      productName: json['productName'] as String,
      quantitySold: (json['quantitySold'] as num).toInt(),
      totalAmount: (json['totalAmount'] as num).toDouble(),
    );

Map<String, dynamic> _$$ProductSalesImplToJson(_$ProductSalesImpl instance) =>
    <String, dynamic>{
      'productName': instance.productName,
      'quantitySold': instance.quantitySold,
      'totalAmount': instance.totalAmount,
    };
