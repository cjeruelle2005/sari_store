// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profit_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProfitReport _$ProfitReportFromJson(Map<String, dynamic> json) {
  return _ProfitReport.fromJson(json);
}

/// @nodoc
mixin _$ProfitReport {
  DateTime get from => throw _privateConstructorUsedError;
  DateTime get to => throw _privateConstructorUsedError;
  double get totalRevenue => throw _privateConstructorUsedError;
  double get totalCost => throw _privateConstructorUsedError;
  double get grossProfit => throw _privateConstructorUsedError;
  double get totalExpenses => throw _privateConstructorUsedError;
  double get netProfit => throw _privateConstructorUsedError;

  /// Serializes this ProfitReport to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfitReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfitReportCopyWith<ProfitReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfitReportCopyWith<$Res> {
  factory $ProfitReportCopyWith(
          ProfitReport value, $Res Function(ProfitReport) then) =
      _$ProfitReportCopyWithImpl<$Res, ProfitReport>;
  @useResult
  $Res call(
      {DateTime from,
      DateTime to,
      double totalRevenue,
      double totalCost,
      double grossProfit,
      double totalExpenses,
      double netProfit});
}

/// @nodoc
class _$ProfitReportCopyWithImpl<$Res, $Val extends ProfitReport>
    implements $ProfitReportCopyWith<$Res> {
  _$ProfitReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfitReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? to = null,
    Object? totalRevenue = null,
    Object? totalCost = null,
    Object? grossProfit = null,
    Object? totalExpenses = null,
    Object? netProfit = null,
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
      totalRevenue: null == totalRevenue
          ? _value.totalRevenue
          : totalRevenue // ignore: cast_nullable_to_non_nullable
              as double,
      totalCost: null == totalCost
          ? _value.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as double,
      grossProfit: null == grossProfit
          ? _value.grossProfit
          : grossProfit // ignore: cast_nullable_to_non_nullable
              as double,
      totalExpenses: null == totalExpenses
          ? _value.totalExpenses
          : totalExpenses // ignore: cast_nullable_to_non_nullable
              as double,
      netProfit: null == netProfit
          ? _value.netProfit
          : netProfit // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfitReportImplCopyWith<$Res>
    implements $ProfitReportCopyWith<$Res> {
  factory _$$ProfitReportImplCopyWith(
          _$ProfitReportImpl value, $Res Function(_$ProfitReportImpl) then) =
      __$$ProfitReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime from,
      DateTime to,
      double totalRevenue,
      double totalCost,
      double grossProfit,
      double totalExpenses,
      double netProfit});
}

/// @nodoc
class __$$ProfitReportImplCopyWithImpl<$Res>
    extends _$ProfitReportCopyWithImpl<$Res, _$ProfitReportImpl>
    implements _$$ProfitReportImplCopyWith<$Res> {
  __$$ProfitReportImplCopyWithImpl(
      _$ProfitReportImpl _value, $Res Function(_$ProfitReportImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfitReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? to = null,
    Object? totalRevenue = null,
    Object? totalCost = null,
    Object? grossProfit = null,
    Object? totalExpenses = null,
    Object? netProfit = null,
  }) {
    return _then(_$ProfitReportImpl(
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as DateTime,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalRevenue: null == totalRevenue
          ? _value.totalRevenue
          : totalRevenue // ignore: cast_nullable_to_non_nullable
              as double,
      totalCost: null == totalCost
          ? _value.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as double,
      grossProfit: null == grossProfit
          ? _value.grossProfit
          : grossProfit // ignore: cast_nullable_to_non_nullable
              as double,
      totalExpenses: null == totalExpenses
          ? _value.totalExpenses
          : totalExpenses // ignore: cast_nullable_to_non_nullable
              as double,
      netProfit: null == netProfit
          ? _value.netProfit
          : netProfit // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfitReportImpl implements _ProfitReport {
  const _$ProfitReportImpl(
      {required this.from,
      required this.to,
      required this.totalRevenue,
      required this.totalCost,
      required this.grossProfit,
      required this.totalExpenses,
      required this.netProfit});

  factory _$ProfitReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfitReportImplFromJson(json);

  @override
  final DateTime from;
  @override
  final DateTime to;
  @override
  final double totalRevenue;
  @override
  final double totalCost;
  @override
  final double grossProfit;
  @override
  final double totalExpenses;
  @override
  final double netProfit;

  @override
  String toString() {
    return 'ProfitReport(from: $from, to: $to, totalRevenue: $totalRevenue, totalCost: $totalCost, grossProfit: $grossProfit, totalExpenses: $totalExpenses, netProfit: $netProfit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfitReportImpl &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.totalRevenue, totalRevenue) ||
                other.totalRevenue == totalRevenue) &&
            (identical(other.totalCost, totalCost) ||
                other.totalCost == totalCost) &&
            (identical(other.grossProfit, grossProfit) ||
                other.grossProfit == grossProfit) &&
            (identical(other.totalExpenses, totalExpenses) ||
                other.totalExpenses == totalExpenses) &&
            (identical(other.netProfit, netProfit) ||
                other.netProfit == netProfit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, from, to, totalRevenue,
      totalCost, grossProfit, totalExpenses, netProfit);

  /// Create a copy of ProfitReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfitReportImplCopyWith<_$ProfitReportImpl> get copyWith =>
      __$$ProfitReportImplCopyWithImpl<_$ProfitReportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfitReportImplToJson(
      this,
    );
  }
}

abstract class _ProfitReport implements ProfitReport {
  const factory _ProfitReport(
      {required final DateTime from,
      required final DateTime to,
      required final double totalRevenue,
      required final double totalCost,
      required final double grossProfit,
      required final double totalExpenses,
      required final double netProfit}) = _$ProfitReportImpl;

  factory _ProfitReport.fromJson(Map<String, dynamic> json) =
      _$ProfitReportImpl.fromJson;

  @override
  DateTime get from;
  @override
  DateTime get to;
  @override
  double get totalRevenue;
  @override
  double get totalCost;
  @override
  double get grossProfit;
  @override
  double get totalExpenses;
  @override
  double get netProfit;

  /// Create a copy of ProfitReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfitReportImplCopyWith<_$ProfitReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
