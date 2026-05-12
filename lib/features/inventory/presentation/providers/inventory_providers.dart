import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sari_store/core/errors/result.dart';
import 'package:sari_store/features/inventory/data/repositories/inventory_repository_impl.dart';
import 'package:sari_store/features/inventory/domain/entities/product.dart';
import 'package:sari_store/features/inventory/domain/entities/category.dart';
import 'package:sari_store/features/inventory/domain/repositories/inventory_repository.dart';
import 'package:sari_store/features/inventory/domain/usecases/get_products_usecase.dart';
import 'package:sari_store/features/inventory/domain/usecases/manage_product_usecase.dart';
import 'package:sari_store/features/inventory/domain/usecases/adjust_stock_usecase.dart';
import 'package:sari_store/features/inventory/domain/usecases/get_categories_usecase.dart';
import 'package:sari_store/features/inventory/domain/usecases/manage_category_usecase.dart';
import 'package:sari_store/shared/providers/database_provider.dart';

// Repo
final inventoryRepositoryProvider = Provider<InventoryRepository>((ref) {
  return InventoryRepositoryImpl(database: ref.watch(databaseProvider));
});

// Use cases
final getProductsUseCaseProvider = Provider<GetProductsUseCase>(
    (ref) => GetProductsUseCase(ref.watch(inventoryRepositoryProvider)));
final manageProductUseCaseProvider = Provider<ManageProductUseCase>(
    (ref) => ManageProductUseCase(ref.watch(inventoryRepositoryProvider)));
final adjustStockUseCaseProvider = Provider<AdjustStockUseCase>(
    (ref) => AdjustStockUseCase(ref.watch(inventoryRepositoryProvider)));
final getCategoriesUseCaseProvider = Provider<GetCategoriesUseCase>(
    (ref) => GetCategoriesUseCase(ref.watch(inventoryRepositoryProvider)));
final manageCategoryUseCaseProvider = Provider<ManageCategoryUseCase>(
    (ref) => ManageCategoryUseCase(ref.watch(inventoryRepositoryProvider)));

// Products list provider (auto-refresh)
final productsProvider = FutureProvider.family<List<Product>, String>((ref, filter) async {
  final useCase = ref.watch(getProductsUseCaseProvider);
  final activeOnly = filter == 'active' ? true : null; // 'all' or 'active'
  final result = await useCase(activeOnly: activeOnly);
  return result.fold(
    onSuccess: (data) => data,
    onFailure: (failure) => throw Exception(failure.message),
  );
});

// Categories provider
final categoriesProvider = FutureProvider<List<Category>>((ref) async {
  final useCase = ref.watch(getCategoriesUseCaseProvider);
  final result = await useCase();
  return result.fold(
    onSuccess: (data) => data,
    onFailure: (failure) => throw Exception(failure.message),
  );
});