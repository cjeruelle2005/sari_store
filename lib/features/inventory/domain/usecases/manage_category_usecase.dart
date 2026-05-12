import 'package:sari_store/core/errors/result.dart';
import 'package:sari_store/core/errors/failures.dart';
import 'package:sari_store/features/inventory/domain/entities/category.dart';
import 'package:sari_store/features/inventory/domain/repositories/inventory_repository.dart';

class ManageCategoryUseCase {
  final InventoryRepository repository;
  ManageCategoryUseCase(this.repository);

  Future<Result<Category>> create(String name, {String? description, int? parentId}) async {
    if (name.trim().isEmpty) {
      return Result.failure(const Failure.validation(message: 'Category name is required'));
    }
    return repository.createCategory(name.trim(), description: description, parentId: parentId);
  }

  Future<Result<Category>> update(Category category) => repository.updateCategory(category);
  Future<Result<void>> delete(int id) => repository.deleteCategory(id);
}