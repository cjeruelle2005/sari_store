import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:sari_store/features/inventory/domain/entities/product.dart';
import 'package:sari_store/features/inventory/domain/entities/category.dart';
import 'package:sari_store/features/inventory/presentation/providers/inventory_providers.dart';
import 'package:sari_store/core/errors/failures.dart';

class ProductFormScreen extends ConsumerStatefulWidget {
  final Product? product;
  const ProductFormScreen({super.key, this.product});

  @override
  ConsumerState<ProductFormScreen> createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends ConsumerState<ProductFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameCtrl;
  late TextEditingController _barcodeCtrl;
  late TextEditingController _skuCtrl;
  late TextEditingController _costCtrl;
  late TextEditingController _priceCtrl;
  late TextEditingController _stockCtrl;
  late TextEditingController _lowStockCtrl;
  late TextEditingController _supplierCtrl;
  int? _categoryId;
  bool _isActive = true;
  DateTime? _expirationDate;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final p = widget.product;
    _nameCtrl = TextEditingController(text: p?.name ?? '');
    _barcodeCtrl = TextEditingController(text: p?.barcode ?? '');
    _skuCtrl = TextEditingController(text: p?.sku ?? '');
    _costCtrl = TextEditingController(text: p?.costPrice.toString() ?? '0');
    _priceCtrl = TextEditingController(text: p?.sellingPrice.toString() ?? '0');
    _stockCtrl = TextEditingController(text: p?.stockQuantity.toString() ?? '0');
    _lowStockCtrl = TextEditingController(text: p?.lowStockThreshold.toString() ?? '5');
    _supplierCtrl = TextEditingController(text: p?.supplier ?? '');
    _categoryId = p?.categoryId;
    _isActive = p?.isActive ?? true;
    _expirationDate = p?.expirationDate;
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _barcodeCtrl.dispose();
    _skuCtrl.dispose();
    _costCtrl.dispose();
    _priceCtrl.dispose();
    _stockCtrl.dispose();
    _lowStockCtrl.dispose();
    _supplierCtrl.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _saving = true);

    final product = Product(
      id: widget.product?.id ?? 0,
      name: _nameCtrl.text.trim(),
      barcode: _barcodeCtrl.text.trim().isEmpty ? null : _barcodeCtrl.text.trim(),
      sku: _skuCtrl.text.trim().isEmpty ? null : _skuCtrl.text.trim(),
      categoryId: _categoryId,
      categoryName: null,
      imagePath: null, // not implemented yet
      costPrice: double.tryParse(_costCtrl.text) ?? 0,
      sellingPrice: double.tryParse(_priceCtrl.text) ?? 0,
      stockQuantity: int.tryParse(_stockCtrl.text) ?? 0,
      lowStockThreshold: int.tryParse(_lowStockCtrl.text) ?? 5,
      isActive: _isActive,
      expirationDate: _expirationDate,
      supplier: _supplierCtrl.text.trim().isEmpty ? null : _supplierCtrl.text.trim(),
      createdAt: widget.product?.createdAt ?? DateTime.now(),
      updatedAt: DateTime.now(),
    );

    final useCase = ref.read(manageProductUseCaseProvider);
    final result = widget.product == null
        ? await useCase.create(product)
        : await useCase.update(product);

    result.fold(
      onSuccess: (_) {
        if (mounted) Navigator.pop(context, true);
      },
      onFailure: (failure) {
        setState(() => _saving = false);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(failure.message)));
      },
    );
  }

  Future<void> _scanBarcode() async {
    final barcode = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (_) => const BarcodeScannerScreen()),
    );
    if (barcode != null) {
      _barcodeCtrl.text = barcode;
    }
  }

  Future<void> _pickExpirationDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _expirationDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
    );
    if (picked != null) {
      setState(() => _expirationDate = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final categoriesAsync = ref.watch(categoriesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product == null ? 'Add Product' : 'Edit Product'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(controller: _nameCtrl, decoration: const InputDecoration(labelText: 'Product Name *'), validator: (v) => v?.trim().isEmpty == true ? 'Required' : null),
              const SizedBox(height: 12),
              TextFormField(controller: _barcodeCtrl, decoration: InputDecoration(labelText: 'Barcode', suffixIcon: IconButton(icon: const Icon(Icons.qr_code_scanner), onPressed: _scanBarcode))),
              const SizedBox(height: 12),
              TextFormField(controller: _skuCtrl, decoration: const InputDecoration(labelText: 'SKU')),
              const SizedBox(height: 12),
              categoriesAsync.when(
                data: (categories) => DropdownButtonFormField<int?>(
                  value: _categoryId,
                  decoration: const InputDecoration(labelText: 'Category'),
                  items: [
                    const DropdownMenuItem(value: null, child: Text('None')),
                    ...categories.map((c) => DropdownMenuItem(value: c.id, child: Text(c.name))),
                  ],
                  onChanged: (v) => setState(() => _categoryId = v),
                ),
                loading: () => const CircularProgressIndicator(),
                error: (e, s) => const Text('Error loading categories'),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: TextFormField(controller: _costCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Cost Price *'), validator: (v) => v?.isEmpty == true ? 'Required' : null)),
                  const SizedBox(width: 12),
                  Expanded(child: TextFormField(controller: _priceCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Selling Price *'), validator: (v) => v?.isEmpty == true ? 'Required' : null)),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: TextFormField(controller: _stockCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Stock Qty'))),
                  const SizedBox(width: 12),
                  Expanded(child: TextFormField(controller: _lowStockCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Low Stock Threshold'))),
                ],
              ),
              const SizedBox(height: 12),
              TextFormField(controller: _supplierCtrl, decoration: const InputDecoration(labelText: 'Supplier')),
              const SizedBox(height: 16),
              SwitchListTile(title: const Text('Active'), value: _isActive, onChanged: (v) => setState(() => _isActive = v)),
              const SizedBox(height: 8),
              ListTile(
                title: const Text('Expiration Date'),
                subtitle: Text(_expirationDate == null ? 'Not set' : '${_expirationDate!.toLocal()}'.split(' ')[0]),
                trailing: const Icon(Icons.calendar_today),
                onTap: _pickExpirationDate,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _saving ? null : _save,
                  child: _saving ? const CircularProgressIndicator() : const Text('Save Product'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}