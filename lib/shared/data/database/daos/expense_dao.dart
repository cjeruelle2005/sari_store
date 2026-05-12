import 'package:drift/drift.dart';
import '../tables.dart';
import '../app_database.dart';

part 'expense_dao.g.dart';

@DriftAccessor(tables: [Expenses, ExpenseCategories])
class ExpenseDao extends DatabaseAccessor<AppDatabaseBase> with _$ExpenseDaoMixin {
  ExpenseDao(super.db);

  Future<List<ExpenseCategoryData>> getAllCategories() => select(expenseCategories).get();
  Future<int> insertCategory(Insertable<ExpenseCategoryData> category) =>
      into(expenseCategories).insert(category);

  Future<List<ExpenseData>> getExpenses({DateTime? from, DateTime? to}) {
    var query = select(expenses).orderBy([(t) => OrderingTerm.desc(t.date)]);
    if (from != null) query = query..where((t) => t.date.isBiggerOrEqualValue(from));
    if (to != null) query = query..where((t) => t.date.isSmallerOrEqualValue(to));
    return query.get();
  }

  Future<int> insertExpense(Insertable<ExpenseData> expense) =>
      into(expenses).insert(expense);

  Future<int> deleteExpense(int id) =>
      (delete(expenses)..where((t) => t.id.equals(id))).go();
}