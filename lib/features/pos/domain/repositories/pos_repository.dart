import 'package:sari_store/core/errors/result.dart';
import 'package:sari_store/features/inventory/domain/entities/product.dart';
import 'package:sari_store/features/pos/domain/entities/cart_item.dart';

abstract class PosRepository {
  Future<Result<Product?>> scanBarcode(String barcode);
  Future<Result<List<Product>>> searchProducts(String query);
  Future<Result<int>> completeTransaction({
    required List<CartItem> items,
    required double discount,
    required double paymentReceived,
    required String paymentMethod,
    required int cashierId,
  });
}