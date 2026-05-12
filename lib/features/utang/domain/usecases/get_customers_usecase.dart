import 'package:sari_store/core/errors/result.dart';
import 'package:sari_store/features/utang/domain/entities/customer.dart';
import 'package:sari_store/features/utang/domain/repositories/utang_repository.dart';

class GetCustomersUseCase {
  final UtangRepository repository;
  GetCustomersUseCase(this.repository);

  Future<Result<List<Customer>>> call() => repository.getAllCustomers();
}