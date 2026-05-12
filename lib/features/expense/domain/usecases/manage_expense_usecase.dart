import 'package:sari_store/core/errors/result.dart';
import 'package:sari_store/core/errors/failures.dart';
import 'package:sari_store/features/expense/domain/entities/expense.dart';
import 'package:sari_store/features/expense/domain/repositories/expense_repository.dart';

class ManageExpenseUseCase {
  final ExpenseRepository repository;
  ManageExpenseUseCase(this.repository);

  Future<Result<Expense>> add({
    required int categoryId,
    required String description,
    required double amount,
    required DateTime date,
    String paymentMethod = 'cash',
    String? notes,
  }) async {
    if (description.trim().isEmpty) {
      return Result.failure(const Failure.validation(message: 'Description is required'));
    }
    if (amount <= 0) {
      return Result.failure(const Failure.validation(message: 'Amount must be positive'));
    }
    return repository.addExpense(
      categoryId: categoryId,
      description: description.trim(),
      amount: amount,
      date: date,
      paymentMethod: paymentMethod,
      notes: notes,
    );
  }

  Future<Result<void>> delete(int id) => repository.deleteExpense(id);
}