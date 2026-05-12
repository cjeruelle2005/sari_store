import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sari_store/shared/data/database/app_database.dart';
import 'package:sari_store/shared/data/database/tables.dart';
import 'package:sari_store/core/security/password_hasher.dart';
import 'package:sari_store/core/errors/failures.dart';
import 'package:sari_store/core/logger/app_logger.dart';

class AuthLocalDataSource {
  final AppDatabase _db;
  final FlutterSecureStorage _secureStorage;

  static const _sessionKey = 'current_user_id';

  AuthLocalDataSource({
    required AppDatabase database,
    required FlutterSecureStorage secureStorage,
  })  : _db = database,
        _secureStorage = secureStorage;

  // --- Session management ---
  Future<int?> getSavedUserId() async {
    try {
      final idStr = await _secureStorage.read(key: _sessionKey);
      if (idStr == null) return null;
      return int.tryParse(idStr);
    } catch (e) {
      AppLogger.error('Error reading session', e);
      return null;
    }
  }

  Future<void> saveSession(int userId) async {
    await _secureStorage.write(key: _sessionKey, value: userId.toString());
  }

  Future<void> clearSession() async {
    await _secureStorage.delete(key: _sessionKey);
  }

  // --- User CRUD ---
  Future<UserData?> getUserById(int id) => _db.userDao.getUserById(id);

  Future<UserData?> getUserByUsername(String username) =>
      _db.userDao.getUserByUsername(username);

  Future<int> createUser({
    required String username,
    required String passwordHash,
    required String fullName,
    required int role,
  }) {
    return _db.userDao.insertUser(
      UsersCompanion.insert(
        username: username,
        passwordHash: passwordHash,
        fullName: fullName,
        role: role,
      ),
    );
  }

  Future<bool> updateUser(UsersCompanion companion, int userId) {
    // Manual update using replace
    return _db.userDao.updateUser(companion.insertMode != InsertMode.insert ? companion : companion);
    // Actually easier: use the DAO's updateUser which uses replace.
    // We'll create a helper: fetch user, modify, then call updateUser.
  }

  Future<List<UserData>> getAllUsers() => _db.userDao.getAllUsers();

  Future<int> deleteUser(int id) => _db.userDao.deleteUser(id);

  /// Seed default owner account if no users exist.
  Future<void> seedDefaultOwner() async {
    final users = await _db.userDao.getAllUsers();
    if (users.isEmpty) {
      final hashed = PasswordHasher.hash('admin123');
      await createUser(
        username: 'owner',
        passwordHash: hashed,
        fullName: 'Store Owner',
        role: 0, // owner
      );
      AppLogger.info('Default owner account created (username: owner, password: admin123)');
    }
  }
}