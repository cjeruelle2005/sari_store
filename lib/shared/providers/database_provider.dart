import 'package:riverpod/riverpod.dart';
import 'package:sari_store/shared/data/database/app_database.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  throw UnimplementedError('Database must be overridden in main()');
});