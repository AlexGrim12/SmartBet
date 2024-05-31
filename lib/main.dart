import 'package:aptos_hackathon/screens/home_screen.dart';
import 'package:aptos_hackathon/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicación de Apuestas',
      theme: ThemeData(
        // Aquí puedes personalizar el tema de tu aplicación
        brightness: Brightness.light,
        primaryColor: Colors.grey[800],
        hintColor: Colors.grey[600],
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      initialRoute: '/', // Ruta inicial al iniciar la aplicación
      routes: {
        '/': (context) => LoginScreen(), // Pantalla de inicio de sesión
        '/home': (context) => HomeScreen(), // Pantalla principal
      },
    );
  }
}