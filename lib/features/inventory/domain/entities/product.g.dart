// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      barcode: json['barcode'] as String?,
      sku: json['sku'] as String?,
      categoryId: (json['categoryId'] as num?)?.toInt(),
      categoryName: json['categoryName'] as String?,
      imagePath: json['imagePath'] as String?,
      costPrice: (json['costPrice'] as num).toDouble(),
      sellingPrice: (json['sellingPrice'] as num).toDouble(),
      stockQuantity: (json['stockQuantity'] as num).toInt(),
      lowStockThreshold: (json['lowStockThreshold'] as num).toInt(),
      isActive: json['isActive'] as bool,
      expirationDate: json['expirationDate'] == null
          ? null
          : DateTime.parse(json['expirationDate'] as String),
      supplier: json['supplier'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'barcode': instance.barcode,
      'sku': instance.sku,
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'imagePath': instance.imagePath,
      'costPrice': instance.costPrice,
      'sellingPrice': instance.sellingPrice,
      'stockQuantity': instance.stockQuantity,
      'lowStockThreshold': instance.lowStockThreshold,
      'isActive': instance.isActive,
      'expirationDate': instance.expirationDate?.toIso8601String(),
      'supplier': instance.supplier,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
