// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExpenseImpl _$$ExpenseImplFromJson(Map<String, dynamic> json) =>
    _$ExpenseImpl(
      id: (json['id'] as num).toInt(),
      categoryId: (json['categoryId'] as num).toInt(),
      categoryName: json['categoryName'] as String?,
      description: json['description'] as String,
      amount: (json['amount'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
      paymentMethod: json['paymentMethod'] as String,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$ExpenseImplToJson(_$ExpenseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'description': instance.description,
      'amount': instance.amount,
      'date': instance.date.toIso8601String(),
      'paymentMethod': instance.paymentMethod,
      'notes': instance.notes,
    };
