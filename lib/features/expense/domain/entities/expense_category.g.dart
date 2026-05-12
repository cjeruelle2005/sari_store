// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExpenseCategoryImpl _$$ExpenseCategoryImplFromJson(
        Map<String, dynamic> json) =>
    _$ExpenseCategoryImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$ExpenseCategoryImplToJson(
        _$ExpenseCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };
