// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DashboardData _$DashboardDataFromJson(Map<String, dynamic> json) {
  return _DashboardData.fromJson(json);
}

/// @nodoc
mixin _$DashboardData {
  double get dailySales => throw _privateConstructorUsedError;
  double get monthlySales => throw _privateConstructorUsedError;
  double get totalRevenue =>
      throw _privateConstructorUsedError; // All-time sales sum (or month? We'll use month-to-date.)
  double get totalExpenses => throw _privateConstructorUsedError;
  int get lowStockCount => throw _privateConstructorUsedError;
  List<BestSeller> get bestSellers => throw _privateConstructorUsedError;
  List<RecentTransaction> get recentTransactions =>
      throw _privateConstructorUsedError;

  /// Serializes this DashboardData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardDataCopyWith<DashboardData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardDataCopyWith<$Res> {
  factory $DashboardDataCopyWith(
          DashboardData value, $Res Function(DashboardData) then) =
      _$DashboardDataCopyWithImpl<$Res, DashboardData>;
  @useResult
  $Res call(
      {double dailySales,
      double monthlySales,
      double totalRevenue,
      double totalExpenses,
      int lowStockCount,
      List<BestSeller> bestSellers,
      List<RecentTransaction> recentTransactions});
}

/// @nodoc
class _$DashboardDataCopyWithImpl<$Res, $Val extends DashboardData>
    implements $DashboardDataCopyWith<$Res> {
  _$DashboardDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dailySales = null,
    Object? monthlySales = null,
    Object? totalRevenue = null,
    Object? totalExpenses = null,
    Object? lowStockCount = null,
    Object? bestSellers = null,
    Object? recentTransactions = null,
  }) {
    return _then(_value.copyWith(
      dailySales: null == dailySales
          ? _value.dailySales
          : dailySales // ignore: cast_nullable_to_non_nullable
              as double,
      monthlySales: null == monthlySales
          ? _value.monthlySales
          : monthlySales // ignore: cast_nullable_to_non_nullable
              as double,
      totalRevenue: null == totalRevenue
          ? _value.totalRevenue
          : totalRevenue // ignore: cast_nullable_to_non_nullable
              as double,
      totalExpenses: null == totalExpenses
          ? _value.totalExpenses
          : totalExpenses // ignore: cast_nullable_to_non_nullable
              as double,
      lowStockCount: null == lowStockCount
          ? _value.lowStockCount
          : lowStockCount // ignore: cast_nullable_to_non_nullable
              as int,
      bestSellers: null == bestSellers
          ? _value.bestSellers
          : bestSellers // ignore: cast_nullable_to_non_nullable
              as List<BestSeller>,
      recentTransactions: null == recentTransactions
          ? _value.recentTransactions
          : recentTransactions // ignore: cast_nullable_to_non_nullable
              as List<RecentTransaction>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DashboardDataImplCopyWith<$Res>
    implements $DashboardDataCopyWith<$Res> {
  factory _$$DashboardDataImplCopyWith(
          _$DashboardDataImpl value, $Res Function(_$DashboardDataImpl) then) =
      __$$DashboardDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double dailySales,
      double monthlySales,
      double totalRevenue,
      double totalExpenses,
      int lowStockCount,
      List<BestSeller> bestSellers,
      List<RecentTransaction> recentTransactions});
}

/// @nodoc
class __$$DashboardDataImplCopyWithImpl<$Res>
    extends _$DashboardDataCopyWithImpl<$Res, _$DashboardDataImpl>
    implements _$$DashboardDataImplCopyWith<$Res> {
  __$$DashboardDataImplCopyWithImpl(
      _$DashboardDataImpl _value, $Res Function(_$DashboardDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dailySales = null,
    Object? monthlySales = null,
    Object? totalRevenue = null,
    Object? totalExpenses = null,
    Object? lowStockCount = null,
    Object? bestSellers = null,
    Object? recentTransactions = null,
  }) {
    return _then(_$DashboardDataImpl(
      dailySales: null == dailySales
          ? _value.dailySales
          : dailySales // ignore: cast_nullable_to_non_nullable
              as double,
      monthlySales: null == monthlySales
          ? _value.monthlySales
          : monthlySales // ignore: cast_nullable_to_non_nullable
              as double,
      totalRevenue: null == totalRevenue
          ? _value.totalRevenue
          : totalRevenue // ignore: cast_nullable_to_non_nullable
              as double,
      totalExpenses: null == totalExpenses
          ? _value.totalExpenses
          : totalExpenses // ignore: cast_nullable_to_non_nullable
              as double,
      lowStockCount: null == lowStockCount
          ? _value.lowStockCount
          : lowStockCount // ignore: cast_nullable_to_non_nullable
              as int,
      bestSellers: null == bestSellers
          ? _value._bestSellers
          : bestSellers // ignore: cast_nullable_to_non_nullable
              as List<BestSeller>,
      recentTransactions: null == recentTransactions
          ? _value._recentTransactions
          : recentTransactions // ignore: cast_nullable_to_non_nullable
              as List<RecentTransaction>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardDataImpl implements _DashboardData {
  const _$DashboardDataImpl(
      {required this.dailySales,
      required this.monthlySales,
      required this.totalRevenue,
      required this.totalExpenses,
      required this.lowStockCount,
      required final List<BestSeller> bestSellers,
      required final List<RecentTransaction> recentTransactions})
      : _bestSellers = bestSellers,
        _recentTransactions = recentTransactions;

  factory _$DashboardDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardDataImplFromJson(json);

  @override
  final double dailySales;
  @override
  final double monthlySales;
  @override
  final double totalRevenue;
// All-time sales sum (or month? We'll use month-to-date.)
  @override
  final double totalExpenses;
  @override
  final int lowStockCount;
  final List<BestSeller> _bestSellers;
  @override
  List<BestSeller> get bestSellers {
    if (_bestSellers is EqualUnmodifiableListView) return _bestSellers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bestSellers);
  }

  final List<RecentTransaction> _recentTransactions;
  @override
  List<RecentTransaction> get recentTransactions {
    if (_recentTransactions is EqualUnmodifiableListView)
      return _recentTransactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentTransactions);
  }

  @override
  String toString() {
    return 'DashboardData(dailySales: $dailySales, monthlySales: $monthlySales, totalRevenue: $totalRevenue, totalExpenses: $totalExpenses, lowStockCount: $lowStockCount, bestSellers: $bestSellers, recentTransactions: $recentTransactions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardDataImpl &&
            (identical(other.dailySales, dailySales) ||
                other.dailySales == dailySales) &&
            (identical(other.monthlySales, monthlySales) ||
                other.monthlySales == monthlySales) &&
            (identical(other.totalRevenue, totalRevenue) ||
                other.totalRevenue == totalRevenue) &&
            (identical(other.totalExpenses, totalExpenses) ||
                other.totalExpenses == totalExpenses) &&
            (identical(other.lowStockCount, lowStockCount) ||
                other.lowStockCount == lowStockCount) &&
            const DeepCollectionEquality()
                .equals(other._bestSellers, _bestSellers) &&
            const DeepCollectionEquality()
                .equals(other._recentTransactions, _recentTransactions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      dailySales,
      monthlySales,
      totalRevenue,
      totalExpenses,
      lowStockCount,
      const DeepCollectionEquality().hash(_bestSellers),
      const DeepCollectionEquality().hash(_recentTransactions));

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardDataImplCopyWith<_$DashboardDataImpl> get copyWith =>
      __$$DashboardDataImplCopyWithImpl<_$DashboardDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardDataImplToJson(
      this,
    );
  }
}

abstract class _DashboardData implements DashboardData {
  const factory _DashboardData(
          {required final double dailySales,
          required final double monthlySales,
          required final double totalRevenue,
          required final double totalExpenses,
          required final int lowStockCount,
          required final List<BestSeller> bestSellers,
          required final List<RecentTransaction> recentTransactions}) =
      _$DashboardDataImpl;

  factory _DashboardData.fromJson(Map<String, dynamic> json) =
      _$DashboardDataImpl.fromJson;

  @override
  double get dailySales;
  @override
  double get monthlySales;
  @override
  double
      get totalRevenue; // All-time sales sum (or month? We'll use month-to-date.)
  @override
  double get totalExpenses;
  @override
  int get lowStockCount;
  @override
  List<BestSeller> get bestSellers;
  @override
  List<RecentTransaction> get recentTransactions;

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardDataImplCopyWith<_$DashboardDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BestSeller _$BestSellerFromJson(Map<String, dynamic> json) {
  return _BestSeller.fromJson(json);
}

/// @nodoc
mixin _$BestSeller {
  String get productName => throw _privateConstructorUsedError;
  int get quantitySold => throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;

  /// Serializes this BestSeller to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BestSeller
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BestSellerCopyWith<BestSeller> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BestSellerCopyWith<$Res> {
  factory $BestSellerCopyWith(
          BestSeller value, $Res Function(BestSeller) then) =
      _$BestSellerCopyWithImpl<$Res, BestSeller>;
  @useResult
  $Res call({String productName, int quantitySold, double totalAmount});
}

/// @nodoc
class _$BestSellerCopyWithImpl<$Res, $Val extends BestSeller>
    implements $BestSellerCopyWith<$Res> {
  _$BestSellerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BestSeller
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productName = null,
    Object? quantitySold = null,
    Object? totalAmount = null,
  }) {
    return _then(_value.copyWith(
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      quantitySold: null == quantitySold
          ? _value.quantitySold
          : quantitySold // ignore: cast_nullable_to_non_nullable
              as int,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BestSellerImplCopyWith<$Res>
    implements $BestSellerCopyWith<$Res> {
  factory _$$BestSellerImplCopyWith(
          _$BestSellerImpl value, $Res Function(_$BestSellerImpl) then) =
      __$$BestSellerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String productName, int quantitySold, double totalAmount});
}

/// @nodoc
class __$$BestSellerImplCopyWithImpl<$Res>
    extends _$BestSellerCopyWithImpl<$Res, _$BestSellerImpl>
    implements _$$BestSellerImplCopyWith<$Res> {
  __$$BestSellerImplCopyWithImpl(
      _$BestSellerImpl _value, $Res Function(_$BestSellerImpl) _then)
      : super(_value, _then);

  /// Create a copy of BestSeller
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productName = null,
    Object? quantitySold = null,
    Object? totalAmount = null,
  }) {
    return _then(_$BestSellerImpl(
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      quantitySold: null == quantitySold
          ? _value.quantitySold
          : quantitySold // ignore: cast_nullable_to_non_nullable
              as int,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BestSellerImpl implements _BestSeller {
  const _$BestSellerImpl(
      {required this.productName,
      required this.quantitySold,
      required this.totalAmount});

  factory _$BestSellerImpl.fromJson(Map<String, dynamic> json) =>
      _$$BestSellerImplFromJson(json);

  @override
  final String productName;
  @override
  final int quantitySold;
  @override
  final double totalAmount;

  @override
  String toString() {
    return 'BestSeller(productName: $productName, quantitySold: $quantitySold, totalAmount: $totalAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BestSellerImpl &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.quantitySold, quantitySold) ||
                other.quantitySold == quantitySold) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, productName, quantitySold, totalAmount);

  /// Create a copy of BestSeller
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BestSellerImplCopyWith<_$BestSellerImpl> get copyWith =>
      __$$BestSellerImplCopyWithImpl<_$BestSellerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BestSellerImplToJson(
      this,
    );
  }
}

abstract class _BestSeller implements BestSeller {
  const factory _BestSeller(
      {required final String productName,
      required final int quantitySold,
      required final double totalAmount}) = _$BestSellerImpl;

  factory _BestSeller.fromJson(Map<String, dynamic> json) =
      _$BestSellerImpl.fromJson;

  @override
  String get productName;
  @override
  int get quantitySold;
  @override
  double get totalAmount;

  /// Create a copy of BestSeller
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BestSellerImplCopyWith<_$BestSellerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RecentTransaction _$RecentTransactionFromJson(Map<String, dynamic> json) {
  return _RecentTransaction.fromJson(json);
}

/// @nodoc
mixin _$RecentTransaction {
  int get id => throw _privateConstructorUsedError;
  String get invoiceNumber => throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get cashierName => throw _privateConstructorUsedError;
  int get itemCount => throw _privateConstructorUsedError;

  /// Serializes this RecentTransaction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecentTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecentTransactionCopyWith<RecentTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentTransactionCopyWith<$Res> {
  factory $RecentTransactionCopyWith(
          RecentTransaction value, $Res Function(RecentTransaction) then) =
      _$RecentTransactionCopyWithImpl<$Res, RecentTransaction>;
  @useResult
  $Res call(
      {int id,
      String invoiceNumber,
      double totalAmount,
      DateTime date,
      String cashierName,
      int itemCount});
}

/// @nodoc
class _$RecentTransactionCopyWithImpl<$Res, $Val extends RecentTransaction>
    implements $RecentTransactionCopyWith<$Res> {
  _$RecentTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecentTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? invoiceNumber = null,
    Object? totalAmount = null,
    Object? date = null,
    Object? cashierName = null,
    Object? itemCount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      invoiceNumber: null == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      cashierName: null == cashierName
          ? _value.cashierName
          : cashierName // ignore: cast_nullable_to_non_nullable
              as String,
      itemCount: null == itemCount
          ? _value.itemCount
          : itemCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecentTransactionImplCopyWith<$Res>
    implements $RecentTransactionCopyWith<$Res> {
  factory _$$RecentTransactionImplCopyWith(_$RecentTransactionImpl value,
          $Res Function(_$RecentTransactionImpl) then) =
      __$$RecentTransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String invoiceNumber,
      double totalAmount,
      DateTime date,
      String cashierName,
      int itemCount});
}

/// @nodoc
class __$$RecentTransactionImplCopyWithImpl<$Res>
    extends _$RecentTransactionCopyWithImpl<$Res, _$RecentTransactionImpl>
    implements _$$RecentTransactionImplCopyWith<$Res> {
  __$$RecentTransactionImplCopyWithImpl(_$RecentTransactionImpl _value,
      $Res Function(_$RecentTransactionImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecentTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? invoiceNumber = null,
    Object? totalAmount = null,
    Object? date = null,
    Object? cashierName = null,
    Object? itemCount = null,
  }) {
    return _then(_$RecentTransactionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      invoiceNumber: null == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      cashierName: null == cashierName
          ? _value.cashierName
          : cashierName // ignore: cast_nullable_to_non_nullable
              as String,
      itemCount: null == itemCount
          ? _value.itemCount
          : itemCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecentTransactionImpl implements _RecentTransaction {
  const _$RecentTransactionImpl(
      {required this.id,
      required this.invoiceNumber,
      required this.totalAmount,
      required this.date,
      required this.cashierName,
      required this.itemCount});

  factory _$RecentTransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecentTransactionImplFromJson(json);

  @override
  final int id;
  @override
  final String invoiceNumber;
  @override
  final double totalAmount;
  @override
  final DateTime date;
  @override
  final String cashierName;
  @override
  final int itemCount;

  @override
  String toString() {
    return 'RecentTransaction(id: $id, invoiceNumber: $invoiceNumber, totalAmount: $totalAmount, date: $date, cashierName: $cashierName, itemCount: $itemCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecentTransactionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.cashierName, cashierName) ||
                other.cashierName == cashierName) &&
            (identical(other.itemCount, itemCount) ||
                other.itemCount == itemCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, invoiceNumber, totalAmount,
      date, cashierName, itemCount);

  /// Create a copy of RecentTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecentTransactionImplCopyWith<_$RecentTransactionImpl> get copyWith =>
      __$$RecentTransactionImplCopyWithImpl<_$RecentTransactionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecentTransactionImplToJson(
      this,
    );
  }
}

abstract class _RecentTransaction implements RecentTransaction {
  const factory _RecentTransaction(
      {required final int id,
      required final String invoiceNumber,
      required final double totalAmount,
      required final DateTime date,
      required final String cashierName,
      required final int itemCount}) = _$RecentTransactionImpl;

  factory _RecentTransaction.fromJson(Map<String, dynamic> json) =
      _$RecentTransactionImpl.fromJson;

  @override
  int get id;
  @override
  String get invoiceNumber;
  @override
  double get totalAmount;
  @override
  DateTime get date;
  @override
  String get cashierName;
  @override
  int get itemCount;

  /// Create a copy of RecentTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecentTransactionImplCopyWith<_$RecentTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
