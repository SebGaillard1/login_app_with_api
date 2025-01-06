import 'dart:convert';
import 'package:crypto/crypto.dart';

import '../exceptions/auth_exception.dart';

class AuthService {
  // Tableau associatif local des utilisateurs
  final Map<String, Map<String, dynamic>> _users = {
    'user@example.com': {
      'password': hashPassword('userpass'),
      'firstName': 'Jane',
      'lastName': 'Doe',
      'role': 'User',
    },
    'admin@example.com': {
      'password': hashPassword('adminpass'),
      'firstName': 'Admin',
      'lastName': 'User',
      'role': 'Admin',
    },
  };
  // Méthode de connexion
  Future<Map<String, dynamic>?> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1)); // Faux délai pour simuler un backend

    if (!_users.containsKey(email)) {
      // Je lève un exception précise si l'email n'est pas trouvé
      throw AuthException('Email non enregistré');
    }

    final userData = _users[email]!;
    final userSalt = userData['salt'];
    final hashedPassword = hashPassword(password);

    if (userData['password'] != hashedPassword) {
      // Je lève un exception précise si le mot de passe est incorrect
      throw AuthException('Mot de passe incorrect');
    }

    return userData;
  }


  static String hashPassword(String password) {
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}