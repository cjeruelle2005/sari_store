import 'package:sari_store/core/errors/result.dart';
import 'package:sari_store/core/errors/failures.dart';
import 'package:sari_store/features/utang/domain/entities/customer.dart';
import 'package:sari_store/features/utang/domain/repositories/utang_repository.dart';

class ManageCustomerUseCase {
  final UtangRepository repository;
  ManageCustomerUseCase(this.repository);

  Future<Result<Customer>> create({required String name, String? phone, String? address}) async {
    if (name.trim().isEmpty) {
      return Result.failure(const Failure.validation(message: 'Customer name is required'));
    }
    return repository.createCustomer(name: name.trim(), phone: phone, address: address);
  }

  Future<Result<Customer>> update(Customer customer) async {
    if (customer.name.trim().isEmpty) {
      return Result.failure(const Failure.validation(message: 'Customer name is required'));
    }
    return repository.updateCustomer(customer);
  }

  Future<Result<void>> delete(int id) => repository.deleteCustomer(id);
}