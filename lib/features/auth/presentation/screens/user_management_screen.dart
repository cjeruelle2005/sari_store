import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sari_store/core/errors/result.dart';
import 'package:sari_store/features/auth/domain/entities/user.dart';
import 'package:sari_store/features/auth/domain/repositories/auth_repository.dart';
import 'package:sari_store/features/auth/presentation/providers/auth_providers.dart';

class UserManagementScreen extends ConsumerStatefulWidget {
  const UserManagementScreen({super.key});

  @override
  ConsumerState<UserManagementScreen> createState() => _UserManagementScreenState();
}

class _UserManagementScreenState extends ConsumerState<UserManagementScreen> {
  List<User> _users = [];
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    final repo = ref.read(authRepositoryProvider);
    final result = await repo.getAllUsers();
    result.fold(
      onSuccess: (users) {
        setState(() {
          _users = users;
          _loading = false;
        });
      },
      onFailure: (failure) {
        setState(() {
          _error = failure.message;
          _loading = false;
        });
      },
    );
  }

  Future<void> _addOrEditUser({User? existingUser}) async {
    final usernameController = TextEditingController(text: existingUser?.username ?? '');
    final fullNameController = TextEditingController(text: existingUser?.fullName ?? '');
    final passwordController = TextEditingController();
    UserRole selectedRole = existingUser?.role ?? UserRole.staff;
    final formKey = GlobalKey<FormState>();

    final result = await showDialog<bool>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          title: Text(existingUser == null ? 'Add User' : 'Edit User'),
          content: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: usernameController,
                    decoration: const InputDecoration(labelText: 'Username'),
                    validator: (v) => v == null || v.trim().isEmpty ? 'Required' : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: fullNameController,
                    decoration: const InputDecoration(labelText: 'Full Name'),
                    validator: (v) => v == null || v.trim().isEmpty ? 'Required' : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: existingUser != null ? 'New Password (leave blank to keep)' : 'Password',
                    ),
                    validator: existingUser == null
                        ? (v) => v == null || v.isEmpty ? 'Required' : null
                        : null,
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<UserRole>(
                    value: selectedRole,
                    decoration: const InputDecoration(labelText: 'Role'),
                    items: UserRole.values.map((role) {
                      return DropdownMenuItem(
                        value: role,
                        child: Text(role.name.toUpperCase()),
                      );
                    }).toList(),
                    onChanged: (val) => setDialogState(() => selectedRole = val!),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
            ElevatedButton(
              onPressed: () async {
                if (!formKey.currentState!.validate()) return;
                Navigator.pop(ctx, true);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );

    if (result == true) {
      final repo = ref.read(authRepositoryProvider);
      Result<User> res;
      if (existingUser == null) {
        res = await repo.createUser(
          username: usernameController.text.trim(),
          fullName: fullNameController.text.trim(),
          password: passwordController.text,
          role: selectedRole,
        );
      } else {
        res = await repo.updateUser(
          id: existingUser.id,
          fullName: fullNameController.text.trim(),
          role: selectedRole,
          password: passwordController.text.isNotEmpty ? passwordController.text : null,
        );
      }
      res.fold(
        onSuccess: (_) => _loadUsers(),
        onFailure: (failure) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(failure.message)));
          }
        },
      );
    }
  }

  Future<void> _deleteUser(User user) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete User'),
        content: Text('Are you sure you want to delete ${user.fullName}?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.error),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    if (confirm == true) {
      final repo = ref.read(authRepositoryProvider);
      final res = await repo.deleteUser(user.id);
      res.fold(
        onSuccess: (_) => _loadUsers(),
        onFailure: (failure) {
          if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(failure.message)));
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Management'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _addOrEditUser(),
          ),
        ],
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(child: Text(_error!, style: TextStyle(color: Theme.of(context).colorScheme.error)))
              : ListView.builder(
                  itemCount: _users.length,
                  itemBuilder: (context, index) {
                    final user = _users[index];
                    return ListTile(
                      title: Text(user.fullName),
                      subtitle: Text('${user.username} | ${user.role.name.toUpperCase()}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.circle,
                              size: 12,
                              color: user.isActive ? Colors.green : Colors.red),
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () => _addOrEditUser(existingUser: user),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => _deleteUser(user),
                          ),
                        ],
                      ),
                    );
                  },
                ),
    );
  }
}