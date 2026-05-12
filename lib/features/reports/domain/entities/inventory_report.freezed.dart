// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InventoryReport _$InventoryReportFromJson(Map<String, dynamic> json) {
  return _InventoryReport.fromJson(json);
}

/// @nodoc
mixin _$InventoryReport {
  int get totalProducts => throw _privateConstructorUsedError;
  int get activeProducts => throw _privateConstructorUsedError;
  int get lowStockProducts => throw _privateConstructorUsedError;
  double get totalInventoryValue => throw _privateConstructorUsedError;

  /// Serializes this InventoryReport to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InventoryReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InventoryReportCopyWith<InventoryReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryReportCopyWith<$Res> {
  factory $InventoryReportCopyWith(
          InventoryReport value, $Res Function(InventoryReport) then) =
      _$InventoryReportCopyWithImpl<$Res, InventoryReport>;
  @useResult
  $Res call(
      {int totalProducts,
      int activeProducts,
      int lowStockProducts,
      double totalInventoryValue});
}

/// @nodoc
class _$InventoryReportCopyWithImpl<$Res, $Val extends InventoryReport>
    implements $InventoryReportCopyWith<$Res> {
  _$InventoryReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InventoryReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalProducts = null,
    Object? activeProducts = null,
    Object? lowStockProducts = null,
    Object? totalInventoryValue = null,
  }) {
    return _then(_value.copyWith(
      totalProducts: null == totalProducts
          ? _value.totalProducts
          : totalProducts // ignore: cast_nullable_to_non_nullable
              as int,
      activeProducts: null == activeProducts
          ? _value.activeProducts
          : activeProducts // ignore: cast_nullable_to_non_nullable
              as int,
      lowStockProducts: null == lowStockProducts
          ? _value.lowStockProducts
          : lowStockProducts // ignore: cast_nullable_to_non_nullable
              as int,
      totalInventoryValue: null == totalInventoryValue
          ? _value.totalInventoryValue
          : totalInventoryValue // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InventoryReportImplCopyWith<$Res>
    implements $InventoryReportCopyWith<$Res> {
  factory _$$InventoryReportImplCopyWith(_$InventoryReportImpl value,
          $Res Function(_$InventoryReportImpl) then) =
      __$$InventoryReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalProducts,
      int activeProducts,
      int lowStockProducts,
      double totalInventoryValue});
}

/// @nodoc
class __$$InventoryReportImplCopyWithImpl<$Res>
    extends _$InventoryReportCopyWithImpl<$Res, _$InventoryReportImpl>
    implements _$$InventoryReportImplCopyWith<$Res> {
  __$$InventoryReportImplCopyWithImpl(
      _$InventoryReportImpl _value, $Res Function(_$InventoryReportImpl) _then)
      : super(_value, _then);

  /// Create a copy of InventoryReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalProducts = null,
    Object? activeProducts = null,
    Object? lowStockProducts = null,
    Object? totalInventoryValue = null,
  }) {
    return _then(_$InventoryReportImpl(
      totalProducts: null == totalProducts
          ? _value.totalProducts
          : totalProducts // ignore: cast_nullable_to_non_nullable
              as int,
      activeProducts: null == activeProducts
          ? _value.activeProducts
          : activeProducts // ignore: cast_nullable_to_non_nullable
              as int,
      lowStockProducts: null == lowStockProducts
          ? _value.lowStockProducts
          : lowStockProducts // ignore: cast_nullable_to_non_nullable
              as int,
      totalInventoryValue: null == totalInventoryValue
          ? _value.totalInventoryValue
          : totalInventoryValue // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InventoryReportImpl implements _InventoryReport {
  const _$InventoryReportImpl(
      {required this.totalProducts,
      required this.activeProducts,
      required this.lowStockProducts,
      required this.totalInventoryValue});

  factory _$InventoryReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$InventoryReportImplFromJson(json);

  @override
  final int totalProducts;
  @override
  final int activeProducts;
  @override
  final int lowStockProducts;
  @override
  final double totalInventoryValue;

  @override
  String toString() {
    return 'InventoryReport(totalProducts: $totalProducts, activeProducts: $activeProducts, lowStockProducts: $lowStockProducts, totalInventoryValue: $totalInventoryValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryReportImpl &&
            (identical(other.totalProducts, totalProducts) ||
                other.totalProducts == totalProducts) &&
            (identical(other.activeProducts, activeProducts) ||
                other.activeProducts == activeProducts) &&
            (identical(other.lowStockProducts, lowStockProducts) ||
                other.lowStockProducts == lowStockProducts) &&
            (identical(other.totalInventoryValue, totalInventoryValue) ||
                other.totalInventoryValue == totalInventoryValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalProducts, activeProducts,
      lowStockProducts, totalInventoryValue);

  /// Create a copy of InventoryReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryReportImplCopyWith<_$InventoryReportImpl> get copyWith =>
      __$$InventoryReportImplCopyWithImpl<_$InventoryReportImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InventoryReportImplToJson(
      this,
    );
  }
}

abstract class _InventoryReport implements InventoryReport {
  const factory _InventoryReport(
      {required final int totalProducts,
      required final int activeProducts,
      required final int lowStockProducts,
      required final double totalInventoryValue}) = _$InventoryReportImpl;

  factory _InventoryReport.fromJson(Map<String, dynamic> json) =
      _$InventoryReportImpl.fromJson;

  @override
  int get totalProducts;
  @override
  int get activeProducts;
  @override
  int get lowStockProducts;
  @override
  double get totalInventoryValue;

  /// Create a copy of InventoryReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InventoryReportImplCopyWith<_$InventoryReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
