// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'utang_transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UtangTransaction _$UtangTransactionFromJson(Map<String, dynamic> json) {
  return _UtangTransaction.fromJson(json);
}

/// @nodoc
mixin _$UtangTransaction {
  int get id => throw _privateConstructorUsedError;
  int get customerId => throw _privateConstructorUsedError;
  UtangType get type => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  double get balanceAfter => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  DateTime get transactionDate => throw _privateConstructorUsedError;

  /// Serializes this UtangTransaction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UtangTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UtangTransactionCopyWith<UtangTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UtangTransactionCopyWith<$Res> {
  factory $UtangTransactionCopyWith(
          UtangTransaction value, $Res Function(UtangTransaction) then) =
      _$UtangTransactionCopyWithImpl<$Res, UtangTransaction>;
  @useResult
  $Res call(
      {int id,
      int customerId,
      UtangType type,
      double amount,
      double balanceAfter,
      String? notes,
      DateTime transactionDate});
}

/// @nodoc
class _$UtangTransactionCopyWithImpl<$Res, $Val extends UtangTransaction>
    implements $UtangTransactionCopyWith<$Res> {
  _$UtangTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UtangTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? customerId = null,
    Object? type = null,
    Object? amount = null,
    Object? balanceAfter = null,
    Object? notes = freezed,
    Object? transactionDate = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as UtangType,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      balanceAfter: null == balanceAfter
          ? _value.balanceAfter
          : balanceAfter // ignore: cast_nullable_to_non_nullable
              as double,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UtangTransactionImplCopyWith<$Res>
    implements $UtangTransactionCopyWith<$Res> {
  factory _$$UtangTransactionImplCopyWith(_$UtangTransactionImpl value,
          $Res Function(_$UtangTransactionImpl) then) =
      __$$UtangTransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int customerId,
      UtangType type,
      double amount,
      double balanceAfter,
      String? notes,
      DateTime transactionDate});
}

/// @nodoc
class __$$UtangTransactionImplCopyWithImpl<$Res>
    extends _$UtangTransactionCopyWithImpl<$Res, _$UtangTransactionImpl>
    implements _$$UtangTransactionImplCopyWith<$Res> {
  __$$UtangTransactionImplCopyWithImpl(_$UtangTransactionImpl _value,
      $Res Function(_$UtangTransactionImpl) _then)
      : super(_value, _then);

  /// Create a copy of UtangTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? customerId = null,
    Object? type = null,
    Object? amount = null,
    Object? balanceAfter = null,
    Object? notes = freezed,
    Object? transactionDate = null,
  }) {
    return _then(_$UtangTransactionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as UtangType,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      balanceAfter: null == balanceAfter
          ? _value.balanceAfter
          : balanceAfter // ignore: cast_nullable_to_non_nullable
              as double,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UtangTransactionImpl implements _UtangTransaction {
  const _$UtangTransactionImpl(
      {required this.id,
      required this.customerId,
      required this.type,
      required this.amount,
      required this.balanceAfter,
      this.notes,
      required this.transactionDate});

  factory _$UtangTransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$UtangTransactionImplFromJson(json);

  @override
  final int id;
  @override
  final int customerId;
  @override
  final UtangType type;
  @override
  final double amount;
  @override
  final double balanceAfter;
  @override
  final String? notes;
  @override
  final DateTime transactionDate;

  @override
  String toString() {
    return 'UtangTransaction(id: $id, customerId: $customerId, type: $type, amount: $amount, balanceAfter: $balanceAfter, notes: $notes, transactionDate: $transactionDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UtangTransactionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.balanceAfter, balanceAfter) ||
                other.balanceAfter == balanceAfter) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, customerId, type, amount,
      balanceAfter, notes, transactionDate);

  /// Create a copy of UtangTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UtangTransactionImplCopyWith<_$UtangTransactionImpl> get copyWith =>
      __$$UtangTransactionImplCopyWithImpl<_$UtangTransactionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UtangTransactionImplToJson(
      this,
    );
  }
}

abstract class _UtangTransaction implements UtangTransaction {
  const factory _UtangTransaction(
      {required final int id,
      required final int customerId,
      required final UtangType type,
      required final double amount,
      required final double balanceAfter,
      final String? notes,
      required final DateTime transactionDate}) = _$UtangTransactionImpl;

  factory _UtangTransaction.fromJson(Map<String, dynamic> json) =
      _$UtangTransactionImpl.fromJson;

  @override
  int get id;
  @override
  int get customerId;
  @override
  UtangType get type;
  @override
  double get amount;
  @override
  double get balanceAfter;
  @override
  String? get notes;
  @override
  DateTime get transactionDate;

  /// Create a copy of UtangTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UtangTransactionImplCopyWith<_$UtangTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
