import 'package:sari_store/core/errors/result.dart';
import 'package:sari_store/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  /// Returns the currently authenticated user, or null.
  Future<Result<User?>> getCurrentUser();

  /// Attempts login with username and password.
  /// Returns the authenticated [User] on success.
  Future<Result<User>> login(String username, String password);

  /// Logs out the current user.
  Future<Result<void>> logout();

  /// Returns the list of all users (owner only).
  Future<Result<List<User>>> getAllUsers();

  /// Creates a new user by an admin/owner.
  Future<Result<User>> createUser({
    required String username,
    required String password,
    required String fullName,
    required UserRole role,
  });

  /// Updates an existing user.
  Future<Result<User>> updateUser({
    required int id,
    String? fullName,
    String? password,
    UserRole? role,
    bool? isActive,
  });

  /// Deletes a user (cannot delete self).
  Future<Result<void>> deleteUser(int id);
}