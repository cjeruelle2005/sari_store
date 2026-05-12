import 'package:sari_store/core/errors/result.dart';
import 'package:sari_store/features/expense/domain/entities/expense_category.dart';
import 'package:sari_store/features/expense/domain/repositories/expense_repository.dart';

class GetExpenseCategoriesUseCase {
  final ExpenseRepository repository;
  GetExpenseCategoriesUseCase(this.repository);

  Future<Result<List<ExpenseCategory>>> call() => repository.getCategories();
}