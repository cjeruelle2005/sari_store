import 'package:sari_store/core/errors/result.dart';
import 'package:sari_store/features/inventory/domain/entities/product.dart';
import 'package:sari_store/features/inventory/domain/entities/category.dart';

abstract class InventoryRepository {
  // Products
  Future<Result<List<Product>>> getProducts({bool? activeOnly, int? categoryId});
  Future<Result<Product?>> getProductById(int id);
  Future<Result<Product?>> getProductByBarcode(String barcode);
  Future<Result<Product>> createProduct(Product product);
  Future<Result<Product>> updateProduct(Product product);
  Future<Result<void>> deleteProduct(int id);
  Future<Result<void>> adjustStock(int productId, int quantityChange, String reason);

  // Categories
  Future<Result<List<Category>>> getCategories();
  Future<Result<Category>> createCategory(String name, {String? description, int? parentId});
  Future<Result<Category>> updateCategory(Category category);
  Future<Result<void>> deleteCategory(int id);
}