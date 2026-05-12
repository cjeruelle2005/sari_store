import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required int id,
    required String name,
    String? barcode,
    String? sku,
    int? categoryId,
    String? categoryName,
    String? imagePath,
    required double costPrice,
    required double sellingPrice,
    required int stockQuantity,
    required int lowStockThreshold,
    required bool isActive,
    DateTime? expirationDate,
    String? supplier,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}