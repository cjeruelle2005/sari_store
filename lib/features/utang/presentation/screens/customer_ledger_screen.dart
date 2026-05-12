import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sari_store/features/utang/domain/entities/customer.dart';
import 'package:sari_store/features/utang/domain/entities/utang_transaction.dart';
import 'package:sari_store/features/utang/presentation/providers/utang_providers.dart';

class CustomerLedgerScreen extends ConsumerStatefulWidget {
  final Customer customer;
  const CustomerLedgerScreen({super.key, required this.customer});

  @override
  ConsumerState<CustomerLedgerScreen> createState() => _CustomerLedgerScreenState();
}

class _CustomerLedgerScreenState extends ConsumerState<CustomerLedgerScreen> {
  final _amountController = TextEditingController();
  final _notesController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _amountController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _recordTransaction(UtangType type) async {
    final amount = double.tryParse(_amountController.text);
    if (amount == null || amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter a valid amount')),
      );
      return;
    }
    final useCase = ref.read(recordUtangTransactionUseCaseProvider);
    final notes = _notesController.text.trim().isEmpty ? null : _notesController.text.trim();

    final result = type == UtangType.borrow
        ? await useCase.borrow(customerId: widget.customer.id, amount: amount, notes: notes)
        : await useCase.payment(customerId: widget.customer.id, amount: amount, notes: notes);

    result.fold(
      onSuccess: (_) {
        ref.invalidate(ledgerProvider(widget.customer.id));
        ref.invalidate(customersProvider); // refresh customer list balances
        _amountController.clear();
        _notesController.clear();
      },
      onFailure: (failure) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(failure.message)));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ledgerAsync = ref.watch(ledgerProvider(widget.customer.id));
    final customer = widget.customer;

    return Scaffold(
      appBar: AppBar(
        title: Text('${customer.name} - Ledger'),
      ),
      body: Column(
        children: [
          // Customer info and balance
          Container(
            padding: const EdgeInsets.all(16),
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(customer.name, style: Theme.of(context).textTheme.titleLarge),
                    if (customer.phone != null) Text(customer.phone!),
                    if (customer.address != null) Text(customer.address!),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text('Balance'),
                    Text(
                      '₱${customer.balance.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: customer.balance > 0 ? Colors.red : Colors.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Add transaction form
          Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Amount',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      controller: _notesController,
                      decoration: const InputDecoration(
                        labelText: 'Notes (optional)',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: () => _recordTransaction(UtangType.borrow),
                icon: const Icon(Icons.add),
                label: const Text('Borrow'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
              ),
              ElevatedButton.icon(
                onPressed: () => _recordTransaction(UtangType.payment),
                icon: const Icon(Icons.payment),
                label: const Text('Payment'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(),
          // Ledger history
          Expanded(
            child: ledgerAsync.when(
              data: (transactions) {
                if (transactions.isEmpty) {
                  return const Center(child: Text('No transactions yet.'));
                }
                return ListView.builder(
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    final tx = transactions[index];
                    final isBorrow = tx.type == UtangType.borrow;
                    return ListTile(
                      leading: Icon(
                        isBorrow ? Icons.arrow_downward : Icons.arrow_upward,
                        color: isBorrow ? Colors.orange : Colors.green,
                      ),
                      title: Text(isBorrow ? 'Borrow' : 'Payment'),
                      subtitle: Text(
                        '${DateFormat.yMMMd().add_jm().format(tx.transactionDate)}${tx.notes != null ? ' - ${tx.notes}' : ''}',
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '₱${tx.amount.toStringAsFixed(2)}',
                            style: TextStyle(fontWeight: FontWeight.bold, color: isBorrow ? Colors.red : Colors.green),
                          ),
                          Text('Balance: ₱${tx.balanceAfter.toStringAsFixed(2)}', style: const TextStyle(fontSize: 12)),
                        ],
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, s) => Center(child: Text('Error: $e')),
            ),
          ),
        ],
      ),
    );
  }
}