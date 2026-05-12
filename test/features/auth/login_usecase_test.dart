import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sari_store/core/errors/result.dart';
import 'package:sari_store/core/errors/failures.dart';
import 'package:sari_store/features/auth/domain/entities/user.dart';
import 'package:sari_store/features/auth/domain/repositories/auth_repository.dart';
import 'package:sari_store/features/auth/domain/usecases/login_usecase.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository mockRepo;
  late LoginUseCase useCase;

  setUp(() {
    mockRepo = MockAuthRepository();
    useCase = LoginUseCase(mockRepo);
  });

  const testUser = User(
    id: 1,
    username: 'owner',
    fullName: 'Store Owner',
    role: UserRole.owner,
    isActive: true,
  );

  test('should return user when credentials are correct', () async {
    when(() => mockRepo.login('owner', 'admin123'))
        .thenAnswer((_) async => const Result.success(testUser));

    final result = await useCase('owner', 'admin123');

    expect(result.isSuccess, true);
    expect(result.dataOrNull, testUser);
  });

  test('should return failure when username is empty', () async {
    final result = await useCase('', 'admin123');

    expect(result.isFailure, true);
    expect(result.failureOrNull, isA<ValidationFailure>());
  });

  test('should return failure when password is empty', () async {
    final result = await useCase('owner', '');

    expect(result.isFailure, true);
    expect(result.failureOrNull, isA<ValidationFailure>());
  });

  test('should return failure when repository fails', () async {
    when(() => mockRepo.login('owner', 'wrong'))
        .thenAnswer((_) async => Result.failure(const AuthFailure(message: 'Invalid credentials')));

    final result = await useCase('owner', 'wrong');

    expect(result.isFailure, true);
    expect(result.failureOrNull, isA<AuthFailure>());
  });
}