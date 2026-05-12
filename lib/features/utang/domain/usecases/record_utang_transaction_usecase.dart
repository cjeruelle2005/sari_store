import 'package:sari_store/core/errors/result.dart';
import 'package:sari_store/core/errors/failures.dart';
import 'package:sari_store/features/utang/domain/entities/utang_transaction.dart';
import 'package:sari_store/features/utang/domain/repositories/utang_repository.dart';

class RecordUtangTransactionUseCase {
  final UtangRepository repository;
  RecordUtangTransactionUseCase(this.repository);

  Future<Result<UtangTransaction>> borrow({
    required int customerId,
    required double amount,
    String? notes,
  }) async {
    if (amount <= 0) {
      return Result.failure(const Failure.validation(message: 'Amount must be greater than zero'));
    }
    return repository.recordBorrow(customerId: customerId, amount: amount, notes: notes);
  }

  Future<Result<UtangTransaction>> payment({
    required int customerId,
    required double amount,
    String? notes,
  }) async {
    if (amount <= 0) {
      return Result.failure(const Failure.validation(message: 'Amount must be greater than zero'));
    }
    return repository.recordPayment(customerId: customerId, amount: amount, notes: notes);
  }
}