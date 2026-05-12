import 'package:sari_store/core/errors/result.dart';
import 'package:sari_store/features/inventory/domain/entities/category.dart';
import 'package:sari_store/features/inventory/domain/repositories/inventory_repository.dart';

class GetCategoriesUseCase {
  final InventoryRepository repository;
  GetCategoriesUseCase(this.repository);

  Future<Result<List<Category>>> call() => repository.getCategories();
}