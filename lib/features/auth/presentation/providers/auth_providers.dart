import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sari_store/core/errors/result.dart';
import 'package:sari_store/core/errors/failures.dart';
import 'package:sari_store/core/logger/app_logger.dart';
import 'package:sari_store/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:sari_store/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:sari_store/features/auth/domain/entities/user.dart';
import 'package:sari_store/features/auth/domain/repositories/auth_repository.dart';
import 'package:sari_store/features/auth/domain/usecases/login_usecase.dart';
import 'package:sari_store/features/auth/domain/usecases/logout_usecase.dart';
import 'package:sari_store/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:sari_store/shared/data/database/app_database.dart';
import 'package:sari_store/shared/providers/database_provider.dart';

// --- Secure Storage Provider ---
final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage();
});

// --- Auth Local Data Source ---
final authLocalDataSourceProvider = Provider<AuthLocalDataSource>((ref) {
  return AuthLocalDataSource(
    database: ref.watch(databaseProvider),
    secureStorage: ref.watch(secureStorageProvider),
  );
});

// --- Auth Repository ---
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    localDataSource: ref.watch(authLocalDataSourceProvider),
  );
});

// --- Use Cases ---
final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  return LoginUseCase(ref.watch(authRepositoryProvider));
});

final logoutUseCaseProvider = Provider<LogoutUseCase>((ref) {
  return LogoutUseCase(ref.watch(authRepositoryProvider));
});

final getCurrentUserUseCaseProvider = Provider<GetCurrentUserUseCase>((ref) {
  return GetCurrentUserUseCase(ref.watch(authRepositoryProvider));
});

// We'll manage the logged-in user and loading state.
// --- AuthState ---
@immutable
class AuthState {
  final User? user;
  final bool isLoading;
  final bool isInitialized;
  final String? errorMessage;

  const AuthState({
    this.user,
    this.isLoading = false,
    this.isInitialized = false,
    this.errorMessage,
  });

  AuthState copyWith({
    User? user,
    bool? isLoading,
    bool? isInitialized,
    String? errorMessage,
  }) {
    return AuthState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      isInitialized: isInitialized ?? this.isInitialized,
      errorMessage: errorMessage,
    );
  }

  bool get isAuthenticated => user != null && isInitialized;
}

class AuthNotifier extends StateNotifier<AuthState> {
  final GetCurrentUserUseCase _getCurrentUser;
  final LoginUseCase _login;
  final LogoutUseCase _logout;

  AuthNotifier({
    required GetCurrentUserUseCase getCurrentUser,
    required LoginUseCase login,
    required LogoutUseCase logout,
  })  : _getCurrentUser = getCurrentUser,
        _login = login,
        _logout = logout,
        super(const AuthState());

  Future<void> init() async {
    if (state.isInitialized) return;
    state = state.copyWith(isLoading: true);
    final result = await _getCurrentUser();
    result.fold(
      onSuccess: (user) => state = state.copyWith(
        user: user,
        isLoading: false,
        isInitialized: true,
      ),
      onFailure: (failure) => state = state.copyWith(
        isLoading: false,
        isInitialized: true,
        errorMessage: failure.message,
      ),
    );
  }

  Future<void> login(String username, String password) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    final result = await _login(username, password);
    result.fold(
      onSuccess: (user) => state = state.copyWith(
        user: user,
        isLoading: false,
      ),
      onFailure: (failure) => state = state.copyWith(
        isLoading: false,
        errorMessage: failure.message,
      ),
    );
  }

  Future<void> logout() async {
    state = state.copyWith(isLoading: true);
    final result = await _logout();
    result.fold(
      onSuccess: (_) => state = const AuthState(isInitialized: true),
      onFailure: (failure) => state = state.copyWith(
        isLoading: false,
        errorMessage: failure.message,
      ),
    );
  }
}

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(
    getCurrentUser: ref.watch(getCurrentUserUseCaseProvider),
    login: ref.watch(loginUseCaseProvider),
    logout: ref.watch(logoutUseCaseProvider),
  );
});