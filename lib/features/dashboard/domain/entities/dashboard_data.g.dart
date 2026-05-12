// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardDataImpl _$$DashboardDataImplFromJson(Map<String, dynamic> json) =>
    _$DashboardDataImpl(
      dailySales: (json['dailySales'] as num).toDouble(),
      monthlySales: (json['monthlySales'] as num).toDouble(),
      totalRevenue: (json['totalRevenue'] as num).toDouble(),
      totalExpenses: (json['totalExpenses'] as num).toDouble(),
      lowStockCount: (json['lowStockCount'] as num).toInt(),
      bestSellers: (json['bestSellers'] as List<dynamic>)
          .map((e) => BestSeller.fromJson(e as Map<String, dynamic>))
          .toList(),
      recentTransactions: (json['recentTransactions'] as List<dynamic>)
          .map((e) => RecentTransaction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DashboardDataImplToJson(_$DashboardDataImpl instance) =>
    <String, dynamic>{
      'dailySales': instance.dailySales,
      'monthlySales': instance.monthlySales,
      'totalRevenue': instance.totalRevenue,
      'totalExpenses': instance.totalExpenses,
      'lowStockCount': instance.lowStockCount,
      'bestSellers': instance.bestSellers,
      'recentTransactions': instance.recentTransactions,
    };

_$BestSellerImpl _$$BestSellerImplFromJson(Map<String, dynamic> json) =>
    _$BestSellerImpl(
      productName: json['productName'] as String,
      quantitySold: (json['quantitySold'] as num).toInt(),
      totalAmount: (json['totalAmount'] as num).toDouble(),
    );

Map<String, dynamic> _$$BestSellerImplToJson(_$BestSellerImpl instance) =>
    <String, dynamic>{
      'productName': instance.productName,
      'quantitySold': instance.quantitySold,
      'totalAmount': instance.totalAmount,
    };

_$RecentTransactionImpl _$$RecentTransactionImplFromJson(
        Map<String, dynamic> json) =>
    _$RecentTransactionImpl(
      id: (json['id'] as num).toInt(),
      invoiceNumber: json['invoiceNumber'] as String,
      totalAmount: (json['totalAmount'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
      cashierName: json['cashierName'] as String,
      itemCount: (json['itemCount'] as num).toInt(),
    );

Map<String, dynamic> _$$RecentTransactionImplToJson(
        _$RecentTransactionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'invoiceNumber': instance.invoiceNumber,
      'totalAmount': instance.totalAmount,
      'date': instance.date.toIso8601String(),
      'cashierName': instance.cashierName,
      'itemCount': instance.itemCount,
    };
