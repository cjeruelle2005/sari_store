import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sari_store/features/auth/presentation/providers/auth_providers.dart';

class ShellScreen extends ConsumerWidget {
  final Widget child;
  const ShellScreen({super.key, required this.child});

  int _currentIndex(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    if (location.startsWith('/dashboard')) return 0;
    if (location.startsWith('/pos')) return 1;
    if (location.startsWith('/inventory')) return 2;
    if (location.startsWith('/utang')) return 3;
    if (location.startsWith('/expenses')) return 4;
    if (location.startsWith('/reports')) return 5;
    return 0;
  }

  void _onDestinationSelected(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/dashboard');
        break;
      case 1:
        context.go('/pos');
        break;
      case 2:
        context.go('/inventory');
        break;
      case 3:
        context.go('/utang');
        break;
      case 4:
        context.go('/expenses');
        break;
      case 5:
        context.go('/reports');
        break;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authNotifierProvider).user;
    final isOwner = user?.role.name == 'owner';

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex(context),
        onDestinationSelected: (index) => _onDestinationSelected(context, index),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          NavigationDestination(icon: Icon(Icons.shopping_cart), label: 'POS'),
          NavigationDestination(icon: Icon(Icons.inventory), label: 'Inventory'),
          NavigationDestination(icon: Icon(Icons.people), label: 'Utang'),
          NavigationDestination(icon: Icon(Icons.money_off), label: 'Expenses'),
          NavigationDestination(icon: Icon(Icons.bar_chart), label: 'Reports'),
        ],
      ),
      drawer: Drawer(
        child: Column(
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
                  Text('Sari-Sari Store',
                      style: Theme.of(context).textTheme.titleLarge),
                  if (user != null) Text(user.fullName),
                ],
              ),
            ),
            if (isOwner)
              ListTile(
                leading: const Icon(Icons.manage_accounts),
                title: const Text('User Management'),
                onTap: () {
                  context.go('/users');
                  Navigator.pop(context);
                },
              ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                ref.read(authNotifierProvider.notifier).logout();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}