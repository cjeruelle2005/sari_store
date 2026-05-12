import 'package:drift/drift.dart';
import '../tables.dart';
import '../app_database.dart';

part 'utang_dao.g.dart';

@DriftAccessor(tables: [UtangTransactions])
class UtangDao extends DatabaseAccessor<AppDatabaseBase> with _$UtangDaoMixin {
  UtangDao(super.db);

  Future<List<UtangTransactionData>> getTransactionsForCustomer(int customerId) =>
      (select(utangTransactions)..where((t) => t.customerId.equals(customerId)))
          .orderBy([(t) => OrderingTerm.desc(t.transactionDate)])
          .get();

  Future<int> insertTransaction(Insertable<UtangTransactionData> utang) =>
      into(utangTransactions).insert(utang);
}