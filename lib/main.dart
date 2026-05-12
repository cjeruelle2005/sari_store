import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sari_store/core/theme/app_theme.dart';
import 'package:sari_store/core/logger/app_logger.dart';
import 'package:sari_store/core/errors/error_handler.dart';
import 'package:sari_store/core/errors/error_screen.dart';
import 'package:sari_store/shared/data/database/app_database.dart';
import 'package:sari_store/shared/providers/database_provider.dart';
import 'package:sari_store/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:sari_store/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  AppErrorHandler.setup();

  ErrorWidget.builder = (FlutterErrorDetails details) {
    if (kDebugMode) {
      return ErrorWidget(details.exception);
    }
    return ErrorScreen(message: details.exceptionAsString());
  };

  AppLogger.setup();

  final database = AppDatabase();

  // Seed default owner account if none exists
  final secureStorage = const FlutterSecureStorage();
  final authDataSource = AuthLocalDataSource(database: database, secureStorage: secureStorage);
  await authDataSource.seedDefaultOwner();

  runApp(
    ProviderScope(
      overrides: [
        databaseProvider.overrideWithValue(database),
      ],
      child: const SariStoreApp(),
    ),
  );
}

class SariStoreApp extends ConsumerWidget {
  const SariStoreApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    return MaterialApp.router(
      title: 'Sari-Sari Store',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: router,
    );
  }
}