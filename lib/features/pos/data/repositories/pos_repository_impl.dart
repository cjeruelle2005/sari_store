import 'package:sari_store/core/errors/result.dart';
import 'package:sari_store/core/errors/failures.dart';
import 'package:sari_store/core/logger/app_logger.dart';
import 'package:sari_store/features/inventory/domain/entities/product.dart';
import 'package:sari_store/features/pos/domain/entities/cart_item.dart';
import 'package:sari_store/features/pos/domain/repositories/pos_repository.dart';
import 'package:sari_store/shared/data/database/app_database.dart';
import 'package:sari_store/shared/data/database/tables.dart';
import 'package:uuid/uuid.dart';

class PosRepositoryImpl implements PosRepository {
  final AppDatabase _db;

  PosRepositoryImpl({required AppDatabase database}) : _db = database;

  @override
  Future<Result<Product?>> scanBarcode(String barcode) async {
    try {
      final row = await _db.productDao.getProductByBarcode(barcode);
      if (row == null || !row.isActive) return const Result.success(null);
      final product = await _mapToProduct(row);
      return Result.success(product);
    } catch (e, stack) {
      AppLogger.error('Barcode scan failed', e, stack);
      return Result.failure(Failure.database(message: 'Failed to scan barcode'));
    }
  }

  @override
  Future<Result<List<Product>>> searchProducts(String query) async {
    try {
      final all = await _db.productDao.getAllProducts(activeOnly: true);
      final filtered = all.where((p) =>
          p.name.toLowerCase().contains(query.toLowerCase()) ||
          (p.barcode ?? '').contains(query)).toList();
      final products = <Product>[];
      for (final row in filtered) {
        products.add(await _mapToProduct(row));
      }
      return Result.success(products);
    } catch (e, stack) {
      AppLogger.error('Product search failed', e, stack);
      return Result.failure(Failure.database(message: 'Failed to search products'));
    }
  }

  @override
  Future<Result<int>> completeTransaction({
    required List<CartItem> items,
    required double discount,
    required double paymentReceived,
    required String paymentMethod,
    required int cashierId,
  }) async {
    try {
      final subtotal = items.fold<double>(0, (sum, i) => sum + (i.product.sellingPrice * i.quantity));
      final totalAmount = subtotal - discount;
      final change = paymentReceived - totalAmount;
      final invoiceNumber = 'INV-${DateTime.now().millisecondsSinceEpoch}';

      late int txId;
      await _db.transaction(() async {
        txId = await _db.transactionDao.insertTransaction(
          TransactionsCompanion.insert(
            transactionDate: DateTime.now(),
            cashierId: cashierId,
            totalAmount: totalAmount,
            discount: discount,
            paymentReceived: paymentReceived,
            changeAmount: change,
            paymentMethod: paymentMethod,
            invoiceNumber: invoiceNumber,
            status: 'completed',
            createdAt: DateTime.now(),
          ),
        );

        for (final item in items) {
          await _db.transactionDao.insertTransactionItem(
            TransactionItemsCompanion.insert(
              transactionId: txId,
              productId: item.product.id,
              quantity: item.quantity,
              unitPrice: item.product.sellingPrice,
              totalPrice: item.totalPrice,
              discount: item.discount,
            ),
          );

          final newStock = item.product.stockQuantity - item.quantity;
          if (newStock < 0) {
            throw Exception('Insufficient stock for ${item.product.name}');
          }

          await (_db.update(_db.products)
                ..where((t) => t.id.equals(item.product.id)))
              .write(ProductsCompanion(stockQuantity: Value(newStock)));

          await _db.productDao.insertMovement(
            InventoryMovementsCompanion.insert(
              productId: item.product.id,
              movementType: 'OUT',
              quantity: item.quantity,
              reason: 'Sale #$txId',
              referenceId: Value(txId),
              createdAt: DateTime.now(),
            ),
          );
        }
      });
      return Result.success(txId);
    } catch (e, stack) {
      AppLogger.error('Transaction failed', e, stack);
      return Result.failure(Failure.database(message: 'Failed to complete transaction'));
    }
  }

  Future<Product> _mapToProduct(ProductData row) async {
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