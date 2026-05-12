import 'package:sari_store/core/errors/result.dart';
import 'package:sari_store/features/auth/domain/repositories/auth_repository.dart';

class LogoutUseCase {
  final AuthRepository repository;

  LogoutUseCase(this.repository);

  Future<Result<void>> call() => repository.logout();
}