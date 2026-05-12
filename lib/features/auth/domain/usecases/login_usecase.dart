import 'package:sari_store/core/errors/result.dart';
import 'package:sari_store/core/errors/failures.dart';
import 'package:sari_store/features/auth/domain/entities/user.dart';
import 'package:sari_store/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<Result<User>> call(String username, String password) async {
    if (username.trim().isEmpty) {
      return Result.failure(const Failure.validation(message: 'Username is required', field: 'username'));
    }
    if (password.isEmpty) {
      return Result.failure(const Failure.validation(message: 'Password is required', field: 'password'));
    }
    return repository.login(username.trim(), password);
  }
}