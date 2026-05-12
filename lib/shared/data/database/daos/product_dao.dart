import 'package:drift/drift.dart';
import '../tables.dart';
import '../app_database.dart';

part 'product_dao.g.dart';

@DriftAccessor(tables: [Products, InventoryMovements])
class ProductDao extends DatabaseAccessor<AppDatabaseBase> with _$ProductDaoMixin {
  ProductDao(super.db);

  // Basic CRUD
  Future<List<ProductData>> getAllProducts({bool activeOnly = false}) {
    var query = select(products);
    if (activeOnly) {
      query = query..where((t) => t.isActive.equals(true));
    }
    return query.get();
  }

  Future<ProductData?> getProductById(int id) =>
      (select(products)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<ProductData?> getProductByBarcode(String barcode) =>
      (select(products)..where((t) => t.barcode.equals(barcode))).getSingleOrNull();

  Future<int> insertProduct(Insertable<ProductData> product) =>
      into(products).insert(product, mode: InsertMode.insertOrReplace);

  Future<bool> updateProduct(Insertable<ProductData> product) =>
      update(products).replace(product);

  Future<int> deleteProduct(int id) =>
      (delete(products)..where((t) => t.id.equals(id))).go();

  // Inventory movement
  Future<int> insertMovement(Insertable<InventoryMovementData> movement) =>
      into(inventoryMovements).insert(movement);

  Future<List<InventoryMovementData>> getMovementsForProduct(int productId) =>
      (select(inventoryMovements)..where((t) => t.productId.equals(productId))).get();
}