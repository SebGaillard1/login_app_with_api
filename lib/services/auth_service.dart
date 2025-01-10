import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';

import '../exceptions/auth_exception.dart';

class AuthService {
  // Je hash le password dans le front pour qu'il ne transit pas en clair
  static String hashPassword(String password) {
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<Map<String, dynamic>?> login(String email, String password) async {
    final hashedPassword = hashPassword(password);

    // Ici, l'url est 10.0.2.2 car j'utilise le simulateur.
    final url = Uri.parse('http://10.0.2.2:3000/login');

    final response = await http.post(
      url,
      body: {
        'email': email,
        'password': hashedPassword,
      },
    );

    // On traite la réponse de l'api
    if (response.statusCode == 200 || response.statusCode == 400) {
      final responseData = jsonDecode(response.body);

      if (responseData['status'] == 200) {
        // Succès
        return {
          'id': responseData['id'],
          'firstName': responseData['firstName'],
          'lastName': responseData['lastName'],
          'email': responseData['email'],
          'role': responseData['role'],
        };
      } else {
        // Erreur custom renvoyée par l’API (code 400 ou autre)
        throw AuthException(responseData['message']);
      }
    } else {
      // Erreur "générique" si ce n’est ni 200 ni 400
      throw AuthException('Erreur Serveur (${response.statusCode}).');
    }
  }
}