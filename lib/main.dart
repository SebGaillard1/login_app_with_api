import 'package:flutter/material.dart';

import 'screens/login_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(const LoginApp());
}
class LoginApp extends StatelessWidget {
  const LoginApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Application de Connexion',
      theme: ThemeData(
        // J'ai fait ma propre palette
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          primary: Colors.deepPurple,
          secondary: Colors.amber,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 16, color: Colors.black87),
          titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        useMaterial3: true,
      ),
      home: const LoginScreen(title: 'Page de Connexion'),
      debugShowCheckedModeBanner: false,
    );
  }
}