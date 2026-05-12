import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

/// Base class for all application failures.
/// Every failure is serialisable and carries a human-readable message.
@freezed
sealed class Failure with _$Failure {
  const factory Failure.unexpected({
    required String message,
    @Default('UNEXPECTED') String code,
    String? details,
  }) = UnexpectedFailure;

  const factory Failure.validation({
    required String message,
    @Default('VALIDATION') String code,
    String? field,
  }) = ValidationFailure;

  const factory Failure.database({
    required String message,
    @Default('DATABASE') String code,
    String? query,
  }) = DatabaseFailure;

  const factory Failure.auth({
    required String message,
    @Default('AUTH') String code,
  }) = AuthFailure;

  const factory Failure.network({
    required String message,
    @Default('NETWORK') String code,
  }) = NetworkFailure;

  const factory Failure.permission({
    required String message,
    @Default('PERMISSION') String code,
  }) = PermissionFailure;

  const factory Failure.notFound({
    required String message,
    @Default('NOT_FOUND') String code,
  }) = NotFoundFailure;

  const factory Failure.printFailure({
    required String message,
    @Default('PRINT') String code,
  }) = PrintFailure;

  const factory Failure.exportFailure({
    required String message,
    @Default('EXPORT') String code,
  }) = ExportFailure;

  factory Failure.fromException(Object e) {
    if (e is Failure) return e;
    return Failure.unexpected(message: e.toString());
  }
}