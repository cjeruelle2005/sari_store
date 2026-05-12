import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sari_store/features/auth/presentation/providers/auth_providers.dart';
import 'package:sari_store/features/splash/splash_screen.dart';
import 'package:sari_store/features/shell/shell_screen.dart';
import 'package:sari_store/features/auth/presentation/screens/login_screen.dart';
import 'package:sari_store/features/auth/presentation/screens/user_management_screen.dart';
import 'package:sari_store/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:sari_store/features/pos/presentation/screens/pos_screen.dart';
import 'package:sari_store/features/inventory/presentation/screens/inventory_list_screen.dart';
import 'package:sari_store/features/utang/presentation/screens/utang_list_screen.dart';
import 'package:sari_store/features/expense/presentation/screens/expense_screen.dart';
import 'package:sari_store/features/reports/presentation/screens/reports_screen.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authNotifierProvider);

  return GoRouter(
    initialLocation: '/splash',
    redirect: (context, state) {
      final isInitialized = authState.isInitialized;
      final isLoggedIn = authState.isAuthenticated;
      final isLoginRoute = state.matchedLocation == '/login';
      final isSplash = state.matchedLocation == '/splash';

      if (!isInitialized && !isSplash) return '/splash';
      if (isSplash && isInitialized) {
        return isLoggedIn ? '/dashboard' : '/login';
      }
      if (!isLoggedIn && !isLoginRoute && isInitialized) return '/login';
      if (isLoggedIn && (isLoginRoute || isSplash)) return '/dashboard';

      // Role-based guard for /users
      if (state.matchedLocation == '/users' && authState.user?.role.name != 'owner') {
        return '/dashboard';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      ShellRoute(
        builder: (context, state, child) => ShellScreen(child: child),
        routes: [
          GoRoute(
            path: '/dashboard',
            name: 'dashboard',
            builder: (context, state) => const DashboardScreen(),
          ),
          GoRoute(
            path: '/pos',
            name: 'pos',
            builder: (context, state) => const PosScreen(),
          ),
          GoRoute(
            path: '/inventory',
            name: 'inventory',
            builder: (context, state) => const InventoryListScreen(),
          ),
          GoRoute(
            path: '/utang',
            name: 'utang',
            builder: (context, state) => const UtangListScreen(),
          ),
          GoRoute(
            path: '/expenses',
            name: 'expenses',
            builder: (context, state) => const ExpenseScreen(),
          ),
          GoRoute(
            path: '/reports',
            name: 'reports',
            builder: (context, state) => const ReportsScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/users',
        name: 'users',
        builder: (context, state) => const UserManagementScreen(),
      ),
    ],
  );
});