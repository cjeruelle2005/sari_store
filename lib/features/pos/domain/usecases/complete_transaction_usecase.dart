import 'package:sari_store/core/errors/result.dart';
import 'package:sari_store/core/errors/failures.dart';
import 'package:sari_store/features/pos/domain/entities/cart_item.dart';
import 'package:sari_store/features/pos/domain/repositories/pos_repository.dart';

class CompleteTransactionUseCase {
  final PosRepository repository;
  CompleteTransactionUseCase(this.repository);

  Future<Result<int>> call({
    required List<CartItem> items,
    required double discount,
    required double paymentReceived,
    required String paymentMethod,
    required int cashierId,
  }) async {
    if (items.isEmpty) {
      return const Result.failure(Failure.validation(message: 'Cart is empty'));
    }
    final subtotal = items.fold<double>(0, (s, i) => s + i.totalPrice);
    final total = subtotal - discount;
    if (total < 0) {
      return const Result.failure(Failure.validation(message: 'Total cannot be negative'));
    }
    if (paymentReceived < total) {
      return const Result.failure(Failure.validation(message: 'Insufficient payment'));
    }
    return repository.completeTransaction(
      items: items,
      discount: discount,
      paymentReceived: paymentReceived,
      paymentMethod: paymentMethod,
      cashierId: cashierId,
    );
  }
}