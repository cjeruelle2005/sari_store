import 'package:drift/drift.dart';
import '../tables.dart';
import '../app_database.dart';

part 'customer_dao.g.dart';

@DriftAccessor(tables: [Customers])
class CustomerDao extends DatabaseAccessor<AppDatabaseBase> with _$CustomerDaoMixin {
  CustomerDao(super.db);

  Future<List<CustomerData>> getAllCustomers() => select(customers).get();
  Future<CustomerData?> getCustomerById(int id) =>
      (select(customers)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<int> insertCustomer(Insertable<CustomerData> customer) =>
      into(customers).insert(customer, mode: InsertMode.insertOrReplace);
  Future<bool> updateCustomer(Insertable<CustomerData> customer) =>
      update(customers).replace(customer);
  Future<int> deleteCustomer(int id) =>
      (delete(customers)..where((t) => t.id.equals(id))).go();
}