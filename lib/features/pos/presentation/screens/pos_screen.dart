// File: lib/features/pos/presentation/screens/pos_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:printing/printing.dart';
import 'package:sari_store/features/auth/presentation/providers/auth_providers.dart';
import 'package:sari_store/features/inventory/domain/entities/product.dart';
import 'package:sari_store/features/inventory/presentation/screens/barcode_scanner_screen.dart';
import 'package:sari_store/features/pos/presentation/providers/pos_providers.dart';
import 'package:sari_store/features/pos/domain/entities/cart_item.dart';
import 'package:sari_store/services/receipt_service.dart';
import 'package:sari_store/shared/providers/database_provider.dart';

class PosScreen extends ConsumerStatefulWidget {
  const PosScreen({super.key});

  @override
  ConsumerState<PosScreen> createState() => _PosScreenState();
}

class _PosScreenState extends ConsumerState<PosScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  List<Product> _searchResults = [];
  bool _searching = false;

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) async {
    if (query.trim().isEmpty) {
      setState(() {
        _searchResults = [];
        _searching = false;
      });
      return;
    }
    setState(() => _searching = true);
    final useCase = ref.read(searchProductsUseCaseProvider);
    final result = await useCase(query);
    result.fold(
      onSuccess: (products) {
        if (mounted) setState(() {
          _searchResults = products;
          _searching = false;
        });
      },
      onFailure: (_) {
        if (mounted) setState(() => _searching = false);
      },
    );
  }

  void _addToCart(Product product) {
    ref.read(cartProvider.notifier).addItem(product);
    _searchController.clear();
    _searchResults = [];
    _searchFocusNode.unfocus();
  }

  Future<void> _scanBarcode() async {
    final barcode = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (_) => const BarcodeScannerScreen()),
    );
    if (barcode == null) return;
    final useCase = ref.read(scanBarcodeUseCaseProvider);
    final result = await useCase(barcode);
    result.fold(
      onSuccess: (product) {
        if (product != null) {
          ref.read(cartProvider.notifier).addItem(product);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Product not found')),
          );
        }
      },
      onFailure: (failure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(failure.message)),
        );
      },
    );
  }

  Future<void> _processPayment() async {
    final cart = ref.read(cartProvider);
    if (cart.isEmpty) return;

    final cartNotifier = ref.read(cartProvider.notifier);
    final discount = ref.read(transactionDiscountProvider);
    final subtotal = cartNotifier.subtotal;
    final total = subtotal - discount;

    final result = await showDialog<PaymentResult>(
      context: context,
      builder: (ctx) => PaymentDialog(total: total),
    );
    if (result == null) return;

    ref.read(isProcessingTransactionProvider.notifier).state = true;
    final useCase = ref.read(completeTransactionUseCaseProvider);
    final currentUser = ref.read(authNotifierProvider).user;
    final res = await useCase(
      items: cart,
      discount: discount,
      paymentReceived: result.amountReceived,
      paymentMethod: result.method,
      cashierId: currentUser!.id,
    );

    ref.read(isProcessingTransactionProvider.notifier).state = false;
    res.fold(
      onSuccess: (transactionId) async {
        cartNotifier.clearCart();
        ref.read(transactionDiscountProvider.notifier).state = 0.0;
        final db = ref.read(databaseProvider);
        final receiptService = ReceiptService(db);
        final receiptResult = await receiptService.generateReceiptPdf(transactionId);
        receiptResult.fold(
          onSuccess: (file) {
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: const Text('Transaction Complete'),
                content: Text('Receipt generated.\nChange: ₱${result.amountReceived - total}'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Close'),
                  ),
                  TextButton(
                    onPressed: () {
                      Printing.sharePdf(bytes: file.readAsBytesSync(), filename: 'receipt_$transactionId.pdf');
                    },
                    child: const Text('Print Receipt'),
                  ),
                ],
              ),
            );
          },
          onFailure: (failure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(failure.message)));
          },
        );
      },
      onFailure: (failure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(failure.message)),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(cartProvider);
    final discount = ref.watch(transactionDiscountProvider);
    final processing = ref.watch(isProcessingTransactionProvider);
    final user = ref.watch(authNotifierProvider).user;
    final cartNotifier = ref.read(cartProvider.notifier);
    final subtotal = cartNotifier.subtotal;
    final total = subtotal - discount;

    return CallbackShortcuts(
      bindings: {
        const SingleActivator(LogicalKeyboardKey.keyF, control: true): () => _searchFocusNode.requestFocus(),
        const SingleActivator(LogicalKeyboardKey.keyB, control: true): _scanBarcode,
        const SingleActivator(LogicalKeyboardKey.enter, control: true): _processPayment,
      },
      child: Scaffold(
        body: Row(
          children: [
            // Left Panel – Cart
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    color: Theme.of(context).colorScheme.primaryContainer,
                    child: Row(
                      children: [
                        const Icon(Icons.store),
                        const SizedBox(width: 8),
                        Text('Sari-Sari Store', style: Theme.of(context).textTheme.titleMedium),
                        const Spacer(),
                        Text(user?.fullName ?? ''),
                      ],
                    ),
                  ),
                  Expanded(
                    child: cart.isEmpty
                        ? const Center(child: Text('No items in cart', style: TextStyle(fontSize: 18)))
                        : ListView.builder(
                            itemCount: cart.length,
                            itemBuilder: (context, index) {
                              final item = cart[index];
                              return ListTile(
                                leading: CircleAvatar(child: Text('${item.quantity}')),
                                title: Text(item.product.name),
                                subtitle: Text('₱${item.product.sellingPrice.toStringAsFixed(2)} each'),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.remove),
                                      onPressed: () => cartNotifier.updateQuantity(item.product.id, item.quantity - 1),
                                    ),
                                    Text('${item.quantity}'),
                                    IconButton(
                                      icon: const Icon(Icons.add),
                                      onPressed: () => cartNotifier.addItem(item.product),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () => cartNotifier.removeItem(item.product.id),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surfaceVariant,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Subtotal'),
                            Text('₱${subtotal.toStringAsFixed(2)}',
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Discount'),
                            TextButton(
                              onPressed: () async {
                                final controller = TextEditingController(text: discount.toStringAsFixed(2));
                                final d = await showDialog<double>(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                    title: const Text('Transaction Discount'),
                                    content: TextField(controller: controller, keyboardType: TextInputType.number),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text('Cancel'),
                                      ),
                                      ElevatedButton(
                                        onPressed: () => Navigator.pop(context, double.tryParse(controller.text) ?? 0),
                                        child: const Text('Apply'),
                                      ),
                                    ],
                                  ),
                                );
                                if (d != null) ref.read(transactionDiscountProvider.notifier).state = d;
                              },
                              child: Text('₱${discount.toStringAsFixed(2)}'),
                            ),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('TOTAL', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                            Text('₱${total.toStringAsFixed(2)}',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Theme.of(context).colorScheme.primary)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: cart.isEmpty || processing ? null : _processPayment,
                            child: processing
                                ? const CircularProgressIndicator()
                                : const Text('CHARGE', style: TextStyle(fontSize: 20)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Right Panel – Product Search & Scan
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _searchController,
                      focusNode: _searchFocusNode,
                      decoration: InputDecoration(
                        hintText: 'Search product...',
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.qr_code_scanner),
                          onPressed: _scanBarcode,
                        ),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      onChanged: _onSearchChanged,
                    ),
                  ),
                  Expanded(
                    child: _searching
                        ? const Center(child: CircularProgressIndicator())
                        : _searchResults.isEmpty
                            ? const Center(child: Text('Start typing to search'))
                            : ListView.builder(
                                itemCount: _searchResults.length,
                                itemBuilder: (ctx, i) {
                                  final prod = _searchResults[i];
                                  return ListTile(
                                    leading: CircleAvatar(child: Text('${prod.stockQuantity}')),
                                    title: Text(prod.name),
                                    subtitle: Text('₱${prod.sellingPrice.toStringAsFixed(2)}'),
                                    onTap: () => _addToCart(prod),
                                  );
                                },
                              ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentResult {
  final double amountReceived;
  final String method;
  PaymentResult({required this.amountReceived, required this.method});
}

class PaymentDialog extends StatefulWidget {
  final double total;
  const PaymentDialog({super.key, required this.total});

  @override
  State<PaymentDialog> createState() => _PaymentDialogState();
}

class _PaymentDialogState extends State<PaymentDialog> {
  final _amountCtrl = TextEditingController();
  String _method = 'cash';
  String? _error;

  @override
  void dispose() {
    _amountCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final change = ((double.tryParse(_amountCtrl.text) ?? 0) - widget.total);
    final valid = change >= 0;
    return AlertDialog(
      title: const Text('Payment'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Total: ₱${widget.total.toStringAsFixed(2)}', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            TextField(
              controller: _amountCtrl,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Amount Received',
                errorText: _error,
              ),
              onChanged: (_) => setState(() => _error = null),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: _method,
              decoration: const InputDecoration(labelText: 'Payment Method'),
              items: const [
                DropdownMenuItem(value: 'cash', child: Text('Cash')),
                DropdownMenuItem(value: 'gcash', child: Text('GCash')),
                DropdownMenuItem(value: 'maya', child: Text('Maya')),
              ],
              onChanged: (v) => setState(() => _method = v!),
            ),
            if (_amountCtrl.text.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text('Change: ₱${change.toStringAsFixed(2)}',
                    style: TextStyle(color: valid ? Colors.green : Colors.red, fontWeight: FontWeight.bold)),
              ),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
        ElevatedButton(
          onPressed: () {
            final amount = double.tryParse(_amountCtrl.text);
            if (amount == null || amount < widget.total) {
              setState(() => _error = 'Insufficient amount');
              return;
            }
            Navigator.pop(context, PaymentResult(amountReceived: amount, method: _method));
          },
          child: const Text('Complete'),
        ),
      ],
    );
  }
}