import 'package:sari_store/core/errors/result.dart';
import 'package:sari_store/features/expense/domain/entities/expense.dart';
import 'package:sari_store/features/expense/domain/entities/expense_category.dart';

abstract class ExpenseRepository {
  Future<Result<List<ExpenseCategory>>> getCategories();
  Future<Result<List<Expense>>> getExpenses({DateTime? from, DateTime? to});
  Future<Result<Expense>> addExpense({
    required int categoryId,
    required String description,
    required double amount,
    required DateTime date,
    String paymentMethod,
    String? notes,
  });
  Future<Result<void>> deleteExpense(int id);
  Future<Result<ExpenseCategory>> addCategory({required String name, String? description});
  Future<Result<void>> deleteCategory(int id);
}