// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'utang_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UtangReportImpl _$$UtangReportImplFromJson(Map<String, dynamic> json) =>
    _$UtangReportImpl(
      totalCustomers: (json['totalCustomers'] as num).toInt(),
      totalOutstandingBalance:
          (json['totalOutstandingBalance'] as num).toDouble(),
      topDebtors: (json['topDebtors'] as List<dynamic>)
          .map((e) => CustomerBalance.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UtangReportImplToJson(_$UtangReportImpl instance) =>
    <String, dynamic>{
      'totalCustomers': instance.totalCustomers,
      'totalOutstandingBalance': instance.totalOutstandingBalance,
      'topDebtors': instance.topDebtors,
    };

_$CustomerBalanceImpl _$$CustomerBalanceImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerBalanceImpl(
      customerName: json['customerName'] as String,
      balance: (json['balance'] as num).toDouble(),
    );

Map<String, dynamic> _$$CustomerBalanceImplToJson(
        _$CustomerBalanceImpl instance) =>
    <String, dynamic>{
      'customerName': instance.customerName,
      'balance': instance.balance,
    };
