// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionSummaryImpl _$$TransactionSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionSummaryImpl(
      subtotal: (json['subtotal'] as num).toDouble(),
      discount: (json['discount'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      paymentReceived: (json['paymentReceived'] as num).toDouble(),
      change: (json['change'] as num).toDouble(),
    );

Map<String, dynamic> _$$TransactionSummaryImplToJson(
        _$TransactionSummaryImpl instance) =>
    <String, dynamic>{
      'subtotal': instance.subtotal,
      'discount': instance.discount,
      'total': instance.total,
      'paymentReceived': instance.paymentReceived,
      'change': instance.change,
    };
