import 'package:sari_store/core/errors/result.dart';
import 'package:sari_store/core/errors/failures.dart';
import 'package:sari_store/core/security/password_hasher.dart';
import 'package:sari_store/core/logger/app_logger.dart';
import 'package:sari_store/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:sari_store/features/auth/domain/entities/user.dart';
import 'package:sari_store/features/auth/domain/repositories/auth_repository.dart';
import 'package:sari_store/shared/data/database/tables.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource _localDataSource;

  AuthRepositoryImpl({required AuthLocalDataSource localDataSource})
      : _localDataSource = localDataSource;

  @override
  Future<Result<User?>> getCurrentUser() async {
    try {
      final userId = await _localDataSource.getSavedUserId();
      if (userId == null) return const Result.success(null);

      final userData = await _localDataSource.getUserById(userId);
      if (userData == null || !userData.isActive) {
        await _localDataSource.clearSession();
        return const Result.success(null);
      }
      return Result.success(_mapToDomain(userData));
    } catch (e, stack) {
      AppLogger.error('getCurrentUser failed', e, stack);
      return Result.failure(Failure.database(message: 'Failed to retrieve session'));
    }
  }

  @override
  Future<Result<User>> login(String username, String password) async {
    try {
      final userData = await _localDataSource.getUserByUsername(username);
      if (userData == null) {
        return const Result.failure(Failure.auth(message: 'Invalid username or password'));
      }
      if (!userData.isActive) {
        return const Result.failure(Failure.auth(message: 'Account is deactivated'));
      }
      if (!PasswordHasher.verify(password, userData.passwordHash)) {
        return const Result.failure(Failure.auth(message: 'Invalid username or password'));
      }
      await _localDataSource.saveSession(userData.id);
      return Result.success(_mapToDomain(userData));
    } catch (e, stack) {
      AppLogger.error('Login failed', e, stack);
      return Result.failure(Failure.database(message: 'Database error during login'));
    }
  }

  @override
  Future<Result<void>> logout() async {
    try {
      await _localDataSource.clearSession();
      return const Result.success(null);
    } catch (e, stack) {
      AppLogger.error('Logout failed', e, stack);
      return Result.failure(Failure.database(message: 'Failed to clear session'));
    }
  }

  @override
  Future<Result<List<User>>> getAllUsers() async {
    try {
      final list = await _localDataSource.getAllUsers();
      return Result.success(list.map(_mapToDomain).toList());
    } catch (e, stack) {
      AppLogger.error('getAllUsers failed', e, stack);
      return Result.failure(Failure.database(message: 'Failed to fetch users'));
    }
  }

  @override
  Future<Result<User>> createUser({
    required String username,
    required String password,
    required String fullName,
    required UserRole role,
  }) async {
    try {
      // Check if username exists
      final existing = await _localDataSource.getUserByUsername(username);
      if (existing != null) {
        return const Result.failure(Failure.validation(message: 'Username already exists', field: 'username'));
      }
      final hashed = PasswordHasher.hash(password);
      final id = await _localDataSource.createUser(
        username: username,
        passwordHash: hashed,
        fullName: fullName,
        role: role.index,
      );
      final newUser = await _localDataSource.getUserById(id);
      return Result.success(_mapToDomain(newUser!));
    } catch (e, stack) {
      AppLogger.error('createUser failed', e, stack);
      return Result.failure(Failure.database(message: 'Failed to create user'));
    }
  }

  @override
  Future<Result<User>> updateUser({
    required int id,
    String? fullName,
    String? password,
    UserRole? role,
    bool? isActive,
  }) async {
    try {
      final existingData = await _localDataSource.getUserById(id);
      if (existingData == null) {
        return const Result.failure(Failure.notFound(message: 'User not found'));
      }
      // Build an updated companion (we use a helper method)
      final updated = existingData.copyWith(
        fullName: fullName ?? existingData.fullName,
        passwordHash: password != null ? PasswordHasher.hash(password) : existingData.passwordHash,
        role: role != null ? role.index : existingData.role,
        isActive: isActive ?? existingData.isActive,
        updatedAt: DateTime.now(),
      );
      await _localDataSource._db.userDao.updateUser(UsersCompanion(
        id: Value(id),
        username: Value(updated.username),
        passwordHash: Value(updated.passwordHash),
        fullName: Value(updated.fullName),
        role: Value(updated.role),
        isActive: Value(updated.isActive),
        updatedAt: Value(updated.updatedAt),
      ));
      final newUser = await _localDataSource.getUserById(id);
      return Result.success(_mapToDomain(newUser!));
    } catch (e, stack) {
      AppLogger.error('updateUser failed', e, stack);
      return Result.failure(Failure.database(message: 'Failed to update user'));
    }
  }

  @override
  Future<Result<void>> deleteUser(int id) async {
    try {
      final currentId = await _localDataSource.getSavedUserId();
      if (currentId == id) {
        return const Result.failure(Failure.validation(message: 'Cannot delete your own account'));
      }
      await _localDataSource.deleteUser(id);
      return const Result.success(null);
    } catch (e, stack) {
      AppLogger.error('deleteUser failed', e, stack);
      return Result.failure(Failure.database(message: 'Failed to delete user'));
    }
  }

  User _mapToDomain(UserData data) {
    return User(
      id: data.id,
      username: data.username,
      fullName: data.fullName,
      role: UserRole.values[data.role],
      isActive: data.isActive,
    );
  }
}