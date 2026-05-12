import 'package:freezed_annotation/freezed_annotation.dart';
import 'failures.dart';

part 'result.freezed.dart';

/// A type-safe container for an operation outcome.
/// Wrap every repository/service return value in [Result].
/// The UI can pattern-match on [Success] or [Failure] easily.
@freezed
sealed class Result<T> with _$Result<T> {
  const factory Result.success(T data) = Success<T>;

  const factory Result.failure(Failure failure) = FailureResult<T>;

  /// Convenience getters
  bool get isSuccess => this is Success<T>;
  bool get isFailure => this is FailureResult<T>;

  T? get dataOrNull => isSuccess ? (this as Success<T>).data : null;
  Failure? get failureOrNull => isFailure ? (this as FailureResult<T>).failure : null;

  /// Map success or throw failure
  R fold<R>({required R Function(T data) onSuccess, required R Function(Failure failure) onFailure}) {
    return switch (this) {
      Success<T>(:final data) => onSuccess(data),
      FailureResult<T>(:final failure) => onFailure(failure),
    };
  }
}