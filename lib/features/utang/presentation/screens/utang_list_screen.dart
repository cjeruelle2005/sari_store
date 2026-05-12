import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sari_store/features/utang/domain/entities/customer.dart';
import 'package:sari_store/features/utang/presentation/providers/utang_providers.dart';
import 'package:sari_store/features/utang/presentation/screens/customer_ledger_screen.dart';

class UtangListScreen extends ConsumerWidget {
  const UtangListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customersAsync = ref.watch(customersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Utang (Credit)'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showAddEditCustomerDialog(context, ref, null),
          ),
        ],
      ),
      body: customersAsync.when(
        data: (customers) {
          if (customers.isEmpty) {
            return const Center(child: Text('No customers yet. Add one!'));
          }
          return ListView.builder(
            itemCount: customers.length,
            itemBuilder: (context, index) {
              final customer = customers[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(customer.name[0].toUpperCase()),
                  ),
                  title: Text(customer.name),
                  subtitle: Text(customer.phone ?? 'No phone'),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '₱${customer.balance.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: customer.balance > 0 ? Colors.red : Colors.green,
                        ),
                      ),
                      const Text('balance', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CustomerLedgerScreen(customer: customer),
                      ),
                    );
                  },
                  onLongPress: () => _showAddEditCustomerDialog(context, ref, customer),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(child: Text('Error: $e')),
      ),
    );
  }

  void _showAddEditCustomerDialog(BuildContext context, WidgetRef ref, Customer? existing) {
    final nameCtrl = TextEditingController(text: existing?.name ?? '');
    final phoneCtrl = TextEditingController(text: existing?.phone ?? '');
    final addressCtrl = TextEditingController(text: existing?.address ?? '');
    final formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(existing == null ? 'New Customer' : 'Edit Customer'),
        content: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: nameCtrl,
                  decoration: const InputDecoration(labelText: 'Name *'),
                  validator: (v) => v?.trim().isEmpty == true ? 'Required' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: phoneCtrl,
                  decoration: const InputDecoration(labelText: 'Phone'),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: addressCtrl,
                  decoration: const InputDecoration(labelText: 'Address'),
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () async {
              if (!formKey.currentState!.validate()) return;
              final useCase = ref.read(manageCustomerUseCaseProvider);
              if (existing == null) {
                final res = await useCase.create(
                  name: nameCtrl.text.trim(),
                  phone: phoneCtrl.text.trim().isEmpty ? null : phoneCtrl.text.trim(),
                  address: addressCtrl.text.trim().isEmpty ? null : addressCtrl.text.trim(),
                );
                res.fold(
                  onSuccess: (_) {
                    ref.invalidate(customersProvider);
                    Navigator.pop(ctx);
                  },
                  onFailure: (failure) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(failure.message))),
                );
              } else {
                final updated = existing.copyWith(
                  name: nameCtrl.text.trim(),
                  phone: phoneCtrl.text.trim().isEmpty ? null : phoneCtrl.text.trim(),
                  address: addressCtrl.text.trim().isEmpty ? null : addressCtrl.text.trim(),
                );
                final res = await useCase.update(updated);
                res.fold(
                  onSuccess: (_) {
                    ref.invalidate(customersProvider);
                    Navigator.pop(ctx);
                  },
                  onFailure: (failure) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(failure.message))),
                );
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}