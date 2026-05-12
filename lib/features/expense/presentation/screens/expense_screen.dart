import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sari_store/features/expense/presentation/providers/expense_providers.dart';
import 'package:sari_store/features/expense/domain/entities/expense.dart';
import 'package:sari_store/features/expense/domain/entities/expense_category.dart';

class ExpenseScreen extends ConsumerStatefulWidget {
  const ExpenseScreen({super.key});

  @override
  ConsumerState<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends ConsumerState<ExpenseScreen> {
  DateTimeRange? _selectedRange;

  @override
  Widget build(BuildContext context) {
    final expensesAsync = ref.watch(expensesProvider(_selectedRange));
    final categoriesAsync = ref.watch(expenseCategoriesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () async {
              final picked = await showDateRangePicker(
                context: context,
                firstDate: DateTime(2020),
                lastDate: DateTime.now().add(const Duration(days: 1)),
              );
              if (picked != null) {
                setState(() => _selectedRange = picked);
              }
            },
          ),
          if (_selectedRange != null)
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () => setState(() => _selectedRange = null),
            ),
        ],
      ),
      body: expensesAsync.when(
        data: (expenses) {
          if (expenses.isEmpty) {
            return const Center(child: Text('No expenses recorded.'));
          }
          return ListView.builder(
            itemCount: expenses.length,
            itemBuilder: (context, index) {
              final e = expenses[index];
              return ListTile(
                leading: CircleAvatar(child: Text('${e.amount.toStringAsFixed(0)}')),
                title: Text(e.description),
                subtitle: Text('${e.categoryName ?? ''} · ${DateFormat.yMMMd().format(e.date)}'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => _confirmDelete(e.id),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddExpenseDialog(categoriesAsync),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _confirmDelete(int id) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Expense'),
        content: const Text('Are you sure?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
          ElevatedButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Delete')),
        ],
      ),
    );
    if (confirm == true) {
      final useCase = ref.read(manageExpenseUseCaseProvider);
      final res = await useCase.delete(id);
      res.fold(
        onSuccess: (_) {
          ref.invalidate(expensesProvider(_selectedRange));
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Expense deleted')));
        },
        onFailure: (failure) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(failure.message))),
      );
    }
  }

  void _showAddExpenseDialog(AsyncValue<List<ExpenseCategory>> categoriesAsync) {
    final formKey = GlobalKey<FormState>();
    final descCtrl = TextEditingController();
    final amountCtrl = TextEditingController();
    int? selectedCategoryId;
    DateTime selectedDate = DateTime.now();

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          title: const Text('Add Expense'),
          content: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  categoriesAsync.when(
                    data: (categories) => DropdownButtonFormField<int>(
                      value: selectedCategoryId,
                      decoration: const InputDecoration(labelText: 'Category'),
                      items: categories.map((c) => DropdownMenuItem(value: c.id, child: Text(c.name))).toList(),
                      onChanged: (v) => setDialogState(() => selectedCategoryId = v),
                      validator: (v) => v == null ? 'Required' : null,
                    ),
                    loading: () => const CircularProgressIndicator(),
                    error: (e, s) => const Text('Error loading categories'),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: descCtrl,
                    decoration: const InputDecoration(labelText: 'Description'),
                    validator: (v) => v?.trim().isEmpty == true ? 'Required' : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: amountCtrl,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Amount'),
                    validator: (v) {
                      if (v == null || v.isEmpty) return 'Required';
                      if (double.tryParse(v) == null || double.parse(v) <= 0) return 'Invalid amount';
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  ListTile(
                    title: const Text('Date'),
                    subtitle: Text(DateFormat.yMMMd().format(selectedDate)),
                    trailing: const Icon(Icons.calendar_today),
                    onTap: () async {
                      final picked = await showDatePicker(
                        context: ctx,
                        initialDate: selectedDate,
                        firstDate: DateTime(2020),
                        lastDate: DateTime.now(),
                      );
                      if (picked != null) {
                        setDialogState(() => selectedDate = picked);
                      }
                    },
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
                final useCase = ref.read(manageExpenseUseCaseProvider);
                final res = await useCase.add(
                  categoryId: selectedCategoryId!,
                  description: descCtrl.text.trim(),
                  amount: double.parse(amountCtrl.text),
                  date: selectedDate,
                );
                res.fold(
                  onSuccess: (_) {
                    ref.invalidate(expensesProvider(_selectedRange));
                    Navigator.pop(ctx);
                  },
                  onFailure: (failure) {
                    ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(content: Text(failure.message)));
                  },
                );
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}