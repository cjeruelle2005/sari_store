import 'package:sari_store/core/errors/result.dart';
import 'package:sari_store/core/errors/failures.dart';
import 'package:sari_store/core/logger/app_logger.dart';
import 'package:sari_store/features/expense/domain/entities/expense.dart';
import 'package:sari_store/features/expense/domain/entities/expense_category.dart';
import 'package:sari_store/features/expense/domain/repositories/expense_repository.dart';
import 'package:sari_store/shared/data/database/app_database.dart';
import 'package:sari_store/shared/data/database/tables.dart';

class ExpenseRepositoryImpl implements ExpenseRepository {
  final AppDatabase _db;

  ExpenseRepositoryImpl({required AppDatabase database}) : _db = database;

  @override
  Future<Result<List<ExpenseCategory>>> getCategories() async {
    try {
      final rows = await _db.expenseDao.getAllCategories();
      return Result.success(rows.map((r) => ExpenseCategory(
        id: r.id,
        name: r.name,
        description: r.description,
      )).toList());
    } catch (e, stack) {
      AppLogger.error('Failed to fetch expense categories', e, stack);
      return Result.failure(Failure.database(message: 'Failed to fetch expense categories'));
    }
  }

  @override
  Future<Result<List<Expense>>> getExpenses({DateTime? from, DateTime? to}) async {
    try {
      final rows = await _db.expenseDao.getExpenses(from: from, to: to);
      final expenses = await Future.wait(rows.map((r) async {
        String? catName;
        final cat = await _db.expenseDao.getAllCategories().then((cats) => cats.firstWhere((c) => c.id == r.categoryId, orElse: () => cats.first));
        return Expense(
          id: r.id,
          categoryId: r.categoryId,
          categoryName: cat.name,
          description: r.description,
          amount: r.amount,
          date: r.date,
          paymentMethod: r.paymentMethod,
          notes: r.notes,
        );
      }));
      return Result.success(expenses);
    } catch (e, stack) {
      AppLogger.error('Failed to fetch expenses', e, stack);
      return Result.failure(Failure.database(message: 'Failed to fetch expenses'));
    }
  }

  @override
  Future<Result<Expense>> addExpense({
    required int categoryId,
    required String description,
    required double amount,
    required DateTime date,
    String paymentMethod = 'cash',
    String? notes,
  }) async {
    try {
      final id = await _db.expenseDao.insertExpense(
        ExpensesCompanion.insert(
          categoryId: categoryId,
          description: description,
          amount: amount,
          date: date,
          paymentMethod: paymentMethod,
          notes: Value(notes),
          createdAt: DateTime.now(),
        ),
      );
      final row = await _db.expenseDao.getExpenses(); // not ideal but we need the created expense
      final created = row.firstWhere((e) => e.id == id);
      final cat = await _db.expenseDao.getAllCategories().then((cats) => cats.firstWhere((c) => c.id == created.categoryId, orElse: () => cats.first));
      return Result.success(Expense(
        id: created.id,
        categoryId: created.categoryId,
        categoryName: cat.name,
        description: created.description,
        amount: created.amount,
        date: created.date,
        paymentMethod: created.paymentMethod,
        notes: created.notes,
      ));
    } catch (e, stack) {
      AppLogger.error('Failed to add expense', e, stack);
      return Result.failure(Failure.database(message: 'Failed to add expense'));
    }
  }

  @override
  Future<Result<void>> deleteExpense(int id) async {
    try {
      await _db.expenseDao.deleteExpense(id);
      return const Result.success(null);
    } catch (e, stack) {
      AppLogger.error('Failed to delete expense', e, stack);
      return Result.failure(Failure.database(message: 'Failed to delete expense'));
    }
  }

  @override
  Future<Result<ExpenseCategory>> addCategory({required String name, String? description}) async {
    try {
      final id = await _db.expenseDao.insertCategory(
        ExpenseCategoriesCompanion.insert(
          name: name,
          description: Value(description),
          createdAt: DateTime.now(),
        ),
      );
      // Fetch the created category
      final cats = await _db.expenseDao.getAllCategories();
      final created = cats.firstWhere((c) => c.id == id);
      return Result.success(ExpenseCategory(
        id: created.id,
        name: created.name,
        description: created.description,
      ));
    } catch (e, stack) {
      AppLogger.error('Failed to add category', e, stack);
      return Result.failure(Failure.database(message: 'Failed to add category'));
    }
  }

  @override
  Future<Result<void>> deleteCategory(int id) async {
    try {
      // Check if there are expenses using this category? For simplicity, allow.
      // We'll keep the DAO delete.
      await (delete(ctx.expenseCategories)..where((t) => t.id.equals(id))).go();
      return const Result.success(null);
    } catch (e, stack) {
      AppLogger.error('Failed to delete category', e, stack);
      return Result.failure(Failure.database(message: 'Failed to delete category'));
    }
  }
}