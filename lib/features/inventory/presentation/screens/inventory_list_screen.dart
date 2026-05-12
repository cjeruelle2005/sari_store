import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sari_store/features/inventory/domain/entities/product.dart';
import 'package:sari_store/features/inventory/presentation/providers/inventory_providers.dart';
import 'package:sari_store/features/inventory/presentation/screens/product_form_screen.dart';

class InventoryListScreen extends ConsumerStatefulWidget {
  const InventoryListScreen({super.key});

  @override
  ConsumerState<InventoryListScreen> createState() => _InventoryListScreenState();
}

class _InventoryListScreenState extends ConsumerState<InventoryListScreen> {
  String _filter = 'all';
  final _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productsAsync = ref.watch(productsProvider(_filter));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _navigateToForm(null),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search products...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      contentPadding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                    onChanged: (val) => setState(() => _searchQuery = val.toLowerCase()),
                  ),
                ),
                const SizedBox(width: 8),
                DropdownButton<String>(
                  value: _filter,
                  items: const [
                    DropdownMenuItem(value: 'all', child: Text('All')),
                    DropdownMenuItem(value: 'active', child: Text('Active')),
                  ],
                  onChanged: (v) => setState(() => _filter = v!),
                ),
              ],
            ),
          ),
          Expanded(
            child: productsAsync.when(
              data: (products) {
                final filtered = products.where((p) =>
                    _searchQuery.isEmpty ||
                    p.name.toLowerCase().contains(_searchQuery) ||
                    (p.barcode ?? '').contains(_searchQuery)).toList();

                if (filtered.isEmpty) {
                  return const Center(child: Text('No products found'));
                }
                return ListView.builder(
                  itemCount: filtered.length,
                  itemBuilder: (context, index) => _ProductTile(
                    product: filtered[index],
                    onTap: () => _navigateToForm(filtered[index]),
                  ),
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

  void _navigateToForm(Product? product) async {
    final result = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (_) => ProductFormScreen(product: product),
      ),
    );
    if (result == true) {
      ref.invalidate(productsProvider(_filter));
    }
  }
}

class _ProductTile extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const _ProductTile({required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final isLowStock = product.stockQuantity <= product.lowStockThreshold;
    return Card(
      color: isLowStock ? Colors.orange.shade50 : null,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        leading: CircleAvatar(
          child: Text('${product.stockQuantity}'),
          backgroundColor: isLowStock ? Colors.orange : null,
        ),
        title: Text(product.name),
        subtitle: Text(
          '₱${product.sellingPrice.toStringAsFixed(2)} | ${product.stockQuantity} in stock',
          style: TextStyle(color: isLowStock ? Colors.red : null),
        ),
        trailing: Text(product.categoryName ?? ''),
        onTap: onTap,
      ),
    );
  }
}