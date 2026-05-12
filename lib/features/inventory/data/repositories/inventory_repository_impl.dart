import 'package:sari_store/core/errors/result.dart';
import 'package:sari_store/core/errors/failures.dart';
import 'package:sari_store/core/logger/app_logger.dart';
import 'package:sari_store/features/inventory/domain/entities/product.dart';
import 'package:sari_store/features/inventory/domain/entities/category.dart';
import 'package:sari_store/features/inventory/domain/repositories/inventory_repository.dart';
import 'package:sari_store/shared/data/database/app_database.dart';
import 'package:sari_store/shared/data/database/tables.dart';

class InventoryRepositoryImpl implements InventoryRepository {
  final AppDatabase _db;

  InventoryRepositoryImpl({required AppDatabase database}) : _db = database;

  // ---------------- Products ----------------
  @override
  Future<Result<List<Product>>> getProducts({bool? activeOnly, int? categoryId}) async {
    try {
      var query = _db.select(_db.products);
      if (activeOnly == true) {
        query = query..where((t) => t.isActive.equals(true));
      }
      if (categoryId != null) {
        query = query..where((t) => t.categoryId.equals(categoryId));
      }
      final rows = await query.get();
      final products = await Future.wait(rows.map((r) => _mapProduct(r)));
      return Result.success(products);
    } catch (e, stack) {
      AppLogger.error('Failed to get products', e, stack);
      return Result.failure(Failure.database(message: 'Failed to fetch products'));
    }
  }

  @override
  Future<Result<Product?>> getProductById(int id) async {
    try {
      final row = await _db.productDao.getProductById(id);
      if (row == null) return const Result.success(null);
      return Result.success(await _mapProduct(row));
    } catch (e, stack) {
      AppLogger.error('Failed to get product by id', e, stack);
      return Result.failure(Failure.database(message: 'Failed to fetch product'));
    }
  }

  @override
  Future<Result<Product?>> getProductByBarcode(String barcode) async {
    try {
      final row = await _db.productDao.getProductByBarcode(barcode);
      if (row == null) return const Result.success(null);
      return Result.success(await _mapProduct(row));
    } catch (e, stack) {
      AppLogger.error('Failed to get product by barcode', e, stack);
      return Result.failure(Failure.database(message: 'Failed to fetch product'));
    }
  }

  @override
  Future<Result<Product>> createProduct(Product product) async {
    try {
      final companion = ProductsCompanion.insert(
        name: product.name,
        barcode: Value(product.barcode),
        sku: Value(product.sku),
        categoryId: Value(product.categoryId),
        imagePath: Value(product.imagePath),
        costPrice: product.costPrice,
        sellingPrice: product.sellingPrice,
        stockQuantity: product.stockQuantity,
        lowStockThreshold: product.lowStockThreshold,
        isActive: product.isActive,
        expirationDate: Value(product.expirationDate),
        supplier: Value(product.supplier),
        createdAt: product.createdAt,
        updatedAt: product.updatedAt,
      );
      final id = await _db.productDao.insertProduct(companion);
      final created = await _db.productDao.getProductById(id);
      return Result.success(await _mapProduct(created!));
    } catch (e, stack) {
      AppLogger.error('Failed to create product', e, stack);
      return Result.failure(Failure.database(message: 'Failed to create product'));
    }
  }

  @override
  Future<Result<Product>> updateProduct(Product product) async {
    try {
      // Use replace via DAO
      await _db.productDao.updateProduct(
        ProductsCompanion(
          id: Value(product.id),
          name: Value(product.name),
          barcode: Value(product.barcode),
          sku: Value(product.sku),
          categoryId: Value(product.categoryId),
          imagePath: Value(product.imagePath),
          costPrice: Value(product.costPrice),
          sellingPrice: Value(product.sellingPrice),
          stockQuantity: Value(product.stockQuantity),
          lowStockThreshold: Value(product.lowStockThreshold),
          isActive: Value(product.isActive),
          expirationDate: Value(product.expirationDate),
          supplier: Value(product.supplier),
          updatedAt: Value(DateTime.now()),
        ),
      );
      final updated = await _db.productDao.getProductById(product.id);
      return Result.success(await _mapProduct(updated!));
    } catch (e, stack) {
      AppLogger.error('Failed to update product', e, stack);
      return Result.failure(Failure.database(message: 'Failed to update product'));
    }
  }

  @override
  Future<Result<void>> deleteProduct(int id) async {
    try {
      await _db.productDao.deleteProduct(id);
      return const Result.success(null);
    } catch (e, stack) {
      AppLogger.error('Failed to delete product', e, stack);
      return Result.failure(Failure.database(message: 'Failed to delete product'));
    }
  }

  @override
  Future<Result<void>> adjustStock(int productId, int quantityChange, String reason) async {
    try {
      final productRow = await _db.productDao.getProductById(productId);
      if (productRow == null) {
        return const Result.failure(Failure.notFound(message: 'Product not found'));
      }
      final newQty = productRow.stockQuantity + quantityChange;
      if (newQty < 0) {
        return const Result.failure(Failure.validation(message: 'Insufficient stock'));
      }

      await _db.transaction(() async {
        // Update product stock
        await (_db.update(_db.products)
              ..where((t) => t.id.equals(productId)))
            .write(ProductsCompanion(stockQuantity: Value(newQty)));

        // Log movement
        await _db.productDao.insertMovement(
          InventoryMovementsCompanion.insert(
            productId: productId,
            movementType: quantityChange > 0 ? 'IN' : 'OUT',
            quantity: quantityChange.abs(),
            reason: reason,
            createdAt: DateTime.now(),
          ),
        );
      });
      return const Result.success(null);
    } catch (e, stack) {
      AppLogger.error('Failed to adjust stock', e, stack);
      return Result.failure(Failure.database(message: 'Failed to adjust stock'));
    }
  }

  // ---------------- Categories ----------------
  @override
  Future<Result<List<Category>>> getCategories() async {
    try {
      final rows = await _db.categoryDao.getAllCategories();
      return Result.success(rows.map((r) => Category(
        id: r.id,
        name: r.name,
        description: r.description,
        parentCategoryId: r.parentCategoryId,
      )).toList());
    } catch (e, stack) {
      AppLogger.error('Failed to get categories', e, stack);
      return Result.failure(Failure.database(message: 'Failed to fetch categories'));
    }
  }

  @override
  Future<Result<Category>> createCategory(String name, {String? description, int? parentId}) async {
    try {
      final id = await _db.categoryDao.insertCategory(CategoriesCompanion.insert(
        name: name,
        description: Value(description),
        parentCategoryId: Value(parentId),
      ));
      final created = await _db.categoryDao.getCategoryById(id);
      return Result.success(Category(
        id: created!.id,
        name: created.name,
        description: created.description,
        parentCategoryId: created.parentCategoryId,
      ));
    } catch (e, stack) {
      AppLogger.error('Failed to create category', e, stack);
      return Result.failure(Failure.database(message: 'Failed to create category'));
    }
  }

  @override
  Future<Result<Category>> updateCategory(Category category) async {
    try {
      await _db.categoryDao.updateCategory(CategoriesCompanion(
        id: Value(category.id),
        name: Value(category.name),
        description: Value(category.description),
        parentCategoryId: Value(category.parentCategoryId),
      ));
      final updated = await _db.categoryDao.getCategoryById(category.id);
      return Result.success(Category(
        id: updated!.id,
        name: updated.name,
        description: updated.description,
        parentCategoryId: updated.parentCategoryId,
      ));
    } catch (e, stack) {
      AppLogger.error('Failed to update category', e, stack);
      return Result.failure(Failure.database(message: 'Failed to update category'));
    }
  }

  @override
  Future<Result<void>> deleteCategory(int id) async {
    try {
      await _db.categoryDao.deleteCategory(id);
      return const Result.success(null);
    } catch (e, stack) {
      AppLogger.error('Failed to delete category', e, stack);
      return Result.failure(Failure.database(message: 'Failed to delete category'));
    }
  }

  // Helper mapping
  Future<Product> _mapProduct(ProductData row) async {
    String? categoryName;
    if (row.categoryId != null) {
      final cat = await _db.categoryDao.getCategoryById(row.categoryId!);
      categoryName = cat?.name;
    }
    return Product(
      id: row.id,
      name: row.name,
      barcode: row.barcode,
      sku: row.sku,
      categoryId: row.categoryId,
      categoryName: categoryName,
      imagePath: row.imagePath,
      costPrice: row.costPrice,
      sellingPrice: row.sellingPrice,
      stockQuantity: row.stockQuantity,
      lowStockThreshold: row.lowStockThreshold,
      isActive: row.isActive,
      expirationDate: row.expirationDate,
      supplier: row.supplier,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }
}