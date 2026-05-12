import 'package:sari_store/core/errors/result.dart';
import 'package:sari_store/core/errors/failures.dart';
import 'package:sari_store/core/logger/app_logger.dart';
import 'package:sari_store/features/utang/domain/entities/customer.dart';
import 'package:sari_store/features/utang/domain/entities/utang_transaction.dart';
import 'package:sari_store/features/utang/domain/repositories/utang_repository.dart';
import 'package:sari_store/shared/data/database/app_database.dart';
import 'package:sari_store/shared/data/database/tables.dart';

class UtangRepositoryImpl implements UtangRepository {
  final AppDatabase _db;

  UtangRepositoryImpl({required AppDatabase database}) : _db = database;

  // --- Customers ---
  @override
  Future<Result<List<Customer>>> getAllCustomers() async {
    try {
      final rows = await _db.customerDao.getAllCustomers();
      return Result.success(rows.map(_mapCustomer).toList());
    } catch (e, stack) {
      AppLogger.error('Failed to fetch customers', e, stack);
      return Result.failure(Failure.database(message: 'Failed to fetch customers'));
    }
  }

  @override
  Future<Result<Customer?>> getCustomerById(int id) async {
    try {
      final row = await _db.customerDao.getCustomerById(id);
      if (row == null) return const Result.success(null);
      return Result.success(_mapCustomer(row));
    } catch (e, stack) {
      AppLogger.error('Failed to fetch customer by id', e, stack);
      return Result.failure(Failure.database(message: 'Failed to fetch customer'));
    }
  }

  @override
  Future<Result<Customer>> createCustomer({required String name, String? phone, String? address}) async {
    try {
      final id = await _db.customerDao.insertCustomer(CustomersCompanion.insert(
        name: name,
        phone: Value(phone),
        address: Value(address),
        balance: 0.0,
      ));
      final created = await _db.customerDao.getCustomerById(id);
      return Result.success(_mapCustomer(created!));
    } catch (e, stack) {
      AppLogger.error('Failed to create customer', e, stack);
      return Result.failure(Failure.database(message: 'Failed to create customer'));
    }
  }

  @override
  Future<Result<Customer>> updateCustomer(Customer customer) async {
    try {
      await _db.customerDao.updateCustomer(CustomersCompanion(
        id: Value(customer.id),
        name: Value(customer.name),
        phone: Value(customer.phone),
        address: Value(customer.address),
        balance: Value(customer.balance),
        updatedAt: Value(DateTime.now()),
      ));
      final updated = await _db.customerDao.getCustomerById(customer.id);
      return Result.success(_mapCustomer(updated!));
    } catch (e, stack) {
      AppLogger.error('Failed to update customer', e, stack);
      return Result.failure(Failure.database(message: 'Failed to update customer'));
    }
  }

  @override
  Future<Result<void>> deleteCustomer(int id) async {
    try {
      await _db.customerDao.deleteCustomer(id);
      return const Result.success(null);
    } catch (e, stack) {
      AppLogger.error('Failed to delete customer', e, stack);
      return Result.failure(Failure.database(message: 'Failed to delete customer'));
    }
  }

  // --- Transactions ---
  @override
  Future<Result<List<UtangTransaction>>> getLedger(int customerId) async {
    try {
      final rows = await _db.utangDao.getTransactionsForCustomer(customerId);
      return Result.success(rows.map((r) => UtangTransaction(
        id: r.id,
        customerId: r.customerId,
        type: r.type == 'borrow' ? UtangType.borrow : UtangType.payment,
        amount: r.amount,
        balanceAfter: r.balanceAfter,
        notes: r.notes,
        transactionDate: r.transactionDate,
      )).toList());
    } catch (e, stack) {
      AppLogger.error('Failed to fetch ledger', e, stack);
      return Result.failure(Failure.database(message: 'Failed to fetch ledger'));
    }
  }

  @override
  Future<Result<UtangTransaction>> recordBorrow({
    required int customerId,
    required double amount,
    String? notes,
  }) async {
    return _recordTransaction(customerId: customerId, amount: amount, type: 'borrow', notes: notes);
  }

  @override
  Future<Result<UtangTransaction>> recordPayment({
    required int customerId,
    required double amount,
    String? notes,
  }) async {
    return _recordTransaction(customerId: customerId, amount: amount, type: 'payment', notes: notes);
  }

  Future<Result<UtangTransaction>> _recordTransaction({
    required int customerId,
    required double amount,
    required String type,
    String? notes,
  }) async {
    try {
      final customerRow = await _db.customerDao.getCustomerById(customerId);
      if (customerRow == null) {
        return Result.failure(const Failure.notFound(message: 'Customer not found'));
      }
      final currentBalance = customerRow.balance;
      final double newBalance = type == 'borrow' ? currentBalance + amount : currentBalance - amount;
      if (type == 'payment' && newBalance < 0 && currentBalance < amount) {
        // Allow overpayment? Usually no. But we'll allow it and keep balance negative? 
        // For simplicity, we prevent overpayment.
        return Result.failure(const Failure.validation(message: 'Payment exceeds current balance'));
      }

      await _db.transaction(() async {
        // Update customer balance
        await (_db.update(_db.customers)
              ..where((t) => t.id.equals(customerId)))
            .write(CustomersCompanion(balance: Value(newBalance)));

        // Insert utang transaction
        await _db.utangDao.insertTransaction(
          UtangTransactionsCompanion.insert(
            customerId: customerId,
            type: type,
            amount: amount,
            balanceAfter: newBalance,
            notes: Value(notes),
            transactionDate: DateTime.now(),
            createdAt: DateTime.now(),
          ),
        );
      });

      // Retrieve the latest inserted transaction to return full object (we can query the last inserted)
      final all = await _db.utangDao.getTransactionsForCustomer(customerId);
      final last = all.first; // ordered by date desc
      return Result.success(UtangTransaction(
        id: last.id,
        customerId: last.customerId,
        type: last.type == 'borrow' ? UtangType.borrow : UtangType.payment,
        amount: last.amount,
        balanceAfter: last.balanceAfter,
        notes: last.notes,
        transactionDate: last.transactionDate,
      ));
    } catch (e, stack) {
      AppLogger.error('Failed to record utang transaction', e, stack);
      return Result.failure(Failure.database(message: 'Failed to record transaction'));
    }
  }

  Customer _mapCustomer(CustomerData row) => Customer(
    id: row.id,
    name: row.name,
    phone: row.phone,
    address: row.address,
    balance: row.balance,
  );
}