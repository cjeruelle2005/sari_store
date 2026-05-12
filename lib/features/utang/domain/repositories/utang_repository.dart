import 'package:sari_store/core/errors/result.dart';
import 'package:sari_store/features/utang/domain/entities/customer.dart';
import 'package:sari_store/features/utang/domain/entities/utang_transaction.dart';

abstract class UtangRepository {
  // Customer CRUD
  Future<Result<List<Customer>>> getAllCustomers();
  Future<Result<Customer?>> getCustomerById(int id);
  Future<Result<Customer>> createCustomer({required String name, String? phone, String? address});
  Future<Result<Customer>> updateCustomer(Customer customer);
  Future<Result<void>> deleteCustomer(int id);

  // Utang transactions
  Future<Result<List<UtangTransaction>>> getLedger(int customerId);
  Future<Result<UtangTransaction>> recordBorrow({
    required int customerId,
    required double amount,
    String? notes,
  });
  Future<Result<UtangTransaction>> recordPayment({
    required int customerId,
    required double amount,
    String? notes,
  });
}