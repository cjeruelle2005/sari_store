import 'package:sari_store/core/errors/result.dart';
import 'package:sari_store/features/inventory/domain/entities/product.dart';
import 'package:sari_store/features/inventory/domain/repositories/inventory_repository.dart';

class GetProductsUseCase {
  final InventoryRepository repository;
  GetProductsUseCase(this.repository);

  Future<Result<List<Product>>> call({bool? activeOnly, int? categoryId}) =>
      repository.getProducts(activeOnly: activeOnly, categoryId: categoryId);
}