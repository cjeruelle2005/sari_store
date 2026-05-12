// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InventoryReportImpl _$$InventoryReportImplFromJson(
        Map<String, dynamic> json) =>
    _$InventoryReportImpl(
      totalProducts: (json['totalProducts'] as num).toInt(),
      activeProducts: (json['activeProducts'] as num).toInt(),
      lowStockProducts: (json['lowStockProducts'] as num).toInt(),
      totalInventoryValue: (json['totalInventoryValue'] as num).toDouble(),
    );

Map<String, dynamic> _$$InventoryReportImplToJson(
        _$InventoryReportImpl instance) =>
    <String, dynamic>{
      'totalProducts': instance.totalProducts,
      'activeProducts': instance.activeProducts,
      'lowStockProducts': instance.lowStockProducts,
      'totalInventoryValue': instance.totalInventoryValue,
    };
