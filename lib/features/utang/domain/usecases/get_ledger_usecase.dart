import 'package:sari_store/core/errors/result.dart';
import 'package:sari_store/features/utang/domain/entities/utang_transaction.dart';
import 'package:sari_store/features/utang/domain/repositories/utang_repository.dart';

class GetLedgerUseCase {
  final UtangRepository repository;
  GetLedgerUseCase(this.repository);

  Future<Result<List<UtangTransaction>>> call(int customerId) => repository.getLedger(customerId);
}