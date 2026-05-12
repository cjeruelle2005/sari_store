import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables.dart';

part 'user_dao.g.dart';

@DriftAccessor(tables: [Users])
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin {
  UserDao(super.db);

  Future<List<UserData>> getAllUsers() => select(users).get();
  Future<UserData?> getUserById(int id) => (select(users)..where((t) => t.id.equals(id))).getSingleOrNull();
  Future<UserData?> getUserByUsername(String username) =>
      (select(users)..where((t) => t.username.equals(username))).getSingleOrNull();

  Future<int> insertUser(Insertable<UserData> user) => into(users).insert(user, mode: InsertMode.insertOrReplace);
  Future<bool> updateUser(Insertable<UserData> user) => update(users).replace(user);
  Future<int> deleteUser(int id) => (delete(users)..where((t) => t.id.equals(id))).go();
  Future<int> toggleUserActive(int id, bool isActive) =>
      (update(users)..where((t) => t.id.equals(id))).write(UsersCompanion(isActive: Value(isActive)));
}