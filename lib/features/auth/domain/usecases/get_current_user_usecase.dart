import 'package:sari_store/core/errors/result.dart';
import 'package:sari_store/features/auth/domain/entities/user.dart';
import 'package:sari_store/features/auth/domain/repositories/auth_repository.dart';

class GetCurrentUserUseCase {
  final AuthRepository repository;

  GetCurrentUserUseCase(this.repository);

  Future<Result<User?>> call() => repository.getCurrentUser();
}