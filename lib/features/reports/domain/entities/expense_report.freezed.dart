// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExpenseReport _$ExpenseReportFromJson(Map<String, dynamic> json) {
  return _ExpenseReport.fromJson(json);
}

/// @nodoc
mixin _$ExpenseReport {
  DateTime get from => throw _privateConstructorUsedError;
  DateTime get to => throw _privateConstructorUsedError;
  double get totalExpenses => throw _privateConstructorUsedError;
  List<CategoryExpense> get categoryBreakdown =>
      throw _privateConstructorUsedError;

  /// Serializes this ExpenseReport to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExpenseReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExpenseReportCopyWith<ExpenseReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseReportCopyWith<$Res> {
  factory $ExpenseReportCopyWith(
          ExpenseReport value, $Res Function(ExpenseReport) then) =
      _$ExpenseReportCopyWithImpl<$Res, ExpenseReport>;
  @useResult
  $Res call(
      {DateTime from,
      DateTime to,
      double totalExpenses,
      List<CategoryExpense> categoryBreakdown});
}

/// @nodoc
class _$ExpenseReportCopyWithImpl<$Res, $Val extends ExpenseReport>
    implements $ExpenseReportCopyWith<$Res> {
  _$ExpenseReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExpenseReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? to = null,
    Object? totalExpenses = null,
    Object? categoryBreakdown = null,
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
      totalExpenses: null == totalExpenses
          ? _value.totalExpenses
          : totalExpenses // ignore: cast_nullable_to_non_nullable
              as double,
      categoryBreakdown: null == categoryBreakdown
          ? _value.categoryBreakdown
          : categoryBreakdown // ignore: cast_nullable_to_non_nullable
              as List<CategoryExpense>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExpenseReportImplCopyWith<$Res>
    implements $ExpenseReportCopyWith<$Res> {
  factory _$$ExpenseReportImplCopyWith(
          _$ExpenseReportImpl value, $Res Function(_$ExpenseReportImpl) then) =
      __$$ExpenseReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime from,
      DateTime to,
      double totalExpenses,
      List<CategoryExpense> categoryBreakdown});
}

/// @nodoc
class __$$ExpenseReportImplCopyWithImpl<$Res>
    extends _$ExpenseReportCopyWithImpl<$Res, _$ExpenseReportImpl>
    implements _$$ExpenseReportImplCopyWith<$Res> {
  __$$ExpenseReportImplCopyWithImpl(
      _$ExpenseReportImpl _value, $Res Function(_$ExpenseReportImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? to = null,
    Object? totalExpenses = null,
    Object? categoryBreakdown = null,
  }) {
    return _then(_$ExpenseReportImpl(
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as DateTime,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalExpenses: null == totalExpenses
          ? _value.totalExpenses
          : totalExpenses // ignore: cast_nullable_to_non_nullable
              as double,
      categoryBreakdown: null == categoryBreakdown
          ? _value._categoryBreakdown
          : categoryBreakdown // ignore: cast_nullable_to_non_nullable
              as List<CategoryExpense>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExpenseReportImpl implements _ExpenseReport {
  const _$ExpenseReportImpl(
      {required this.from,
      required this.to,
      required this.totalExpenses,
      required final List<CategoryExpense> categoryBreakdown})
      : _categoryBreakdown = categoryBreakdown;

  factory _$ExpenseReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpenseReportImplFromJson(json);

  @override
  final DateTime from;
  @override
  final DateTime to;
  @override
  final double totalExpenses;
  final List<CategoryExpense> _categoryBreakdown;
  @override
  List<CategoryExpense> get categoryBreakdown {
    if (_categoryBreakdown is EqualUnmodifiableListView)
      return _categoryBreakdown;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryBreakdown);
  }

  @override
  String toString() {
    return 'ExpenseReport(from: $from, to: $to, totalExpenses: $totalExpenses, categoryBreakdown: $categoryBreakdown)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpenseReportImpl &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.totalExpenses, totalExpenses) ||
                other.totalExpenses == totalExpenses) &&
            const DeepCollectionEquality()
                .equals(other._categoryBreakdown, _categoryBreakdown));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, from, to, totalExpenses,
      const DeepCollectionEquality().hash(_categoryBreakdown));

  /// Create a copy of ExpenseReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpenseReportImplCopyWith<_$ExpenseReportImpl> get copyWith =>
      __$$ExpenseReportImplCopyWithImpl<_$ExpenseReportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpenseReportImplToJson(
      this,
    );
  }
}

abstract class _ExpenseReport implements ExpenseReport {
  const factory _ExpenseReport(
          {required final DateTime from,
          required final DateTime to,
          required final double totalExpenses,
          required final List<CategoryExpense> categoryBreakdown}) =
      _$ExpenseReportImpl;

  factory _ExpenseReport.fromJson(Map<String, dynamic> json) =
      _$ExpenseReportImpl.fromJson;

  @override
  DateTime get from;
  @override
  DateTime get to;
  @override
  double get totalExpenses;
  @override
  List<CategoryExpense> get categoryBreakdown;

  /// Create a copy of ExpenseReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExpenseReportImplCopyWith<_$ExpenseReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryExpense _$CategoryExpenseFromJson(Map<String, dynamic> json) {
  return _CategoryExpense.fromJson(json);
}

/// @nodoc
mixin _$CategoryExpense {
  String get categoryName => throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  /// Serializes this CategoryExpense to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryExpense
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryExpenseCopyWith<CategoryExpense> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryExpenseCopyWith<$Res> {
  factory $CategoryExpenseCopyWith(
          CategoryExpense value, $Res Function(CategoryExpense) then) =
      _$CategoryExpenseCopyWithImpl<$Res, CategoryExpense>;
  @useResult
  $Res call({String categoryName, double totalAmount, int count});
}

/// @nodoc
class _$CategoryExpenseCopyWithImpl<$Res, $Val extends CategoryExpense>
    implements $CategoryExpenseCopyWith<$Res> {
  _$CategoryExpenseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryExpense
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryName = null,
    Object? totalAmount = null,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryExpenseImplCopyWith<$Res>
    implements $CategoryExpenseCopyWith<$Res> {
  factory _$$CategoryExpenseImplCopyWith(_$CategoryExpenseImpl value,
          $Res Function(_$CategoryExpenseImpl) then) =
      __$$CategoryExpenseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String categoryName, double totalAmount, int count});
}

/// @nodoc
class __$$CategoryExpenseImplCopyWithImpl<$Res>
    extends _$CategoryExpenseCopyWithImpl<$Res, _$CategoryExpenseImpl>
    implements _$$CategoryExpenseImplCopyWith<$Res> {
  __$$CategoryExpenseImplCopyWithImpl(
      _$CategoryExpenseImpl _value, $Res Function(_$CategoryExpenseImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryExpense
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryName = null,
    Object? totalAmount = null,
    Object? count = null,
  }) {
    return _then(_$CategoryExpenseImpl(
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryExpenseImpl implements _CategoryExpense {
  const _$CategoryExpenseImpl(
      {required this.categoryName,
      required this.totalAmount,
      required this.count});

  factory _$CategoryExpenseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryExpenseImplFromJson(json);

  @override
  final String categoryName;
  @override
  final double totalAmount;
  @override
  final int count;

  @override
  String toString() {
    return 'CategoryExpense(categoryName: $categoryName, totalAmount: $totalAmount, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryExpenseImpl &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, categoryName, totalAmount, count);

  /// Create a copy of CategoryExpense
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryExpenseImplCopyWith<_$CategoryExpenseImpl> get copyWith =>
      __$$CategoryExpenseImplCopyWithImpl<_$CategoryExpenseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryExpenseImplToJson(
      this,
    );
  }
}

abstract class _CategoryExpense implements CategoryExpense {
  const factory _CategoryExpense(
      {required final String categoryName,
      required final double totalAmount,
      required final int count}) = _$CategoryExpenseImpl;

  factory _CategoryExpense.fromJson(Map<String, dynamic> json) =
      _$CategoryExpenseImpl.fromJson;

  @override
  String get categoryName;
  @override
  double get totalAmount;
  @override
  int get count;

  /// Create a copy of CategoryExpense
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryExpenseImplCopyWith<_$CategoryExpenseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
