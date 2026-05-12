// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'utang_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UtangTransactionImpl _$$UtangTransactionImplFromJson(
        Map<String, dynamic> json) =>
    _$UtangTransactionImpl(
      id: (json['id'] as num).toInt(),
      customerId: (json['customerId'] as num).toInt(),
      type: $enumDecode(_$UtangTypeEnumMap, json['type']),
      amount: (json['amount'] as num).toDouble(),
      balanceAfter: (json['balanceAfter'] as num).toDouble(),
      notes: json['notes'] as String?,
      transactionDate: DateTime.parse(json['transactionDate'] as String),
    );

Map<String, dynamic> _$$UtangTransactionImplToJson(
        _$UtangTransactionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customerId': instance.customerId,
      'type': _$UtangTypeEnumMap[instance.type]!,
      'amount': instance.amount,
      'balanceAfter': instance.balanceAfter,
      'notes': instance.notes,
      'transactionDate': instance.transactionDate.toIso8601String(),
    };

const _$UtangTypeEnumMap = {
  UtangType.borrow: 'borrow',
  UtangType.payment: 'payment',
};
