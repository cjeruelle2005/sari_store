import 'package:sari_store/core/errors/result.dart';
import 'package:sari_store/features/expense/domain/entities/expense.dart';
import 'package:sari_store/features/expense/domain/repositories/expense_repository.dart';

class GetExpensesUseCase {
  final ExpenseRepository repository;
  GetExpensesUseCase(this.repository);

  Future<Result<List<Expense>>> call({DateTime? from, DateTime? to}) =>
      repository.getExpenses(from: from, to: to);
}