import 'package:drift/drift.dart';
import '../tables.dart';
import '../app_database.dart';

part 'settings_dao.g.dart';

@DriftAccessor(tables: [StoreInfo, AppSettings])
class SettingsDao extends DatabaseAccessor<AppDatabaseBase> with _$SettingsDaoMixin {
  SettingsDao(super.db);

  // Store info – singleton, only one row
  Future<StoreInfoData?> getStoreInfo() =>
      (select(storeInfo)..limit(1)).getSingleOrNull();

  Future<int> upsertStoreInfo(Insertable<StoreInfoData> info) =>
      into(storeInfo).insertOnConflictUpdate(info);

  // Key-value settings
  Future<String?> getSetting(String key) async {
    final row = await (select(appSettings)..where((t) => t.key.equals(key))).getSingleOrNull();
    return row?.value;
  }

  Future<void> setSetting(String key, String value) =>
      into(appSettings).insertOnConflictUpdate(AppSettingsCompanion(key: Value(key), value: Value(value)));

  Future<void> deleteSetting(String key) =>
      (delete(appSettings)..where((t) => t.key.equals(key))).go();
}