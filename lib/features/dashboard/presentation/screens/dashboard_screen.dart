import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:sari_store/features/dashboard/presentation/providers/dashboard_providers.dart';
import 'package:sari_store/features/auth/presentation/providers/auth_providers.dart';
import 'package:go_router/go_router.dart';
import 'package:sari_store/core/theme/app_theme.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardAsync = ref.watch(dashboardDataProvider);
    final authState = ref.watch(authNotifierProvider);
    final user = authState.user;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          if (user != null)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Chip(
                avatar: CircleAvatar(
                  child: Text(user.fullName[0].toUpperCase()),
                ),
                label: Text(user.fullName),
              ),
            ),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () async {
              await ref.read(authNotifierProvider.notifier).logout();
            },
          ),
        ],
      ),
      body: dashboardAsync.when(
        data: (dashboard) => _DashboardContent(dashboard: dashboard),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.red),
              const SizedBox(height: 8),
              Text('Failed to load dashboard: ${err.toString()}'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.invalidate(dashboardDataProvider),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
      drawer: _buildDrawer(context, ref),
    );
  }

  Widget _buildDrawer(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authNotifierProvider).user;
    final isOwner = user?.role.name == 'owner';

    return NavigationDrawer(
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Icon(Icons.store, size: 48),
              const SizedBox(height: 8),
              Text('Sari-Sari Store', style: Theme.of(context).textTheme.titleLarge),
              if (user != null) Text(user.fullName),
            ],
          ),
        ),
        NavigationDrawerDestination(
          icon: const Icon(Icons.dashboard),
          label: const Text('Dashboard'),
          selectedIcon: const Icon(Icons.dashboard_rounded),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.shopping_cart),
          label: Text('Point of Sale'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.inventory),
          label: Text('Inventory'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.people),
          label: Text('Utang (Credit)'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.money_off),
          label: Text('Expenses'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.bar_chart),
          label: Text('Reports'),
        ),
        if (isOwner)
          const NavigationDrawerDestination(
            icon: Icon(Icons.manage_accounts),
            label: Text('User Management'),
          ),
        const SizedBox(height: 8),
        const Divider(),
        NavigationDrawerDestination(
          icon: const Icon(Icons.logout),
          label: const Text('Logout'),
          onTap: () {
            ref.read(authNotifierProvider.notifier).logout();
          },
        ),
      ],
      onDestinationSelected: (index) {
        // We'll implement navigation later; for now close the drawer.
        Navigator.pop(context);
        // Map index to routes; we'll do it later.
      },
    );
  }
}

class _DashboardContent extends StatelessWidget {
  final DashboardData dashboard;

  const _DashboardContent({required this.dashboard});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // KPI Cards
          Row(
            children: [
              Expanded(
                child: _KpiCard(
                  title: 'Daily Sales',
                  value: '₱${dashboard.dailySales.toStringAsFixed(2)}',
                  icon: Icons.today,
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _KpiCard(
                  title: 'Monthly Revenue',
                  value: '₱${dashboard.monthlySales.toStringAsFixed(2)}',
                  icon: Icons.calendar_month,
                  color: theme.colorScheme.secondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _KpiCard(
                  title: 'Expenses',
                  value: '₱${dashboard.totalExpenses.toStringAsFixed(2)}',
                  icon: Icons.money_off,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _KpiCard(
                  title: 'Low Stock Items',
                  value: '${dashboard.lowStockCount}',
                  icon: Icons.warning_amber,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Chart placeholder (simple bar chart of monthly sales? We'll make a simple bar chart)
          Text('Sales Overview (This Month)', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          SizedBox(
            height: 200,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: dashboard.monthlySales * 1.2,
                barTouchData: BarTouchData(enabled: false),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        // We'll create a dummy daily breakdown; later we'll use actual data.
                        return Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text('Day ${value.toInt() + 1}', style: const TextStyle(fontSize: 10)),
                        );
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 60,
                      getTitlesWidget: (value, meta) => Text('₱${value.toInt()}', style: const TextStyle(fontSize: 10)),
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                barGroups: List.generate(7, (i) {
                  // Random data for now; we'll implement actual daily breakdown later.
                  return BarChartGroupData(
                    x: i,
                    barRods: [
                      BarChartRodData(
                        toY: dashboard.dailySales * (i == DateTime.now().weekday - 1 ? 1 : 0.7),
                        color: theme.colorScheme.primary,
                        width: 16,
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(6)),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Best Sellers
          Text('Best Selling Products', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          if (dashboard.bestSellers.isEmpty)
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Center(child: Text('No sales data yet')),
              ),
            )
          else
            ...dashboard.bestSellers.map(
              (item) => ListTile(
                leading: CircleAvatar(child: Text('${item.quantitySold}')),
                title: Text(item.productName),
                trailing: Text('₱${item.totalAmount.toStringAsFixed(2)}'),
              ),
            ),

          const SizedBox(height: 24),

          // Recent Transactions
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Recent Transactions', style: theme.textTheme.titleMedium),
              TextButton(onPressed: () {/* navigate to POS history */}, child: const Text('View all')),
            ],
          ),
          const SizedBox(height: 8),
          if (dashboard.recentTransactions.isEmpty)
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Center(child: Text('No transactions yet')),
              ),
            )
          else
            ...dashboard.recentTransactions.map(
              (tx) => Card(
                margin: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text('${tx.itemCount}'),
                  ),
                  title: Text(tx.invoiceNumber),
                  subtitle: Text('${tx.cashierName} - ${_formatDate(tx.date)}'),
                  trailing: Text('₱${tx.totalAmount.toStringAsFixed(2)}'),
                  onTap: () {/* view details */},
                ),
              ),
            ),
        ],
      ),
    );
  }

  String _formatDate(DateTime dt) {
    return '${dt.hour}:${dt.minute.toString().padLeft(2, '0')} ${dt.day}/${dt.month}/${dt.year}';
  }
}

class _KpiCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _KpiCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 12),
            Text(title, style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 4),
            Text(value, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}