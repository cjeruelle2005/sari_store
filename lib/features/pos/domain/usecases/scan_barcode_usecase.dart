import 'package:sari_store/core/errors/result.dart';
import 'package:sari_store/features/inventory/domain/entities/product.dart';
import 'package:sari_store/features/pos/domain/repositories/pos_repository.dart';

class ScanBarcodeUseCase {
  final PosRepository repository;
  ScanBarcodeUseCase(this.repository);
  Future<Result<Product?>> call(String barcode) => repository.scanBarcode(barcode);
}