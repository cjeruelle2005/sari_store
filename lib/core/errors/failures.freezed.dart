// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Failure {
  String get message => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String code, String? details)
        unexpected,
    required TResult Function(String message, String code, String? field)
        validation,
    required TResult Function(String message, String code, String? query)
        database,
    required TResult Function(String message, String code) auth,
    required TResult Function(String message, String code) network,
    required TResult Function(String message, String code) permission,
    required TResult Function(String message, String code) notFound,
    required TResult Function(String message, String code) printFailure,
    required TResult Function(String message, String code) exportFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String code, String? details)? unexpected,
    TResult? Function(String message, String code, String? field)? validation,
    TResult? Function(String message, String code, String? query)? database,
    TResult? Function(String message, String code)? auth,
    TResult? Function(String message, String code)? network,
    TResult? Function(String message, String code)? permission,
    TResult? Function(String message, String code)? notFound,
    TResult? Function(String message, String code)? printFailure,
    TResult? Function(String message, String code)? exportFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String code, String? details)? unexpected,
    TResult Function(String message, String code, String? field)? validation,
    TResult Function(String message, String code, String? query)? database,
    TResult Function(String message, String code)? auth,
    TResult Function(String message, String code)? network,
    TResult Function(String message, String code)? permission,
    TResult Function(String message, String code)? notFound,
    TResult Function(String message, String code)? printFailure,
    TResult Function(String message, String code)? exportFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnexpectedFailure value) unexpected,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(DatabaseFailure value) database,
    required TResult Function(AuthFailure value) auth,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(PermissionFailure value) permission,
    required TResult Function(NotFoundFailure value) notFound,
    required TResult Function(PrintFailure value) printFailure,
    required TResult Function(ExportFailure value) exportFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnexpectedFailure value)? unexpected,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(DatabaseFailure value)? database,
    TResult? Function(AuthFailure value)? auth,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(PermissionFailure value)? permission,
    TResult? Function(NotFoundFailure value)? notFound,
    TResult? Function(PrintFailure value)? printFailure,
    TResult? Function(ExportFailure value)? exportFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnexpectedFailure value)? unexpected,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(DatabaseFailure value)? database,
    TResult Function(AuthFailure value)? auth,
    TResult Function(NetworkFailure value)? network,
    TResult Function(PermissionFailure value)? permission,
    TResult Function(NotFoundFailure value)? notFound,
    TResult Function(PrintFailure value)? printFailure,
    TResult Function(ExportFailure value)? exportFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FailureCopyWith<Failure> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res, Failure>;
  @useResult
  $Res call({String message, String code});
}

/// @nodoc
class _$FailureCopyWithImpl<$Res, $Val extends Failure>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UnexpectedFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$UnexpectedFailureImplCopyWith(_$UnexpectedFailureImpl value,
          $Res Function(_$UnexpectedFailureImpl) then) =
      __$$UnexpectedFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String code, String? details});
}

/// @nodoc
class __$$UnexpectedFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$UnexpectedFailureImpl>
    implements _$$UnexpectedFailureImplCopyWith<$Res> {
  __$$UnexpectedFailureImplCopyWithImpl(_$UnexpectedFailureImpl _value,
      $Res Function(_$UnexpectedFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = null,
    Object? details = freezed,
  }) {
    return _then(_$UnexpectedFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UnexpectedFailureImpl implements UnexpectedFailure {
  const _$UnexpectedFailureImpl(
      {required this.message, this.code = 'UNEXPECTED', this.details});

  @override
  final String message;
  @override
  @JsonKey()
  final String code;
  @override
  final String? details;

  @override
  String toString() {
    return 'Failure.unexpected(message: $message, code: $code, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnexpectedFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.details, details) || other.details == details));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code, details);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnexpectedFailureImplCopyWith<_$UnexpectedFailureImpl> get copyWith =>
      __$$UnexpectedFailureImplCopyWithImpl<_$UnexpectedFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String code, String? details)
        unexpected,
    required TResult Function(String message, String code, String? field)
        validation,
    required TResult Function(String message, String code, String? query)
        database,
    required TResult Function(String message, String code) auth,
    required TResult Function(String message, String code) network,
    required TResult Function(String message, String code) permission,
    required TResult Function(String message, String code) notFound,
    required TResult Function(String message, String code) printFailure,
    required TResult Function(String message, String code) exportFailure,
  }) {
    return unexpected(message, code, details);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String code, String? details)? unexpected,
    TResult? Function(String message, String code, String? field)? validation,
    TResult? Function(String message, String code, String? query)? database,
    TResult? Function(String message, String code)? auth,
    TResult? Function(String message, String code)? network,
    TResult? Function(String message, String code)? permission,
    TResult? Function(String message, String code)? notFound,
    TResult? Function(String message, String code)? printFailure,
    TResult? Function(String message, String code)? exportFailure,
  }) {
    return unexpected?.call(message, code, details);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String code, String? details)? unexpected,
    TResult Function(String message, String code, String? field)? validation,
    TResult Function(String message, String code, String? query)? database,
    TResult Function(String message, String code)? auth,
    TResult Function(String message, String code)? network,
    TResult Function(String message, String code)? permission,
    TResult Function(String message, String code)? notFound,
    TResult Function(String message, String code)? printFailure,
    TResult Function(String message, String code)? exportFailure,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(message, code, details);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnexpectedFailure value) unexpected,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(DatabaseFailure value) database,
    required TResult Function(AuthFailure value) auth,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(PermissionFailure value) permission,
    required TResult Function(NotFoundFailure value) notFound,
    required TResult Function(PrintFailure value) printFailure,
    required TResult Function(ExportFailure value) exportFailure,
  }) {
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnexpectedFailure value)? unexpected,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(DatabaseFailure value)? database,
    TResult? Function(AuthFailure value)? auth,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(PermissionFailure value)? permission,
    TResult? Function(NotFoundFailure value)? notFound,
    TResult? Function(PrintFailure value)? printFailure,
    TResult? Function(ExportFailure value)? exportFailure,
  }) {
    return unexpected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnexpectedFailure value)? unexpected,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(DatabaseFailure value)? database,
    TResult Function(AuthFailure value)? auth,
    TResult Function(NetworkFailure value)? network,
    TResult Function(PermissionFailure value)? permission,
    TResult Function(NotFoundFailure value)? notFound,
    TResult Function(PrintFailure value)? printFailure,
    TResult Function(ExportFailure value)? exportFailure,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class UnexpectedFailure implements Failure {
  const factory UnexpectedFailure(
      {required final String message,
      final String code,
      final String? details}) = _$UnexpectedFailureImpl;

  @override
  String get message;
  @override
  String get code;
  String? get details;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnexpectedFailureImplCopyWith<_$UnexpectedFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ValidationFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$ValidationFailureImplCopyWith(_$ValidationFailureImpl value,
          $Res Function(_$ValidationFailureImpl) then) =
      __$$ValidationFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String code, String? field});
}

/// @nodoc
class __$$ValidationFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$ValidationFailureImpl>
    implements _$$ValidationFailureImplCopyWith<$Res> {
  __$$ValidationFailureImplCopyWithImpl(_$ValidationFailureImpl _value,
      $Res Function(_$ValidationFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = null,
    Object? field = freezed,
  }) {
    return _then(_$ValidationFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      field: freezed == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ValidationFailureImpl implements ValidationFailure {
  const _$ValidationFailureImpl(
      {required this.message, this.code = 'VALIDATION', this.field});

  @override
  final String message;
  @override
  @JsonKey()
  final String code;
  @override
  final String? field;

  @override
  String toString() {
    return 'Failure.validation(message: $message, code: $code, field: $field)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidationFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.field, field) || other.field == field));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code, field);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidationFailureImplCopyWith<_$ValidationFailureImpl> get copyWith =>
      __$$ValidationFailureImplCopyWithImpl<_$ValidationFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String code, String? details)
        unexpected,
    required TResult Function(String message, String code, String? field)
        validation,
    required TResult Function(String message, String code, String? query)
        database,
    required TResult Function(String message, String code) auth,
    required TResult Function(String message, String code) network,
    required TResult Function(String message, String code) permission,
    required TResult Function(String message, String code) notFound,
    required TResult Function(String message, String code) printFailure,
    required TResult Function(String message, String code) exportFailure,
  }) {
    return validation(message, code, field);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String code, String? details)? unexpected,
    TResult? Function(String message, String code, String? field)? validation,
    TResult? Function(String message, String code, String? query)? database,
    TResult? Function(String message, String code)? auth,
    TResult? Function(String message, String code)? network,
    TResult? Function(String message, String code)? permission,
    TResult? Function(String message, String code)? notFound,
    TResult? Function(String message, String code)? printFailure,
    TResult? Function(String message, String code)? exportFailure,
  }) {
    return validation?.call(message, code, field);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String code, String? details)? unexpected,
    TResult Function(String message, String code, String? field)? validation,
    TResult Function(String message, String code, String? query)? database,
    TResult Function(String message, String code)? auth,
    TResult Function(String message, String code)? network,
    TResult Function(String message, String code)? permission,
    TResult Function(String message, String code)? notFound,
    TResult Function(String message, String code)? printFailure,
    TResult Function(String message, String code)? exportFailure,
    required TResult orElse(),
  }) {
    if (validation != null) {
      return validation(message, code, field);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnexpectedFailure value) unexpected,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(DatabaseFailure value) database,
    required TResult Function(AuthFailure value) auth,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(PermissionFailure value) permission,
    required TResult Function(NotFoundFailure value) notFound,
    required TResult Function(PrintFailure value) printFailure,
    required TResult Function(ExportFailure value) exportFailure,
  }) {
    return validation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnexpectedFailure value)? unexpected,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(DatabaseFailure value)? database,
    TResult? Function(AuthFailure value)? auth,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(PermissionFailure value)? permission,
    TResult? Function(NotFoundFailure value)? notFound,
    TResult? Function(PrintFailure value)? printFailure,
    TResult? Function(ExportFailure value)? exportFailure,
  }) {
    return validation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnexpectedFailure value)? unexpected,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(DatabaseFailure value)? database,
    TResult Function(AuthFailure value)? auth,
    TResult Function(NetworkFailure value)? network,
    TResult Function(PermissionFailure value)? permission,
    TResult Function(NotFoundFailure value)? notFound,
    TResult Function(PrintFailure value)? printFailure,
    TResult Function(ExportFailure value)? exportFailure,
    required TResult orElse(),
  }) {
    if (validation != null) {
      return validation(this);
    }
    return orElse();
  }
}

abstract class ValidationFailure implements Failure {
  const factory ValidationFailure(
      {required final String message,
      final String code,
      final String? field}) = _$ValidationFailureImpl;

  @override
  String get message;
  @override
  String get code;
  String? get field;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ValidationFailureImplCopyWith<_$ValidationFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DatabaseFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$DatabaseFailureImplCopyWith(_$DatabaseFailureImpl value,
          $Res Function(_$DatabaseFailureImpl) then) =
      __$$DatabaseFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String code, String? query});
}

/// @nodoc
class __$$DatabaseFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$DatabaseFailureImpl>
    implements _$$DatabaseFailureImplCopyWith<$Res> {
  __$$DatabaseFailureImplCopyWithImpl(
      _$DatabaseFailureImpl _value, $Res Function(_$DatabaseFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = null,
    Object? query = freezed,
  }) {
    return _then(_$DatabaseFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$DatabaseFailureImpl implements DatabaseFailure {
  const _$DatabaseFailureImpl(
      {required this.message, this.code = 'DATABASE', this.query});

  @override
  final String message;
  @override
  @JsonKey()
  final String code;
  @override
  final String? query;

  @override
  String toString() {
    return 'Failure.database(message: $message, code: $code, query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DatabaseFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code, query);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DatabaseFailureImplCopyWith<_$DatabaseFailureImpl> get copyWith =>
      __$$DatabaseFailureImplCopyWithImpl<_$DatabaseFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String code, String? details)
        unexpected,
    required TResult Function(String message, String code, String? field)
        validation,
    required TResult Function(String message, String code, String? query)
        database,
    required TResult Function(String message, String code) auth,
    required TResult Function(String message, String code) network,
    required TResult Function(String message, String code) permission,
    required TResult Function(String message, String code) notFound,
    required TResult Function(String message, String code) printFailure,
    required TResult Function(String message, String code) exportFailure,
  }) {
    return database(message, code, query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String code, String? details)? unexpected,
    TResult? Function(String message, String code, String? field)? validation,
    TResult? Function(String message, String code, String? query)? database,
    TResult? Function(String message, String code)? auth,
    TResult? Function(String message, String code)? network,
    TResult? Function(String message, String code)? permission,
    TResult? Function(String message, String code)? notFound,
    TResult? Function(String message, String code)? printFailure,
    TResult? Function(String message, String code)? exportFailure,
  }) {
    return database?.call(message, code, query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String code, String? details)? unexpected,
    TResult Function(String message, String code, String? field)? validation,
    TResult Function(String message, String code, String? query)? database,
    TResult Function(String message, String code)? auth,
    TResult Function(String message, String code)? network,
    TResult Function(String message, String code)? permission,
    TResult Function(String message, String code)? notFound,
    TResult Function(String message, String code)? printFailure,
    TResult Function(String message, String code)? exportFailure,
    required TResult orElse(),
  }) {
    if (database != null) {
      return database(message, code, query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnexpectedFailure value) unexpected,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(DatabaseFailure value) database,
    required TResult Function(AuthFailure value) auth,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(PermissionFailure value) permission,
    required TResult Function(NotFoundFailure value) notFound,
    required TResult Function(PrintFailure value) printFailure,
    required TResult Function(ExportFailure value) exportFailure,
  }) {
    return database(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnexpectedFailure value)? unexpected,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(DatabaseFailure value)? database,
    TResult? Function(AuthFailure value)? auth,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(PermissionFailure value)? permission,
    TResult? Function(NotFoundFailure value)? notFound,
    TResult? Function(PrintFailure value)? printFailure,
    TResult? Function(ExportFailure value)? exportFailure,
  }) {
    return database?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnexpectedFailure value)? unexpected,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(DatabaseFailure value)? database,
    TResult Function(AuthFailure value)? auth,
    TResult Function(NetworkFailure value)? network,
    TResult Function(PermissionFailure value)? permission,
    TResult Function(NotFoundFailure value)? notFound,
    TResult Function(PrintFailure value)? printFailure,
    TResult Function(ExportFailure value)? exportFailure,
    required TResult orElse(),
  }) {
    if (database != null) {
      return database(this);
    }
    return orElse();
  }
}

abstract class DatabaseFailure implements Failure {
  const factory DatabaseFailure(
      {required final String message,
      final String code,
      final String? query}) = _$DatabaseFailureImpl;

  @override
  String get message;
  @override
  String get code;
  String? get query;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DatabaseFailureImplCopyWith<_$DatabaseFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$AuthFailureImplCopyWith(
          _$AuthFailureImpl value, $Res Function(_$AuthFailureImpl) then) =
      __$$AuthFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String code});
}

/// @nodoc
class __$$AuthFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$AuthFailureImpl>
    implements _$$AuthFailureImplCopyWith<$Res> {
  __$$AuthFailureImplCopyWithImpl(
      _$AuthFailureImpl _value, $Res Function(_$AuthFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = null,
  }) {
    return _then(_$AuthFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthFailureImpl implements AuthFailure {
  const _$AuthFailureImpl({required this.message, this.code = 'AUTH'});

  @override
  final String message;
  @override
  @JsonKey()
  final String code;

  @override
  String toString() {
    return 'Failure.auth(message: $message, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthFailureImplCopyWith<_$AuthFailureImpl> get copyWith =>
      __$$AuthFailureImplCopyWithImpl<_$AuthFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String code, String? details)
        unexpected,
    required TResult Function(String message, String code, String? field)
        validation,
    required TResult Function(String message, String code, String? query)
        database,
    required TResult Function(String message, String code) auth,
    required TResult Function(String message, String code) network,
    required TResult Function(String message, String code) permission,
    required TResult Function(String message, String code) notFound,
    required TResult Function(String message, String code) printFailure,
    required TResult Function(String message, String code) exportFailure,
  }) {
    return auth(message, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String code, String? details)? unexpected,
    TResult? Function(String message, String code, String? field)? validation,
    TResult? Function(String message, String code, String? query)? database,
    TResult? Function(String message, String code)? auth,
    TResult? Function(String message, String code)? network,
    TResult? Function(String message, String code)? permission,
    TResult? Function(String message, String code)? notFound,
    TResult? Function(String message, String code)? printFailure,
    TResult? Function(String message, String code)? exportFailure,
  }) {
    return auth?.call(message, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String code, String? details)? unexpected,
    TResult Function(String message, String code, String? field)? validation,
    TResult Function(String message, String code, String? query)? database,
    TResult Function(String message, String code)? auth,
    TResult Function(String message, String code)? network,
    TResult Function(String message, String code)? permission,
    TResult Function(String message, String code)? notFound,
    TResult Function(String message, String code)? printFailure,
    TResult Function(String message, String code)? exportFailure,
    required TResult orElse(),
  }) {
    if (auth != null) {
      return auth(message, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnexpectedFailure value) unexpected,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(DatabaseFailure value) database,
    required TResult Function(AuthFailure value) auth,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(PermissionFailure value) permission,
    required TResult Function(NotFoundFailure value) notFound,
    required TResult Function(PrintFailure value) printFailure,
    required TResult Function(ExportFailure value) exportFailure,
  }) {
    return auth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnexpectedFailure value)? unexpected,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(DatabaseFailure value)? database,
    TResult? Function(AuthFailure value)? auth,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(PermissionFailure value)? permission,
    TResult? Function(NotFoundFailure value)? notFound,
    TResult? Function(PrintFailure value)? printFailure,
    TResult? Function(ExportFailure value)? exportFailure,
  }) {
    return auth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnexpectedFailure value)? unexpected,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(DatabaseFailure value)? database,
    TResult Function(AuthFailure value)? auth,
    TResult Function(NetworkFailure value)? network,
    TResult Function(PermissionFailure value)? permission,
    TResult Function(NotFoundFailure value)? notFound,
    TResult Function(PrintFailure value)? printFailure,
    TResult Function(ExportFailure value)? exportFailure,
    required TResult orElse(),
  }) {
    if (auth != null) {
      return auth(this);
    }
    return orElse();
  }
}

abstract class AuthFailure implements Failure {
  const factory AuthFailure(
      {required final String message, final String code}) = _$AuthFailureImpl;

  @override
  String get message;
  @override
  String get code;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthFailureImplCopyWith<_$AuthFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NetworkFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$NetworkFailureImplCopyWith(_$NetworkFailureImpl value,
          $Res Function(_$NetworkFailureImpl) then) =
      __$$NetworkFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String code});
}

/// @nodoc
class __$$NetworkFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$NetworkFailureImpl>
    implements _$$NetworkFailureImplCopyWith<$Res> {
  __$$NetworkFailureImplCopyWithImpl(
      _$NetworkFailureImpl _value, $Res Function(_$NetworkFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = null,
  }) {
    return _then(_$NetworkFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NetworkFailureImpl implements NetworkFailure {
  const _$NetworkFailureImpl({required this.message, this.code = 'NETWORK'});

  @override
  final String message;
  @override
  @JsonKey()
  final String code;

  @override
  String toString() {
    return 'Failure.network(message: $message, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkFailureImplCopyWith<_$NetworkFailureImpl> get copyWith =>
      __$$NetworkFailureImplCopyWithImpl<_$NetworkFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String code, String? details)
        unexpected,
    required TResult Function(String message, String code, String? field)
        validation,
    required TResult Function(String message, String code, String? query)
        database,
    required TResult Function(String message, String code) auth,
    required TResult Function(String message, String code) network,
    required TResult Function(String message, String code) permission,
    required TResult Function(String message, String code) notFound,
    required TResult Function(String message, String code) printFailure,
    required TResult Function(String message, String code) exportFailure,
  }) {
    return network(message, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String code, String? details)? unexpected,
    TResult? Function(String message, String code, String? field)? validation,
    TResult? Function(String message, String code, String? query)? database,
    TResult? Function(String message, String code)? auth,
    TResult? Function(String message, String code)? network,
    TResult? Function(String message, String code)? permission,
    TResult? Function(String message, String code)? notFound,
    TResult? Function(String message, String code)? printFailure,
    TResult? Function(String message, String code)? exportFailure,
  }) {
    return network?.call(message, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String code, String? details)? unexpected,
    TResult Function(String message, String code, String? field)? validation,
    TResult Function(String message, String code, String? query)? database,
    TResult Function(String message, String code)? auth,
    TResult Function(String message, String code)? network,
    TResult Function(String message, String code)? permission,
    TResult Function(String message, String code)? notFound,
    TResult Function(String message, String code)? printFailure,
    TResult Function(String message, String code)? exportFailure,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(message, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnexpectedFailure value) unexpected,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(DatabaseFailure value) database,
    required TResult Function(AuthFailure value) auth,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(PermissionFailure value) permission,
    required TResult Function(NotFoundFailure value) notFound,
    required TResult Function(PrintFailure value) printFailure,
    required TResult Function(ExportFailure value) exportFailure,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnexpectedFailure value)? unexpected,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(DatabaseFailure value)? database,
    TResult? Function(AuthFailure value)? auth,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(PermissionFailure value)? permission,
    TResult? Function(NotFoundFailure value)? notFound,
    TResult? Function(PrintFailure value)? printFailure,
    TResult? Function(ExportFailure value)? exportFailure,
  }) {
    return network?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnexpectedFailure value)? unexpected,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(DatabaseFailure value)? database,
    TResult Function(AuthFailure value)? auth,
    TResult Function(NetworkFailure value)? network,
    TResult Function(PermissionFailure value)? permission,
    TResult Function(NotFoundFailure value)? notFound,
    TResult Function(PrintFailure value)? printFailure,
    TResult Function(ExportFailure value)? exportFailure,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class NetworkFailure implements Failure {
  const factory NetworkFailure(
      {required final String message,
      final String code}) = _$NetworkFailureImpl;

  @override
  String get message;
  @override
  String get code;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetworkFailureImplCopyWith<_$NetworkFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PermissionFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$PermissionFailureImplCopyWith(_$PermissionFailureImpl value,
          $Res Function(_$PermissionFailureImpl) then) =
      __$$PermissionFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String code});
}

/// @nodoc
class __$$PermissionFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$PermissionFailureImpl>
    implements _$$PermissionFailureImplCopyWith<$Res> {
  __$$PermissionFailureImplCopyWithImpl(_$PermissionFailureImpl _value,
      $Res Function(_$PermissionFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = null,
  }) {
    return _then(_$PermissionFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PermissionFailureImpl implements PermissionFailure {
  const _$PermissionFailureImpl(
      {required this.message, this.code = 'PERMISSION'});

  @override
  final String message;
  @override
  @JsonKey()
  final String code;

  @override
  String toString() {
    return 'Failure.permission(message: $message, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PermissionFailureImplCopyWith<_$PermissionFailureImpl> get copyWith =>
      __$$PermissionFailureImplCopyWithImpl<_$PermissionFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String code, String? details)
        unexpected,
    required TResult Function(String message, String code, String? field)
        validation,
    required TResult Function(String message, String code, String? query)
        database,
    required TResult Function(String message, String code) auth,
    required TResult Function(String message, String code) network,
    required TResult Function(String message, String code) permission,
    required TResult Function(String message, String code) notFound,
    required TResult Function(String message, String code) printFailure,
    required TResult Function(String message, String code) exportFailure,
  }) {
    return permission(message, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String code, String? details)? unexpected,
    TResult? Function(String message, String code, String? field)? validation,
    TResult? Function(String message, String code, String? query)? database,
    TResult? Function(String message, String code)? auth,
    TResult? Function(String message, String code)? network,
    TResult? Function(String message, String code)? permission,
    TResult? Function(String message, String code)? notFound,
    TResult? Function(String message, String code)? printFailure,
    TResult? Function(String message, String code)? exportFailure,
  }) {
    return permission?.call(message, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String code, String? details)? unexpected,
    TResult Function(String message, String code, String? field)? validation,
    TResult Function(String message, String code, String? query)? database,
    TResult Function(String message, String code)? auth,
    TResult Function(String message, String code)? network,
    TResult Function(String message, String code)? permission,
    TResult Function(String message, String code)? notFound,
    TResult Function(String message, String code)? printFailure,
    TResult Function(String message, String code)? exportFailure,
    required TResult orElse(),
  }) {
    if (permission != null) {
      return permission(message, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnexpectedFailure value) unexpected,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(DatabaseFailure value) database,
    required TResult Function(AuthFailure value) auth,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(PermissionFailure value) permission,
    required TResult Function(NotFoundFailure value) notFound,
    required TResult Function(PrintFailure value) printFailure,
    required TResult Function(ExportFailure value) exportFailure,
  }) {
    return permission(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnexpectedFailure value)? unexpected,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(DatabaseFailure value)? database,
    TResult? Function(AuthFailure value)? auth,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(PermissionFailure value)? permission,
    TResult? Function(NotFoundFailure value)? notFound,
    TResult? Function(PrintFailure value)? printFailure,
    TResult? Function(ExportFailure value)? exportFailure,
  }) {
    return permission?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnexpectedFailure value)? unexpected,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(DatabaseFailure value)? database,
    TResult Function(AuthFailure value)? auth,
    TResult Function(NetworkFailure value)? network,
    TResult Function(PermissionFailure value)? permission,
    TResult Function(NotFoundFailure value)? notFound,
    TResult Function(PrintFailure value)? printFailure,
    TResult Function(ExportFailure value)? exportFailure,
    required TResult orElse(),
  }) {
    if (permission != null) {
      return permission(this);
    }
    return orElse();
  }
}

abstract class PermissionFailure implements Failure {
  const factory PermissionFailure(
      {required final String message,
      final String code}) = _$PermissionFailureImpl;

  @override
  String get message;
  @override
  String get code;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PermissionFailureImplCopyWith<_$PermissionFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotFoundFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$NotFoundFailureImplCopyWith(_$NotFoundFailureImpl value,
          $Res Function(_$NotFoundFailureImpl) then) =
      __$$NotFoundFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String code});
}

/// @nodoc
class __$$NotFoundFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$NotFoundFailureImpl>
    implements _$$NotFoundFailureImplCopyWith<$Res> {
  __$$NotFoundFailureImplCopyWithImpl(
      _$NotFoundFailureImpl _value, $Res Function(_$NotFoundFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = null,
  }) {
    return _then(_$NotFoundFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NotFoundFailureImpl implements NotFoundFailure {
  const _$NotFoundFailureImpl({required this.message, this.code = 'NOT_FOUND'});

  @override
  final String message;
  @override
  @JsonKey()
  final String code;

  @override
  String toString() {
    return 'Failure.notFound(message: $message, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotFoundFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotFoundFailureImplCopyWith<_$NotFoundFailureImpl> get copyWith =>
      __$$NotFoundFailureImplCopyWithImpl<_$NotFoundFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String code, String? details)
        unexpected,
    required TResult Function(String message, String code, String? field)
        validation,
    required TResult Function(String message, String code, String? query)
        database,
    required TResult Function(String message, String code) auth,
    required TResult Function(String message, String code) network,
    required TResult Function(String message, String code) permission,
    required TResult Function(String message, String code) notFound,
    required TResult Function(String message, String code) printFailure,
    required TResult Function(String message, String code) exportFailure,
  }) {
    return notFound(message, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String code, String? details)? unexpected,
    TResult? Function(String message, String code, String? field)? validation,
    TResult? Function(String message, String code, String? query)? database,
    TResult? Function(String message, String code)? auth,
    TResult? Function(String message, String code)? network,
    TResult? Function(String message, String code)? permission,
    TResult? Function(String message, String code)? notFound,
    TResult? Function(String message, String code)? printFailure,
    TResult? Function(String message, String code)? exportFailure,
  }) {
    return notFound?.call(message, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String code, String? details)? unexpected,
    TResult Function(String message, String code, String? field)? validation,
    TResult Function(String message, String code, String? query)? database,
    TResult Function(String message, String code)? auth,
    TResult Function(String message, String code)? network,
    TResult Function(String message, String code)? permission,
    TResult Function(String message, String code)? notFound,
    TResult Function(String message, String code)? printFailure,
    TResult Function(String message, String code)? exportFailure,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(message, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnexpectedFailure value) unexpected,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(DatabaseFailure value) database,
    required TResult Function(AuthFailure value) auth,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(PermissionFailure value) permission,
    required TResult Function(NotFoundFailure value) notFound,
    required TResult Function(PrintFailure value) printFailure,
    required TResult Function(ExportFailure value) exportFailure,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnexpectedFailure value)? unexpected,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(DatabaseFailure value)? database,
    TResult? Function(AuthFailure value)? auth,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(PermissionFailure value)? permission,
    TResult? Function(NotFoundFailure value)? notFound,
    TResult? Function(PrintFailure value)? printFailure,
    TResult? Function(ExportFailure value)? exportFailure,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnexpectedFailure value)? unexpected,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(DatabaseFailure value)? database,
    TResult Function(AuthFailure value)? auth,
    TResult Function(NetworkFailure value)? network,
    TResult Function(PermissionFailure value)? permission,
    TResult Function(NotFoundFailure value)? notFound,
    TResult Function(PrintFailure value)? printFailure,
    TResult Function(ExportFailure value)? exportFailure,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class NotFoundFailure implements Failure {
  const factory NotFoundFailure(
      {required final String message,
      final String code}) = _$NotFoundFailureImpl;

  @override
  String get message;
  @override
  String get code;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotFoundFailureImplCopyWith<_$NotFoundFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PrintFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$PrintFailureImplCopyWith(
          _$PrintFailureImpl value, $Res Function(_$PrintFailureImpl) then) =
      __$$PrintFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String code});
}

/// @nodoc
class __$$PrintFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$PrintFailureImpl>
    implements _$$PrintFailureImplCopyWith<$Res> {
  __$$PrintFailureImplCopyWithImpl(
      _$PrintFailureImpl _value, $Res Function(_$PrintFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = null,
  }) {
    return _then(_$PrintFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PrintFailureImpl implements PrintFailure {
  const _$PrintFailureImpl({required this.message, this.code = 'PRINT'});

  @override
  final String message;
  @override
  @JsonKey()
  final String code;

  @override
  String toString() {
    return 'Failure.printFailure(message: $message, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrintFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrintFailureImplCopyWith<_$PrintFailureImpl> get copyWith =>
      __$$PrintFailureImplCopyWithImpl<_$PrintFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String code, String? details)
        unexpected,
    required TResult Function(String message, String code, String? field)
        validation,
    required TResult Function(String message, String code, String? query)
        database,
    required TResult Function(String message, String code) auth,
    required TResult Function(String message, String code) network,
    required TResult Function(String message, String code) permission,
    required TResult Function(String message, String code) notFound,
    required TResult Function(String message, String code) printFailure,
    required TResult Function(String message, String code) exportFailure,
  }) {
    return printFailure(message, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String code, String? details)? unexpected,
    TResult? Function(String message, String code, String? field)? validation,
    TResult? Function(String message, String code, String? query)? database,
    TResult? Function(String message, String code)? auth,
    TResult? Function(String message, String code)? network,
    TResult? Function(String message, String code)? permission,
    TResult? Function(String message, String code)? notFound,
    TResult? Function(String message, String code)? printFailure,
    TResult? Function(String message, String code)? exportFailure,
  }) {
    return printFailure?.call(message, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String code, String? details)? unexpected,
    TResult Function(String message, String code, String? field)? validation,
    TResult Function(String message, String code, String? query)? database,
    TResult Function(String message, String code)? auth,
    TResult Function(String message, String code)? network,
    TResult Function(String message, String code)? permission,
    TResult Function(String message, String code)? notFound,
    TResult Function(String message, String code)? printFailure,
    TResult Function(String message, String code)? exportFailure,
    required TResult orElse(),
  }) {
    if (printFailure != null) {
      return printFailure(message, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnexpectedFailure value) unexpected,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(DatabaseFailure value) database,
    required TResult Function(AuthFailure value) auth,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(PermissionFailure value) permission,
    required TResult Function(NotFoundFailure value) notFound,
    required TResult Function(PrintFailure value) printFailure,
    required TResult Function(ExportFailure value) exportFailure,
  }) {
    return printFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnexpectedFailure value)? unexpected,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(DatabaseFailure value)? database,
    TResult? Function(AuthFailure value)? auth,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(PermissionFailure value)? permission,
    TResult? Function(NotFoundFailure value)? notFound,
    TResult? Function(PrintFailure value)? printFailure,
    TResult? Function(ExportFailure value)? exportFailure,
  }) {
    return printFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnexpectedFailure value)? unexpected,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(DatabaseFailure value)? database,
    TResult Function(AuthFailure value)? auth,
    TResult Function(NetworkFailure value)? network,
    TResult Function(PermissionFailure value)? permission,
    TResult Function(NotFoundFailure value)? notFound,
    TResult Function(PrintFailure value)? printFailure,
    TResult Function(ExportFailure value)? exportFailure,
    required TResult orElse(),
  }) {
    if (printFailure != null) {
      return printFailure(this);
    }
    return orElse();
  }
}

abstract class PrintFailure implements Failure {
  const factory PrintFailure(
      {required final String message, final String code}) = _$PrintFailureImpl;

  @override
  String get message;
  @override
  String get code;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrintFailureImplCopyWith<_$PrintFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ExportFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$ExportFailureImplCopyWith(
          _$ExportFailureImpl value, $Res Function(_$ExportFailureImpl) then) =
      __$$ExportFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String code});
}

/// @nodoc
class __$$ExportFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$ExportFailureImpl>
    implements _$$ExportFailureImplCopyWith<$Res> {
  __$$ExportFailureImplCopyWithImpl(
      _$ExportFailureImpl _value, $Res Function(_$ExportFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = null,
  }) {
    return _then(_$ExportFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ExportFailureImpl implements ExportFailure {
  const _$ExportFailureImpl({required this.message, this.code = 'EXPORT'});

  @override
  final String message;
  @override
  @JsonKey()
  final String code;

  @override
  String toString() {
    return 'Failure.exportFailure(message: $message, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExportFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExportFailureImplCopyWith<_$ExportFailureImpl> get copyWith =>
      __$$ExportFailureImplCopyWithImpl<_$ExportFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String code, String? details)
        unexpected,
    required TResult Function(String message, String code, String? field)
        validation,
    required TResult Function(String message, String code, String? query)
        database,
    required TResult Function(String message, String code) auth,
    required TResult Function(String message, String code) network,
    required TResult Function(String message, String code) permission,
    required TResult Function(String message, String code) notFound,
    required TResult Function(String message, String code) printFailure,
    required TResult Function(String message, String code) exportFailure,
  }) {
    return exportFailure(message, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String code, String? details)? unexpected,
    TResult? Function(String message, String code, String? field)? validation,
    TResult? Function(String message, String code, String? query)? database,
    TResult? Function(String message, String code)? auth,
    TResult? Function(String message, String code)? network,
    TResult? Function(String message, String code)? permission,
    TResult? Function(String message, String code)? notFound,
    TResult? Function(String message, String code)? printFailure,
    TResult? Function(String message, String code)? exportFailure,
  }) {
    return exportFailure?.call(message, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String code, String? details)? unexpected,
    TResult Function(String message, String code, String? field)? validation,
    TResult Function(String message, String code, String? query)? database,
    TResult Function(String message, String code)? auth,
    TResult Function(String message, String code)? network,
    TResult Function(String message, String code)? permission,
    TResult Function(String message, String code)? notFound,
    TResult Function(String message, String code)? printFailure,
    TResult Function(String message, String code)? exportFailure,
    required TResult orElse(),
  }) {
    if (exportFailure != null) {
      return exportFailure(message, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnexpectedFailure value) unexpected,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(DatabaseFailure value) database,
    required TResult Function(AuthFailure value) auth,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(PermissionFailure value) permission,
    required TResult Function(NotFoundFailure value) notFound,
    required TResult Function(PrintFailure value) printFailure,
    required TResult Function(ExportFailure value) exportFailure,
  }) {
    return exportFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnexpectedFailure value)? unexpected,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(DatabaseFailure value)? database,
    TResult? Function(AuthFailure value)? auth,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(PermissionFailure value)? permission,
    TResult? Function(NotFoundFailure value)? notFound,
    TResult? Function(PrintFailure value)? printFailure,
    TResult? Function(ExportFailure value)? exportFailure,
  }) {
    return exportFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnexpectedFailure value)? unexpected,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(DatabaseFailure value)? database,
    TResult Function(AuthFailure value)? auth,
    TResult Function(NetworkFailure value)? network,
    TResult Function(PermissionFailure value)? permission,
    TResult Function(NotFoundFailure value)? notFound,
    TResult Function(PrintFailure value)? printFailure,
    TResult Function(ExportFailure value)? exportFailure,
    required TResult orElse(),
  }) {
    if (exportFailure != null) {
      return exportFailure(this);
    }
    return orElse();
  }
}

abstract class ExportFailure implements Failure {
  const factory ExportFailure(
      {required final String message, final String code}) = _$ExportFailureImpl;

  @override
  String get message;
  @override
  String get code;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExportFailureImplCopyWith<_$ExportFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
