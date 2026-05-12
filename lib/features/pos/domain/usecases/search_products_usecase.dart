import 'package:sari_store/core/errors/result.dart';
import 'package:sari_store/features/inventory/domain/entities/product.dart';
import 'package:sari_store/features/pos/domain/repositories/pos_repository.dart';

class SearchProductsUseCase {
  final PosRepository repository;
  SearchProductsUseCase(this.repository);
  Future<Result<List<Product>>> call(String query) => repository.searchProducts(query);
}