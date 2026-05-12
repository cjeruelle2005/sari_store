import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sari_store/core/errors/result.dart';
import 'package:sari_store/features/utang/data/repositories/utang_repository_impl.dart';
import 'package:sari_store/features/utang/domain/entities/customer.dart';
import 'package:sari_store/features/utang/domain/entities/utang_transaction.dart';
import 'package:sari_store/features/utang/domain/repositories/utang_repository.dart';
import 'package:sari_store/features/utang/domain/usecases/get_customers_usecase.dart';
import 'package:sari_store/features/utang/domain/usecases/manage_customer_usecase.dart';
import 'package:sari_store/features/utang/domain/usecases/get_ledger_usecase.dart';
import 'package:sari_store/features/utang/domain/usecases/record_utang_transaction_usecase.dart';
import 'package:sari_store/shared/providers/database_provider.dart';

// Repo
final utangRepositoryProvider = Provider<UtangRepository>((ref) {
  return UtangRepositoryImpl(database: ref.watch(databaseProvider));
});

// Use cases
final getCustomersUseCaseProvider = Provider<GetCustomersUseCase>(
    (ref) => GetCustomersUseCase(ref.watch(utangRepositoryProvider)));
final manageCustomerUseCaseProvider = Provider<ManageCustomerUseCase>(
    (ref) => ManageCustomerUseCase(ref.watch(utangRepositoryProvider)));
final getLedgerUseCaseProvider = Provider<GetLedgerUseCase>(
    (ref) => GetLedgerUseCase(ref.watch(utangRepositoryProvider)));
final recordUtangTransactionUseCaseProvider = Provider<RecordUtangTransactionUseCase>(
    (ref) => RecordUtangTransactionUseCase(ref.watch(utangRepositoryProvider)));

// Customers list provider (auto-refresh with family)
final customersProvider = FutureProvider<List<Customer>>((ref) async {
  final useCase = ref.watch(getCustomersUseCaseProvider);
  final result = await useCase();
  return result.fold(
    onSuccess: (data) => data,
    onFailure: (failure) => throw Exception(failure.message),
  );
});

// Ledger for a specific customer
final ledgerProvider = FutureProvider.family<List<UtangTransaction>, int>((ref, customerId) async {
  final useCase = ref.watch(getLedgerUseCaseProvider);
  final result = await useCase(customerId);
  return result.fold(
    onSuccess: (data) => data,
    onFailure: (failure) => throw Exception(failure.message),
  );
});