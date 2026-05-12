import 'package:drift/drift.dart';
import '../tables.dart';
import '../app_database.dart';

part 'category_dao.g.dart';

@DriftAccessor(tables: [Categories])
class CategoryDao extends DatabaseAccessor<AppDatabaseBase> with _$CategoryDaoMixin {
  CategoryDao(super.db);

  Future<List<CategoryData>> getAllCategories() => select(categories).get();
  Future<CategoryData?> getCategoryById(int id) =>
      (select(categories)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<int> insertCategory(Insertable<CategoryData> category) =>
      into(categories).insert(category, mode: InsertMode.insertOrReplace);
  Future<bool> updateCategory(Insertable<CategoryData> category) =>
      update(categories).replace(category);
  Future<int> deleteCategory(int id) =>
      (delete(categories)..where((t) => t.id.equals(id))).go();
}