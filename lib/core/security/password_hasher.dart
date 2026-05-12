import 'dart:convert';
import 'package:crypto/crypto.dart';

/// Secure password hashing using SHA-256 with a static salt.
/// In production, use a random salt per user. For simplicity,
/// we combine a fixed app pepper with the user's password.
class PasswordHasher {
  static const String _pepper = 'SariStore@2025#Secure!';

  /// Hashes a plain-text password.
  static String hash(String plainPassword) {
    final bytes = utf8.encode('$plainPassword$_pepper');
    final digest = sha256.convert(bytes);
    return digest.toString(); // hex string
  }

  /// Verifies a plain password against a stored hash.
  static bool verify(String plainPassword, String hashedPassword) {
    final inputHash = hash(plainPassword);
    return inputHash == hashedPassword;
  }
}