// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SalesReport _$SalesReportFromJson(Map<String, dynamic> json) {
  return _SalesReport.fromJson(json);
}

/// @nodoc
mixin _$SalesReport {
  DateTime get from => throw _privateConstructorUsedError;
  DateTime get to => throw _privateConstructorUsedError;
  double get totalSales => throw _privateConstructorUsedError;
  int get totalTransactions => throw _privateConstructorUsedError;
  double get averageTransaction => throw _privateConstructorUsedError;
  List<DailySales> get dailyBreakdown => throw _privateConstructorUsedError;
  List<ProductSales> get topProducts => throw _privateConstructorUsedError;

  /// Serializes this SalesReport to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SalesReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SalesReportCopyWith<SalesReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesReportCopyWith<$Res> {
  factory $SalesReportCopyWith(
          SalesReport value, $Res Function(SalesReport) then) =
      _$SalesReportCopyWithImpl<$Res, SalesReport>;
  @useResult
  $Res call(
      {DateTime from,
      DateTime to,
      double totalSales,
      int totalTransactions,
      double averageTransaction,
      List<DailySales> dailyBreakdown,
      List<ProductSales> topProducts});
}

/// @nodoc
class _$SalesReportCopyWithImpl<$Res, $Val extends SalesReport>
    implements $SalesReportCopyWith<$Res> {
  _$SalesReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SalesReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? to = null,
    Object? totalSales = null,
    Object? totalTransactions = null,
    Object? averageTransaction = null,
    Object? dailyBreakdown = null,
    Object? topProducts = null,
  }) {
    return _then(_value.copyWith(
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as DateTime,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalSales: null == totalSales
          ? _value.totalSales
          : totalSales // ignore: cast_nullable_to_non_nullable
              as double,
      totalTransactions: null == totalTransactions
          ? _value.totalTransactions
          : totalTransactions // ignore: cast_nullable_to_non_nullable
              as int,
      averageTransaction: null == averageTransaction
          ? _value.averageTransaction
          : averageTransaction // ignore: cast_nullable_to_non_nullable
              as double,
      dailyBreakdown: null == dailyBreakdown
          ? _value.dailyBreakdown
          : dailyBreakdown // ignore: cast_nullable_to_non_nullable
              as List<DailySales>,
      topProducts: null == topProducts
          ? _value.topProducts
          : topProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductSales>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SalesReportImplCopyWith<$Res>
    implements $SalesReportCopyWith<$Res> {
  factory _$$SalesReportImplCopyWith(
          _$SalesReportImpl value, $Res Function(_$SalesReportImpl) then) =
      __$$SalesReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime from,
      DateTime to,
      double totalSales,
      int totalTransactions,
      double averageTransaction,
      List<DailySales> dailyBreakdown,
      List<ProductSales> topProducts});
}

/// @nodoc
class __$$SalesReportImplCopyWithImpl<$Res>
    extends _$SalesReportCopyWithImpl<$Res, _$SalesReportImpl>
    implements _$$SalesReportImplCopyWith<$Res> {
  __$$SalesReportImplCopyWithImpl(
      _$SalesReportImpl _value, $Res Function(_$SalesReportImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? to = null,
    Object? totalSales = null,
    Object? totalTransactions = null,
    Object? averageTransaction = null,
    Object? dailyBreakdown = null,
    Object? topProducts = null,
  }) {
    return _then(_$SalesReportImpl(
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as DateTime,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalSales: null == totalSales
          ? _value.totalSales
          : totalSales // ignore: cast_nullable_to_non_nullable
              as double,
      totalTransactions: null == totalTransactions
          ? _value.totalTransactions
          : totalTransactions // ignore: cast_nullable_to_non_nullable
              as int,
      averageTransaction: null == averageTransaction
          ? _value.averageTransaction
          : averageTransaction // ignore: cast_nullable_to_non_nullable
              as double,
      dailyBreakdown: null == dailyBreakdown
          ? _value._dailyBreakdown
          : dailyBreakdown // ignore: cast_nullable_to_non_nullable
              as List<DailySales>,
      topProducts: null == topProducts
          ? _value._topProducts
          : topProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductSales>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SalesReportImpl implements _SalesReport {
  const _$SalesReportImpl(
      {required this.from,
      required this.to,
      required this.totalSales,
      required this.totalTransactions,
      required this.averageTransaction,
      required final List<DailySales> dailyBreakdown,
      required final List<ProductSales> topProducts})
      : _dailyBreakdown = dailyBreakdown,
        _topProducts = topProducts;

  factory _$SalesReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$SalesReportImplFromJson(json);

  @override
  final DateTime from;
  @override
  final DateTime to;
  @override
  final double totalSales;
  @override
  final int totalTransactions;
  @override
  final double averageTransaction;
  final List<DailySales> _dailyBreakdown;
  @override
  List<DailySales> get dailyBreakdown {
    if (_dailyBreakdown is EqualUnmodifiableListView) return _dailyBreakdown;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dailyBreakdown);
  }

  final List<ProductSales> _topProducts;
  @override
  List<ProductSales> get topProducts {
    if (_topProducts is EqualUnmodifiableListView) return _topProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topProducts);
  }

  @override
  String toString() {
    return 'SalesReport(from: $from, to: $to, totalSales: $totalSales, totalTransactions: $totalTransactions, averageTransaction: $averageTransaction, dailyBreakdown: $dailyBreakdown, topProducts: $topProducts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalesReportImpl &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.totalSales, totalSales) ||
                other.totalSales == totalSales) &&
            (identical(other.totalTransactions, totalTransactions) ||
                other.totalTransactions == totalTransactions) &&
            (identical(other.averageTransaction, averageTransaction) ||
                other.averageTransaction == averageTransaction) &&
            const DeepCollectionEquality()
                .equals(other._dailyBreakdown, _dailyBreakdown) &&
            const DeepCollectionEquality()
                .equals(other._topProducts, _topProducts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      from,
      to,
      totalSales,
      totalTransactions,
      averageTransaction,
      const DeepCollectionEquality().hash(_dailyBreakdown),
      const DeepCollectionEquality().hash(_topProducts));

  /// Create a copy of SalesReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SalesReportImplCopyWith<_$SalesReportImpl> get copyWith =>
      __$$SalesReportImplCopyWithImpl<_$SalesReportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalesReportImplToJson(
      this,
    );
  }
}

abstract class _SalesReport implements SalesReport {
  const factory _SalesReport(
      {required final DateTime from,
      required final DateTime to,
      required final double totalSales,
      required final int totalTransactions,
      required final double averageTransaction,
      required final List<DailySales> dailyBreakdown,
      required final List<ProductSales> topProducts}) = _$SalesReportImpl;

  factory _SalesReport.fromJson(Map<String, dynamic> json) =
      _$SalesReportImpl.fromJson;

  @override
  DateTime get from;
  @override
  DateTime get to;
  @override
  double get totalSales;
  @override
  int get totalTransactions;
  @override
  double get averageTransaction;
  @override
  List<DailySales> get dailyBreakdown;
  @override
  List<ProductSales> get topProducts;

  /// Create a copy of SalesReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SalesReportImplCopyWith<_$SalesReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DailySales _$DailySalesFromJson(Map<String, dynamic> json) {
  return _DailySales.fromJson(json);
}

/// @nodoc
mixin _$DailySales {
  DateTime get date => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  int get transactions => throw _privateConstructorUsedError;

  /// Serializes this DailySales to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailySales
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailySalesCopyWith<DailySales> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailySalesCopyWith<$Res> {
  factory $DailySalesCopyWith(
          DailySales value, $Res Function(DailySales) then) =
      _$DailySalesCopyWithImpl<$Res, DailySales>;
  @useResult
  $Res call({DateTime date, double total, int transactions});
}

/// @nodoc
class _$DailySalesCopyWithImpl<$Res, $Val extends DailySales>
    implements $DailySalesCopyWith<$Res> {
  _$DailySalesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailySales
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? total = null,
    Object? transactions = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      transactions: null == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailySalesImplCopyWith<$Res>
    implements $DailySalesCopyWith<$Res> {
  factory _$$DailySalesImplCopyWith(
          _$DailySalesImpl value, $Res Function(_$DailySalesImpl) then) =
      __$$DailySalesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, double total, int transactions});
}

/// @nodoc
class __$$DailySalesImplCopyWithImpl<$Res>
    extends _$DailySalesCopyWithImpl<$Res, _$DailySalesImpl>
    implements _$$DailySalesImplCopyWith<$Res> {
  __$$DailySalesImplCopyWithImpl(
      _$DailySalesImpl _value, $Res Function(_$DailySalesImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailySales
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? total = null,
    Object? transactions = null,
  }) {
    return _then(_$DailySalesImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      transactions: null == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailySalesImpl implements _DailySales {
  const _$DailySalesImpl(
      {required this.date, required this.total, required this.transactions});

  factory _$DailySalesImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailySalesImplFromJson(json);

  @override
  final DateTime date;
  @override
  final double total;
  @override
  final int transactions;

  @override
  String toString() {
    return 'DailySales(date: $date, total: $total, transactions: $transactions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailySalesImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.transactions, transactions) ||
                other.transactions == transactions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, total, transactions);

  /// Create a copy of DailySales
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailySalesImplCopyWith<_$DailySalesImpl> get copyWith =>
      __$$DailySalesImplCopyWithImpl<_$DailySalesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailySalesImplToJson(
      this,
    );
  }
}

abstract class _DailySales implements DailySales {
  const factory _DailySales(
      {required final DateTime date,
      required final double total,
      required final int transactions}) = _$DailySalesImpl;

  factory _DailySales.fromJson(Map<String, dynamic> json) =
      _$DailySalesImpl.fromJson;

  @override
  DateTime get date;
  @override
  double get total;
  @override
  int get transactions;

  /// Create a copy of DailySales
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailySalesImplCopyWith<_$DailySalesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductSales _$ProductSalesFromJson(Map<String, dynamic> json) {
  return _ProductSales.fromJson(json);
}

/// @nodoc
mixin _$ProductSales {
  String get productName => throw _privateConstructorUsedError;
  int get quantitySold => throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;

  /// Serializes this ProductSales to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductSales
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductSalesCopyWith<ProductSales> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductSalesCopyWith<$Res> {
  factory $ProductSalesCopyWith(
          ProductSales value, $Res Function(ProductSales) then) =
      _$ProductSalesCopyWithImpl<$Res, ProductSales>;
  @useResult
  $Res call({String productName, int quantitySold, double totalAmount});
}

/// @nodoc
class _$ProductSalesCopyWithImpl<$Res, $Val extends ProductSales>
    implements $ProductSalesCopyWith<$Res> {
  _$ProductSalesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductSales
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
abstract class _$$ProductSalesImplCopyWith<$Res>
    implements $ProductSalesCopyWith<$Res> {
  factory _$$ProductSalesImplCopyWith(
          _$ProductSalesImpl value, $Res Function(_$ProductSalesImpl) then) =
      __$$ProductSalesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String productName, int quantitySold, double totalAmount});
}

/// @nodoc
class __$$ProductSalesImplCopyWithImpl<$Res>
    extends _$ProductSalesCopyWithImpl<$Res, _$ProductSalesImpl>
    implements _$$ProductSalesImplCopyWith<$Res> {
  __$$ProductSalesImplCopyWithImpl(
      _$ProductSalesImpl _value, $Res Function(_$ProductSalesImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductSales
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productName = null,
    Object? quantitySold = null,
    Object? totalAmount = null,
  }) {
    return _then(_$ProductSalesImpl(
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
class _$ProductSalesImpl implements _ProductSales {
  const _$ProductSalesImpl(
      {required this.productName,
      required this.quantitySold,
      required this.totalAmount});

  factory _$ProductSalesImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductSalesImplFromJson(json);

  @override
  final String productName;
  @override
  final int quantitySold;
  @override
  final double totalAmount;

  @override
  String toString() {
    return 'ProductSales(productName: $productName, quantitySold: $quantitySold, totalAmount: $totalAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductSalesImpl &&
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

  /// Create a copy of ProductSales
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductSalesImplCopyWith<_$ProductSalesImpl> get copyWith =>
      __$$ProductSalesImplCopyWithImpl<_$ProductSalesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductSalesImplToJson(
      this,
    );
  }
}

abstract class _ProductSales implements ProductSales {
  const factory _ProductSales(
      {required final String productName,
      required final int quantitySold,
      required final double totalAmount}) = _$ProductSalesImpl;

  factory _ProductSales.fromJson(Map<String, dynamic> json) =
      _$ProductSalesImpl.fromJson;

  @override
  String get productName;
  @override
  int get quantitySold;
  @override
  double get totalAmount;

  /// Create a copy of ProductSales
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductSalesImplCopyWith<_$ProductSalesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
