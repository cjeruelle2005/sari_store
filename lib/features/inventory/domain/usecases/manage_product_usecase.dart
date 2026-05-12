import 'package:sari_store/core/errors/result.dart';
import 'package:sari_store/core/errors/failures.dart';
import 'package:sari_store/features/inventory/domain/entities/product.dart';
import 'package:sari_store/features/inventory/domain/repositories/inventory_repository.dart';

class ManageProductUseCase {
  final InventoryRepository repository;
  ManageProductUseCase(this.repository);

  Future<Result<Product>> create(Product product) async {
    if (product.name.trim().isEmpty) {
      return Result.failure(const Failure.validation(message: 'Product name is required', field: 'name'));
    }
    if (product.sellingPrice <= 0) {
      return Result.failure(const Failure.validation(message: 'Selling price must be greater than zero', field: 'sellingPrice'));
    }
    return repository.createProduct(product);
  }

  Future<Result<Product>> update(Product product) async {
    if (product.name.trim().isEmpty) {
      return Result.failure(const Failure.validation(message: 'Product name is required', field: 'name'));
    }
    if (product.sellingPrice <= 0) {
      return Result.failure(const Failure.validation(message: 'Selling price must be greater than zero', field: 'sellingPrice'));
    }
    return repository.updateProduct(product);
  }

  Future<Result<void>> delete(int id) => repository.deleteProduct(id);
}