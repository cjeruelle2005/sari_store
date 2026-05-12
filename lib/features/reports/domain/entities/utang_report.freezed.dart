// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'utang_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UtangReport _$UtangReportFromJson(Map<String, dynamic> json) {
  return _UtangReport.fromJson(json);
}

/// @nodoc
mixin _$UtangReport {
  int get totalCustomers => throw _privateConstructorUsedError;
  double get totalOutstandingBalance => throw _privateConstructorUsedError;
  List<CustomerBalance> get topDebtors => throw _privateConstructorUsedError;

  /// Serializes this UtangReport to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UtangReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UtangReportCopyWith<UtangReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UtangReportCopyWith<$Res> {
  factory $UtangReportCopyWith(
          UtangReport value, $Res Function(UtangReport) then) =
      _$UtangReportCopyWithImpl<$Res, UtangReport>;
  @useResult
  $Res call(
      {int totalCustomers,
      double totalOutstandingBalance,
      List<CustomerBalance> topDebtors});
}

/// @nodoc
class _$UtangReportCopyWithImpl<$Res, $Val extends UtangReport>
    implements $UtangReportCopyWith<$Res> {
  _$UtangReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UtangReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCustomers = null,
    Object? totalOutstandingBalance = null,
    Object? topDebtors = null,
  }) {
    return _then(_value.copyWith(
      totalCustomers: null == totalCustomers
          ? _value.totalCustomers
          : totalCustomers // ignore: cast_nullable_to_non_nullable
              as int,
      totalOutstandingBalance: null == totalOutstandingBalance
          ? _value.totalOutstandingBalance
          : totalOutstandingBalance // ignore: cast_nullable_to_non_nullable
              as double,
      topDebtors: null == topDebtors
          ? _value.topDebtors
          : topDebtors // ignore: cast_nullable_to_non_nullable
              as List<CustomerBalance>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UtangReportImplCopyWith<$Res>
    implements $UtangReportCopyWith<$Res> {
  factory _$$UtangReportImplCopyWith(
          _$UtangReportImpl value, $Res Function(_$UtangReportImpl) then) =
      __$$UtangReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalCustomers,
      double totalOutstandingBalance,
      List<CustomerBalance> topDebtors});
}

/// @nodoc
class __$$UtangReportImplCopyWithImpl<$Res>
    extends _$UtangReportCopyWithImpl<$Res, _$UtangReportImpl>
    implements _$$UtangReportImplCopyWith<$Res> {
  __$$UtangReportImplCopyWithImpl(
      _$UtangReportImpl _value, $Res Function(_$UtangReportImpl) _then)
      : super(_value, _then);

  /// Create a copy of UtangReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCustomers = null,
    Object? totalOutstandingBalance = null,
    Object? topDebtors = null,
  }) {
    return _then(_$UtangReportImpl(
      totalCustomers: null == totalCustomers
          ? _value.totalCustomers
          : totalCustomers // ignore: cast_nullable_to_non_nullable
              as int,
      totalOutstandingBalance: null == totalOutstandingBalance
          ? _value.totalOutstandingBalance
          : totalOutstandingBalance // ignore: cast_nullable_to_non_nullable
              as double,
      topDebtors: null == topDebtors
          ? _value._topDebtors
          : topDebtors // ignore: cast_nullable_to_non_nullable
              as List<CustomerBalance>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UtangReportImpl implements _UtangReport {
  const _$UtangReportImpl(
      {required this.totalCustomers,
      required this.totalOutstandingBalance,
      required final List<CustomerBalance> topDebtors})
      : _topDebtors = topDebtors;

  factory _$UtangReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$UtangReportImplFromJson(json);

  @override
  final int totalCustomers;
  @override
  final double totalOutstandingBalance;
  final List<CustomerBalance> _topDebtors;
  @override
  List<CustomerBalance> get topDebtors {
    if (_topDebtors is EqualUnmodifiableListView) return _topDebtors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topDebtors);
  }

  @override
  String toString() {
    return 'UtangReport(totalCustomers: $totalCustomers, totalOutstandingBalance: $totalOutstandingBalance, topDebtors: $topDebtors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UtangReportImpl &&
            (identical(other.totalCustomers, totalCustomers) ||
                other.totalCustomers == totalCustomers) &&
            (identical(
                    other.totalOutstandingBalance, totalOutstandingBalance) ||
                other.totalOutstandingBalance == totalOutstandingBalance) &&
            const DeepCollectionEquality()
                .equals(other._topDebtors, _topDebtors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalCustomers,
      totalOutstandingBalance,
      const DeepCollectionEquality().hash(_topDebtors));

  /// Create a copy of UtangReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UtangReportImplCopyWith<_$UtangReportImpl> get copyWith =>
      __$$UtangReportImplCopyWithImpl<_$UtangReportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UtangReportImplToJson(
      this,
    );
  }
}

abstract class _UtangReport implements UtangReport {
  const factory _UtangReport(
      {required final int totalCustomers,
      required final double totalOutstandingBalance,
      required final List<CustomerBalance> topDebtors}) = _$UtangReportImpl;

  factory _UtangReport.fromJson(Map<String, dynamic> json) =
      _$UtangReportImpl.fromJson;

  @override
  int get totalCustomers;
  @override
  double get totalOutstandingBalance;
  @override
  List<CustomerBalance> get topDebtors;

  /// Create a copy of UtangReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UtangReportImplCopyWith<_$UtangReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomerBalance _$CustomerBalanceFromJson(Map<String, dynamic> json) {
  return _CustomerBalance.fromJson(json);
}

/// @nodoc
mixin _$CustomerBalance {
  String get customerName => throw _privateConstructorUsedError;
  double get balance => throw _privateConstructorUsedError;

  /// Serializes this CustomerBalance to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerBalance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerBalanceCopyWith<CustomerBalance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerBalanceCopyWith<$Res> {
  factory $CustomerBalanceCopyWith(
          CustomerBalance value, $Res Function(CustomerBalance) then) =
      _$CustomerBalanceCopyWithImpl<$Res, CustomerBalance>;
  @useResult
  $Res call({String customerName, double balance});
}

/// @nodoc
class _$CustomerBalanceCopyWithImpl<$Res, $Val extends CustomerBalance>
    implements $CustomerBalanceCopyWith<$Res> {
  _$CustomerBalanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerBalance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerName = null,
    Object? balance = null,
  }) {
    return _then(_value.copyWith(
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerBalanceImplCopyWith<$Res>
    implements $CustomerBalanceCopyWith<$Res> {
  factory _$$CustomerBalanceImplCopyWith(_$CustomerBalanceImpl value,
          $Res Function(_$CustomerBalanceImpl) then) =
      __$$CustomerBalanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String customerName, double balance});
}

/// @nodoc
class __$$CustomerBalanceImplCopyWithImpl<$Res>
    extends _$CustomerBalanceCopyWithImpl<$Res, _$CustomerBalanceImpl>
    implements _$$CustomerBalanceImplCopyWith<$Res> {
  __$$CustomerBalanceImplCopyWithImpl(
      _$CustomerBalanceImpl _value, $Res Function(_$CustomerBalanceImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomerBalance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerName = null,
    Object? balance = null,
  }) {
    return _then(_$CustomerBalanceImpl(
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerBalanceImpl implements _CustomerBalance {
  const _$CustomerBalanceImpl(
      {required this.customerName, required this.balance});

  factory _$CustomerBalanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerBalanceImplFromJson(json);

  @override
  final String customerName;
  @override
  final double balance;

  @override
  String toString() {
    return 'CustomerBalance(customerName: $customerName, balance: $balance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerBalanceImpl &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.balance, balance) || other.balance == balance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, customerName, balance);

  /// Create a copy of CustomerBalance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerBalanceImplCopyWith<_$CustomerBalanceImpl> get copyWith =>
      __$$CustomerBalanceImplCopyWithImpl<_$CustomerBalanceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerBalanceImplToJson(
      this,
    );
  }
}

abstract class _CustomerBalance implements CustomerBalance {
  const factory _CustomerBalance(
      {required final String customerName,
      required final double balance}) = _$CustomerBalanceImpl;

  factory _CustomerBalance.fromJson(Map<String, dynamic> json) =
      _$CustomerBalanceImpl.fromJson;

  @override
  String get customerName;
  @override
  double get balance;

  /// Create a copy of CustomerBalance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerBalanceImplCopyWith<_$CustomerBalanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
