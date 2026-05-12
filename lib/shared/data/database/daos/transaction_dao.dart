import 'package:drift/drift.dart';
import '../tables.dart';
import '../app_database.dart';

part 'transaction_dao.g.dart';

@DriftAccessor(tables: [Transactions, TransactionItems])
class TransactionDao extends DatabaseAccessor<AppDatabaseBase> with _$TransactionDaoMixin {
  TransactionDao(super.db);

  Future<List<TransactionData>> getTransactions({DateTime? from, DateTime? to}) {
    var query = select(transactions).orderBy([(t) => OrderingTerm.desc(t.transactionDate)]);
    if (from != null) query = query..where((t) => t.transactionDate.isBiggerOrEqualValue(from));
    if (to != null) query = query..where((t) => t.transactionDate.isSmallerOrEqualValue(to));
    return query.get();
  }

  Future<TransactionData?> getTransactionById(int id) =>
      (select(transactions)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<TransactionData?> getTransactionByInvoice(String invoice) =>
      (select(transactions)..where((t) => t.invoiceNumber.equals(invoice))).getSingleOrNull();

  Future<int> insertTransaction(Insertable<TransactionData> transaction) =>
      into(transactions).insert(transaction, mode: InsertMode.insertOrReplace);

  Future<bool> updateTransaction(Insertable<TransactionData> transaction) =>
      update(transactions).replace(transaction);

  Future<int> voidTransaction(int id) =>
      (update(transactions)..where((t) => t.id.equals(id))).write(const TransactionsCompanion(status: Value('voided')));

  // Transaction items
  Future<List<TransactionItemData>> getItemsForTransaction(int transactionId) =>
      (select(transactionItems)..where((t) => t.transactionId.equals(transactionId))).get();

  Future<int> insertTransactionItem(Insertable<TransactionItemData> item) =>
      into(transactionItems).insert(item);

  Future<void> insertAllItems(Iterable<Insertable<TransactionItemData>> items) =>
      batch((batch) => batch.insertAll(transactionItems, items));
}