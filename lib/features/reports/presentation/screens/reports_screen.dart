import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:printing/printing.dart';
import 'package:open_filex/open_filex.dart';
import 'package:sari_store/features/reports/presentation/providers/report_providers.dart';
import 'package:sari_store/features/reports/domain/entities/sales_report.dart';
import 'package:sari_store/features/reports/domain/entities/profit_report.dart';
import 'package:sari_store/features/reports/domain/entities/expense_report.dart';
import 'package:sari_store/features/reports/domain/entities/inventory_report.dart';
import 'package:sari_store/features/reports/domain/entities/utang_report.dart';

class ReportsScreen extends ConsumerStatefulWidget {
  const ReportsScreen({super.key});

  @override
  ConsumerState<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends ConsumerState<ReportsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  DateTimeRange _selectedRange = DateTimeRange(
    start: DateTime.now().subtract(const Duration(days: 30)),
    end: DateTime.now(),
  );

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reports'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: const [
            Tab(text: 'Sales'),
            Tab(text: 'Profit'),
            Tab(text: 'Expenses'),
            Tab(text: 'Inventory'),
            Tab(text: 'Utang'),
          ],
        ),
      ),
      body: Column(
        children: [
          // Date range picker
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.date_range),
                    label: Text(
                      '${DateFormat.MMMd().format(_selectedRange.start)} - ${DateFormat.MMMd().format(_selectedRange.end)}',
                    ),
                    onPressed: () async {
                      final picked = await showDateRangePicker(
                        context: context,
                        firstDate: DateTime(2020),
                        lastDate: DateTime.now().add(const Duration(days: 1)),
                        initialDateRange: _selectedRange,
                      );
                      if (picked != null) {
                        setState(() => _selectedRange = picked);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _SalesReportTab(range: _selectedRange),
                _ProfitReportTab(range: _selectedRange),
                _ExpenseReportTab(range: _selectedRange),
                const _InventoryReportTab(),
                const _UtangReportTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SalesReportTab extends ConsumerWidget {
  final DateTimeRange range;
  const _SalesReportTab({required this.range});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportAsync = ref.watch(salesReportProvider(range));
    return reportAsync.when(
      data: (report) => _SalesReportView(report: report),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, s) => Center(child: Text('Error: $e')),
    );
  }
}

class _SalesReportView extends ConsumerWidget {
  final SalesReport report;
  const _SalesReportView({required this.report});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _SummaryCards(report),
          const SizedBox(height: 16),
          // Chart
          SizedBox(
            height: 200,
            child: BarChart(
              BarChartData(
                barGroups: report.dailyBreakdown.asMap().entries.map((e) {
                  return BarChartGroupData(
                    x: e.key,
                    barRods: [
                      BarChartRodData(
                        toY: e.value.total,
                        width: 12,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Export buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: () => _exportPdf(ref),
                icon: const Icon(Icons.picture_as_pdf),
                label: const Text('PDF'),
              ),
              ElevatedButton.icon(
                onPressed: () => _exportCsv(ref),
                icon: const Icon(Icons.table_chart),
                label: const Text('CSV'),
              ),
              ElevatedButton.icon(
                onPressed: () => _exportExcel(ref),
                icon: const Icon(Icons.table_chart),
                label: const Text('Excel'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _exportPdf(WidgetRef ref) async {
    final exporter = ref.read(exportServiceProvider);
    final result = await exporter.exportSalesReportPdf(report);
    result.fold(
      onSuccess: (file) {
        Printing.sharePdf(bytes: file.readAsBytesSync(), filename: 'sales_report.pdf');
      },
      onFailure: (f) => _showError(f.message),
    );
  }

  void _exportCsv(WidgetRef ref) async {
    final exporter = ref.read(exportServiceProvider);
    final result = await exporter.exportSalesReportCsv(report);
    result.fold(
      onSuccess: (file) => OpenFilex.open(file.path),
      onFailure: (f) => _showError(f.message),
    );
  }

  void _exportExcel(WidgetRef ref) async {
    final exporter = ref.read(exportServiceProvider);
    final result = await exporter.exportSalesReportExcel(report);
    result.fold(
      onSuccess: (file) => OpenFilex.open(file.path),
      onFailure: (f) => _showError(f.message),
    );
  }

  void _showError(String msg) {
    // Need context, but we're in a ConsumerWidget; we'll get context from build method's context variable.
  }
}

class _SummaryCards extends StatelessWidget {
  final SalesReport report;
  const _SummaryCards(this.report);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _Card('Total Sales', '₱${report.totalSales.toStringAsFixed(2)}')),
        Expanded(child: _Card('Transactions', '${report.totalTransactions}')),
        Expanded(child: _Card('Avg. Sale', '₱${report.averageTransaction.toStringAsFixed(2)}')),
      ],
    );
  }
}

class _Card extends StatelessWidget {
  final String label, value;
  const _Card(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Text(label, style: const TextStyle(fontSize: 12)),
            const SizedBox(height: 4),
            Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

// Placeholder tabs for Profit, Expenses, Inventory, Utang (we'll implement similar views)
class _ProfitReportTab extends ConsumerWidget {
  final DateTimeRange range;
  const _ProfitReportTab({required this.range});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Call use case directly
    final useCase = ref.watch(getProfitReportUseCaseProvider);
    return FutureBuilder(
      future: useCase(range.start, range.end),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        final result = snapshot.data;
        if (result == null) return const Text('No data');
        return result.fold(
          onSuccess: (report) => Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Revenue: ₱${report.totalRevenue.toStringAsFixed(2)}'),
                Text('Cost of Goods: ₱${report.totalCost.toStringAsFixed(2)}'),
                Text('Gross Profit: ₱${report.grossProfit.toStringAsFixed(2)}'),
                Text('Expenses: ₱${report.totalExpenses.toStringAsFixed(2)}'),
                const Divider(),
                Text('Net Profit: ₱${report.netProfit.toStringAsFixed(2)}',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          onFailure: (f) => Text('Error: ${f.message}'),
        );
      },
    );
  }
}

class _ExpenseReportTab extends ConsumerWidget {
  final DateTimeRange range;
  const _ExpenseReportTab({required this.range});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final useCase = ref.watch(getExpenseReportUseCaseProvider);
    return FutureBuilder(
      future: useCase(range.start, range.end),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        final result = snapshot.data;
        if (result == null) return const Text('No data');
        return result.fold(
          onSuccess: (report) => ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text('Total Expenses: ₱${report.totalExpenses.toStringAsFixed(2)}'),
              ...report.categoryBreakdown.map((cat) => ListTile(
                title: Text(cat.categoryName),
                trailing: Text('₱${cat.totalAmount.toStringAsFixed(2)} (${cat.count})'),
              )),
            ],
          ),
          onFailure: (f) => Text('Error: ${f.message}'),
        );
      },
    );
  }
}

class _InventoryReportTab extends ConsumerWidget {
  const _InventoryReportTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final useCase = ref.watch(getInventoryReportUseCaseProvider);
    return FutureBuilder(
      future: useCase(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        final result = snapshot.data;
        if (result == null) return const Text('No data');
        return result.fold(
          onSuccess: (report) => Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Total Products: ${report.totalProducts}'),
                Text('Active: ${report.activeProducts}'),
                Text('Low Stock: ${report.lowStockProducts}'),
                Text('Inventory Value: ₱${report.totalInventoryValue.toStringAsFixed(2)}'),
              ],
            ),
          ),
          onFailure: (f) => Text('Error: ${f.message}'),
        );
      },
    );
  }
}

class _UtangReportTab extends ConsumerWidget {
  const _UtangReportTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final useCase = ref.watch(getUtangReportUseCaseProvider);
    return FutureBuilder(
      future: useCase(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        final result = snapshot.data;
        if (result == null) return const Text('No data');
        return result.fold(
          onSuccess: (report) => ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text('Total Customers: ${report.totalCustomers}'),
              Text('Outstanding Balance: ₱${report.totalOutstandingBalance.toStringAsFixed(2)}'),
              const Divider(),
              Text('Top Debtors', style: const TextStyle(fontWeight: FontWeight.bold)),
              ...report.topDebtors.map((d) => ListTile(
                title: Text(d.customerName),
                trailing: Text('₱${d.balance.toStringAsFixed(2)}'),
              )),
            ],
          ),
          onFailure: (f) => Text('Error: ${f.message}'),
        );
      },
    );
  }
}