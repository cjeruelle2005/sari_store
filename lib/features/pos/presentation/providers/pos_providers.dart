import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sari_store/features/inventory/domain/entities/product.dart';
import 'package:sari_store/features/pos/data/repositories/pos_repository_impl.dart';
import 'package:sari_store/features/pos/domain/entities/cart_item.dart';
import 'package:sari_store/features/pos/domain/repositories/pos_repository.dart';
import 'package:sari_store/features/pos/domain/usecases/scan_barcode_usecase.dart';
import 'package:sari_store/features/pos/domain/usecases/search_products_usecase.dart';
import 'package:sari_store/features/pos/domain/usecases/complete_transaction_usecase.dart';
import 'package:sari_store/shared/providers/database_provider.dart';

// Repo
final posRepositoryProvider = Provider<PosRepository>((ref) {
  return PosRepositoryImpl(database: ref.watch(databaseProvider));
});

// Use cases
final scanBarcodeUseCaseProvider = Provider((ref) => ScanBarcodeUseCase(ref.watch(posRepositoryProvider)));
final searchProductsUseCaseProvider = Provider((ref) => SearchProductsUseCase(ref.watch(posRepositoryProvider)));
final completeTransactionUseCaseProvider = Provider((ref) => CompleteTransactionUseCase(ref.watch(posRepositoryProvider)));

// Cart state
final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>((ref) => CartNotifier());

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  void addItem(Product product, {int quantity = 1}) {
    final index = state.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      final existing = state[index];
      state = [
        for (int i = 0; i < state.length; i++)
          if (i == index)
            existing.copyWith(quantity: existing.quantity + quantity)
          else
            state[i],
      ];
    } else {
      state = [...state, CartItem(product: product, quantity: quantity, discount: 0)];
    }
  }

  void updateQuantity(int productId, int quantity) {
    if (quantity <= 0) {
      removeItem(productId);
      return;
    }
    state = state
        .map((item) => item.product.id == productId ? item.copyWith(quantity: quantity) : item)
        .toList();
  }

  void updateItemDiscount(int productId, double discount) {
    state = state
        .map((item) => item.product.id == productId ? item.copyWith(discount: discount) : item)
        .toList();
  }

  void removeItem(int productId) {
    state = state.where((item) => item.product.id != productId).toList();
  }

  void clearCart() {
    state = [];
  }

  double get subtotal => state.fold(0, (sum, item) => sum + (item.product.sellingPrice * item.quantity));
  double get totalDiscount => state.fold(0, (sum, item) => sum + item.discount);
  double get total => subtotal - totalDiscount;
}

// Additional transaction-level state
final transactionDiscountProvider = StateProvider<double>((ref) => 0.0);
final paymentReceivedProvider = StateProvider<double>((ref) => 0.0);
final paymentMethodProvider = StateProvider<String>((ref) => 'cash');
final isProcessingTransactionProvider = StateProvider<bool>((ref) => false);