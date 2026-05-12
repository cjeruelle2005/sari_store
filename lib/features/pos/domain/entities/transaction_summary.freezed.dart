// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionSummary _$TransactionSummaryFromJson(Map<String, dynamic> json) {
  return _TransactionSummary.fromJson(json);
}

/// @nodoc
mixin _$TransactionSummary {
  double get subtotal => throw _privateConstructorUsedError;
  double get discount => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  double get paymentReceived => throw _privateConstructorUsedError;
  double get change => throw _privateConstructorUsedError;

  /// Serializes this TransactionSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionSummaryCopyWith<TransactionSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionSummaryCopyWith<$Res> {
  factory $TransactionSummaryCopyWith(
          TransactionSummary value, $Res Function(TransactionSummary) then) =
      _$TransactionSummaryCopyWithImpl<$Res, TransactionSummary>;
  @useResult
  $Res call(
      {double subtotal,
      double discount,
      double total,
      double paymentReceived,
      double change});
}

/// @nodoc
class _$TransactionSummaryCopyWithImpl<$Res, $Val extends TransactionSummary>
    implements $TransactionSummaryCopyWith<$Res> {
  _$TransactionSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subtotal = null,
    Object? discount = null,
    Object? total = null,
    Object? paymentReceived = null,
    Object? change = null,
  }) {
    return _then(_value.copyWith(
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      paymentReceived: null == paymentReceived
          ? _value.paymentReceived
          : paymentReceived // ignore: cast_nullable_to_non_nullable
              as double,
      change: null == change
          ? _value.change
          : change // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionSummaryImplCopyWith<$Res>
    implements $TransactionSummaryCopyWith<$Res> {
  factory _$$TransactionSummaryImplCopyWith(_$TransactionSummaryImpl value,
          $Res Function(_$TransactionSummaryImpl) then) =
      __$$TransactionSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double subtotal,
      double discount,
      double total,
      double paymentReceived,
      double change});
}

/// @nodoc
class __$$TransactionSummaryImplCopyWithImpl<$Res>
    extends _$TransactionSummaryCopyWithImpl<$Res, _$TransactionSummaryImpl>
    implements _$$TransactionSummaryImplCopyWith<$Res> {
  __$$TransactionSummaryImplCopyWithImpl(_$TransactionSummaryImpl _value,
      $Res Function(_$TransactionSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subtotal = null,
    Object? discount = null,
    Object? total = null,
    Object? paymentReceived = null,
    Object? change = null,
  }) {
    return _then(_$TransactionSummaryImpl(
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      paymentReceived: null == paymentReceived
          ? _value.paymentReceived
          : paymentReceived // ignore: cast_nullable_to_non_nullable
              as double,
      change: null == change
          ? _value.change
          : change // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionSummaryImpl implements _TransactionSummary {
  const _$TransactionSummaryImpl(
      {required this.subtotal,
      required this.discount,
      required this.total,
      required this.paymentReceived,
      required this.change});

  factory _$TransactionSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionSummaryImplFromJson(json);

  @override
  final double subtotal;
  @override
  final double discount;
  @override
  final double total;
  @override
  final double paymentReceived;
  @override
  final double change;

  @override
  String toString() {
    return 'TransactionSummary(subtotal: $subtotal, discount: $discount, total: $total, paymentReceived: $paymentReceived, change: $change)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionSummaryImpl &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.paymentReceived, paymentReceived) ||
                other.paymentReceived == paymentReceived) &&
            (identical(other.change, change) || other.change == change));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, subtotal, discount, total, paymentReceived, change);

  /// Create a copy of TransactionSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionSummaryImplCopyWith<_$TransactionSummaryImpl> get copyWith =>
      __$$TransactionSummaryImplCopyWithImpl<_$TransactionSummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionSummaryImplToJson(
      this,
    );
  }
}

abstract class _TransactionSummary implements TransactionSummary {
  const factory _TransactionSummary(
      {required final double subtotal,
      required final double discount,
      required final double total,
      required final double paymentReceived,
      required final double change}) = _$TransactionSummaryImpl;

  factory _TransactionSummary.fromJson(Map<String, dynamic> json) =
      _$TransactionSummaryImpl.fromJson;

  @override
  double get subtotal;
  @override
  double get discount;
  @override
  double get total;
  @override
  double get paymentReceived;
  @override
  double get change;

  /// Create a copy of TransactionSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionSummaryImplCopyWith<_$TransactionSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
