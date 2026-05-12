import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'tables.dart';
import 'daos/user_dao.dart';
import 'daos/product_dao.dart';
import 'daos/category_dao.dart';
import 'daos/transaction_dao.dart';
import 'daos/customer_dao.dart';
import 'daos/utang_dao.dart';
import 'daos/expense_dao.dart';
import 'daos/settings_dao.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Users,
    Categories,
    Products,
    InventoryMovements,
    Transactions,
    TransactionItems,
    Customers,
    UtangTransactions,
    ExpenseCategories,
    Expenses,
    StoreInfo,
    AppSettings,
  ],
  daos: [
    UserDao,
    ProductDao,
    CategoryDao,
    TransactionDao,
    CustomerDao,
    UtangDao,
    ExpenseDao,
    SettingsDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (migrator) async {
          await migrator.createAll();
          // Insert default expense categories
          await _seedExpenseCategories();
          // Insert default store info
          await _seedStoreInfo();
        },
        onUpgrade: (migrator, from, to) async {
          // Future migrations will be handled here
        },
      );

  Future<void> _seedExpenseCategories() async {
    final expenseDao = ExpenseDao(this);
    final categories = ['Utilities', 'Rent', 'Transportation', 'Supplies', 'Maintenance', 'Others'];
    for (final name in categories) {
      await expenseDao.insertCategory(ExpenseCategoriesCompanion.insert(name: name));
    }
  }

  Future<void> _seedStoreInfo() async {
    final settingsDao = SettingsDao(this);
    // Only insert if empty (first run)
    final existing = await settingsDao.getStoreInfo();
    if (existing == null) {
      await settingsDao.upsertStoreInfo(const StoreInfoCompanion.insert());
    }
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'sari_store.db'));
    return NativeDatabase.createInBackground(file);
  });
}