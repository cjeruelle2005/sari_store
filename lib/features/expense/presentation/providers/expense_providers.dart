import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sari_store/features/expense/data/repositories/expense_repository_impl.dart';
import 'package:sari_store/features/expense/domain/entities/expense.dart';
import 'package:sari_store/features/expense/domain/entities/expense_category.dart';
import 'package:sari_store/features/expense/domain/repositories/expense_repository.dart';
import 'package:sari_store/features/expense/domain/usecases/get_expense_categories_usecase.dart';
import 'package:sari_store/features/expense/domain/usecases/get_expenses_usecase.dart';
import 'package:sari_store/features/expense/domain/usecases/manage_expense_usecase.dart';
import 'package:sari_store/shared/providers/database_provider.dart';

final expenseRepositoryProvider = Provider<ExpenseRepository>((ref) {
  return ExpenseRepositoryImpl(database: ref.watch(databaseProvider));
});

final getExpenseCategoriesUseCaseProvider = Provider<GetExpenseCategoriesUseCase>(
    (ref) => GetExpenseCategoriesUseCase(ref.watch(expenseRepositoryProvider)));

final getExpensesUseCaseProvider = Provider<GetExpensesUseCase>(
    (ref) => GetExpensesUseCase(ref.watch(expenseRepositoryProvider)));

final manageExpenseUseCaseProvider = Provider<ManageExpenseUseCase>(
    (ref) => ManageExpenseUseCase(ref.watch(expenseRepositoryProvider)));

final expenseCategoriesProvider = FutureProvider<List<ExpenseCategory>>((ref) async {
  final useCase = ref.watch(getExpenseCategoriesUseCaseProvider);
  final result = await useCase();
  return result.fold(
    onSuccess: (data) => data,
    onFailure: (failure) => throw Exception(failure.message),
  );
});

final expensesProvider = FutureProvider.family<List<Expense>, DateTimeRange?>((ref, range) async {
  final useCase = ref.watch(getExpensesUseCaseProvider);
  final result = await useCase(from: range?.start, to: range?.end);
  return result.fold(
    onSuccess: (data) => data,
    onFailure: (failure) => throw Exception(failure.message),
  );
});