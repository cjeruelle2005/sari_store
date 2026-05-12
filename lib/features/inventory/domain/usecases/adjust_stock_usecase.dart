import 'package:sari_store/core/errors/result.dart';
import 'package:sari_store/features/inventory/domain/repositories/inventory_repository.dart';

class AdjustStockUseCase {
  final InventoryRepository repository;
  AdjustStockUseCase(this.repository);

  Future<Result<void>> call(int productId, int quantityChange, String reason) =>
      repository.adjustStock(productId, quantityChange, reason);
}