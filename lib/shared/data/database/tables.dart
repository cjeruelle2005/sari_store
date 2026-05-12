import 'package:drift/drift.dart';

/// -------------------- USERS --------------------
/// Roles: 0 = owner, 1 = cashier, 2 = staff
@DataClassName('UserData')
class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get username => text().withLength(min: 3, max: 50).unique()();
  TextColumn get passwordHash => text().named('password_hash')();
  TextColumn get fullName => text().named('full_name').withLength(min: 1)();
  IntColumn get role => integer().withDefault(const Constant(2))(); // staff default
  BoolColumn get isActive => boolean().named('is_active').withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime().named('created_at').withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().named('updated_at').withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

/// -------------------- CATEGORIES --------------------
@DataClassName('CategoryData')
class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 100).unique()();
  TextColumn get description => text().nullable()();
  IntColumn get parentCategoryId => integer().nullable().named('parent_category_id')();
  DateTimeColumn get createdAt => dateTime().named('created_at').withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().named('updated_at').withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

/// -------------------- PRODUCTS --------------------
@DataClassName('ProductData')
class Products extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1)()();
  TextColumn get barcode => text().nullable()()();
  TextColumn get sku => text().nullable().unique()()();
  IntColumn get categoryId => integer().nullable().named('category_id').references(Categories, #id)();
  TextColumn get imagePath => text().nullable().named('image_path')();
  RealColumn get costPrice => real().named('cost_price')();
  RealColumn get sellingPrice => real().named('selling_price')();
  IntColumn get stockQuantity => integer().named('stock_quantity').withDefault(const Constant(0))();
  IntColumn get lowStockThreshold => integer().named('low_stock_threshold').withDefault(const Constant(5))();
  BoolColumn get isActive => boolean().named('is_active').withDefault(const Constant(true))();
  DateTimeColumn get expirationDate => dateTime().nullable().named('expiration_date')();
  TextColumn get supplier => text().nullable()();
  DateTimeColumn get createdAt => dateTime().named('created_at').withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().named('updated_at').withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<Index> get indexes => [
    Index('idx_products_barcode', {barcode}),
    Index('idx_products_category', {categoryId}),
    Index('idx_products_name', {name}),
  ];
}

/// -------------------- INVENTORY MOVEMENTS --------------------
/// Tracks stock in/out
@DataClassName('InventoryMovementData')
class InventoryMovements extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get productId => integer().named('product_id').references(Products, #id)();
  TextColumn get movementType => text().named('movement_type').withLength(min: 2, max: 3)(); // 'IN' or 'OUT'
  IntColumn get quantity => integer()();
  TextColumn get reason => text().withLength(min: 1)()();
  IntColumn get referenceId => integer().nullable().named('reference_id')(); // transaction id, etc.
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().named('created_at').withDefault(currentDateAndTime)();
}

/// -------------------- TRANSACTIONS --------------------
@DataClassName('TransactionData')
class Transactions extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get transactionDate => dateTime().named('transaction_date').withDefault(currentDateAndTime)();
  IntColumn get cashierId => integer().named('cashier_id').references(Users, #id)();
  RealColumn get totalAmount => real().named('total_amount')();
  RealColumn get discount => real().withDefault(const Constant(0.0))();
  RealColumn get tax => real().withDefault(const Constant(0.0))();
  RealColumn get paymentReceived => real().named('payment_received')();
  RealColumn get changeAmount => real().named('change_amount')();
  TextColumn get paymentMethod => text().named('payment_method').withDefault(const Constant('cash'))(); // 'cash','gcash','maya'
  TextColumn get invoiceNumber => text().named('invoice_number').unique()();
  TextColumn get status => text().withDefault(const Constant('completed'))(); // 'completed','voided'
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().named('created_at').withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<Index> get indexes => [
    Index('idx_transactions_date', {transactionDate}),
    Index('idx_transactions_cashier', {cashierId}),
    Index('idx_transactions_status', {status}),
  ];
}

/// -------------------- TRANSACTION ITEMS --------------------
@DataClassName('TransactionItemData')
class TransactionItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get transactionId => integer().named('transaction_id').references(Transactions, #id)();
  IntColumn get productId => integer().named('product_id').references(Products, #id)();
  IntColumn get quantity => integer()();
  RealColumn get unitPrice => real().named('unit_price')();
  RealColumn get totalPrice => real().named('total_price')();
  RealColumn get discount => real().withDefault(const Constant(0.0))();
}

/// -------------------- CUSTOMERS (for Utang) --------------------
@DataClassName('CustomerData')
class Customers extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1)()();
  TextColumn get phone => text().nullable()()();
  TextColumn get address => text().nullable()()();
  RealColumn get balance => real().withDefault(const Constant(0.0))(); // total outstanding credit
  DateTimeColumn get createdAt => dateTime().named('created_at').withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().named('updated_at').withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

/// -------------------- UTANG TRANSACTIONS --------------------
/// Every borrow or payment
@DataClassName('UtangTransactionData')
class UtangTransactions extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get customerId => integer().named('customer_id').references(Customers, #id)();
  TextColumn get type => text().withLength(min: 3, max: 7)(); // 'borrow' or 'payment'
  RealColumn get amount => real()();
  RealColumn get balanceAfter => real().named('balance_after')();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get transactionDate => dateTime().named('transaction_date').withDefault(currentDateAndTime)();
  DateTimeColumn get createdAt => dateTime().named('created_at').withDefault(currentDateAndTime)();
}

/// -------------------- EXPENSE CATEGORIES --------------------
@DataClassName('ExpenseCategoryData')
class ExpenseCategories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 100).unique()();
  TextColumn get description => text().nullable()();
  DateTimeColumn get createdAt => dateTime().named('created_at').withDefault(currentDateAndTime)();
}

/// -------------------- EXPENSES --------------------
@DataClassName('ExpenseData')
class Expenses extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get categoryId => integer().named('category_id').references(ExpenseCategories, #id)();
  TextColumn get description => text().withLength(min: 1)()();
  RealColumn get amount => real()();
  DateTimeColumn get date => dateTime().withDefault(currentDateAndTime)();
  TextColumn get paymentMethod => text().named('payment_method').withDefault(const Constant('cash'))();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().named('created_at').withDefault(currentDateAndTime)();
}

/// -------------------- SETTINGS / STORE INFO --------------------
@DataClassName('StoreInfoData')
class StoreInfo extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get storeName => text().named('store_name').withDefault(const Constant('Sari-Sari Store'))();
  TextColumn get ownerName => text().named('owner_name').withDefault(const Constant(''))();
  TextColumn get address => text().withDefault(const Constant(''))();
  TextColumn get phone => text().withDefault(const Constant(''))();
  TextColumn get receiptMessage => text().named('receipt_message').withDefault(const Constant('Thank you!'))();
  TextColumn get logoPath => text().nullable().named('logo_path')();

  @override
  Set<Column> get primaryKey => {id};
}

/// -------------------- APP SETTINGS (key-value) --------------------
@DataClassName('AppSettingData')
class AppSettings extends Table {
  TextColumn get key => text().withLength(min: 1)()();
  TextColumn get value => text()();

  @override
  Set<Column> get primaryKey => {key};
}