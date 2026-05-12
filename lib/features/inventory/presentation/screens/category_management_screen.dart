import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sari_store/features/inventory/domain/entities/category.dart';
import 'package:sari_store/features/inventory/presentation/providers/inventory_providers.dart';

class CategoryManagementScreen extends ConsumerStatefulWidget {
  const CategoryManagementScreen({super.key});

  @override
  ConsumerState<CategoryManagementScreen> createState() => _CategoryManagementScreenState();
}

class _CategoryManagementScreenState extends ConsumerState<CategoryManagementScreen> {
  @override
  Widget build(BuildContext context) {
    final categoriesAsync = ref.watch(categoriesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: categoriesAsync.when(
        data: (categories) => ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final cat = categories[index];
            return ListTile(
              title: Text(cat.name),
              subtitle: Text(cat.description ?? ''),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => _deleteCategory(cat),
              ),
              onTap: () => _editCategory(cat),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(child: Text('Error: $e')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addCategory,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addCategory() => _showCategoryDialog(null);
  void _editCategory(Category cat) => _showCategoryDialog(cat);

  void _showCategoryDialog(Category? existing) {
    final nameCtrl = TextEditingController(text: existing?.name ?? '');
    final descCtrl = TextEditingController(text: existing?.description ?? '');
    final formKey = GlobalKey<FormState>();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(existing == null ? 'New Category' : 'Edit Category'),
        content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Name'), validator: (v) => v?.trim().isEmpty == true ? 'Required' : null),
              const SizedBox(height: 12),
              TextFormField(controller: descCtrl, decoration: const InputDecoration(labelText: 'Description')),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () async {
              if (!formKey.currentState!.validate()) return;
              final useCase = ref.read(manageCategoryUseCaseProvider);
              if (existing == null) {
                await useCase.create(nameCtrl.text.trim(), description: descCtrl.text.trim().isEmpty ? null : descCtrl.text.trim());
              } else {
                final updatedCat = existing.copyWith(name: nameCtrl.text.trim(), description: descCtrl.text.trim().isEmpty ? null : descCtrl.text.trim());
                await useCase.update(updatedCat);
              }
              ref.invalidate(categoriesProvider);
              if (ctx.mounted) Navigator.pop(ctx);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  Future<void> _deleteCategory(Category cat) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Category'),
        content: Text('Delete ${cat.name}?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
          ElevatedButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Delete')),
        ],
      ),
    );
    if (confirm == true) {
      await ref.read(manageCategoryUseCaseProvider).delete(cat.id);
      ref.invalidate(categoriesProvider);
    }
  }
}