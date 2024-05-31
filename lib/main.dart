import 'dart:async';

import 'package:aptos_hackathon/screens/add_funds_screen.dart';
import 'package:aptos_hackathon/screens/all_leagues_screen.dart';
import 'package:aptos_hackathon/screens/all_sports_screen.dart';
import 'package:aptos_hackathon/screens/bet_screen.dart';
import 'package:aptos_hackathon/screens/home_screen.dart';
import 'package:aptos_hackathon/screens/live_matches_screen.dart';
import 'package:aptos_hackathon/screens/login_screen.dart';
import 'package:aptos_hackathon/screens/profile_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Beat',
      theme: ThemeData(
        brightness: Brightness.dark, // Fondo oscuro
        primaryColor: const Color(0xFF00D16C), // Verde principal
        scaffoldBackgroundColor:
            const Color(0xFF1F2126), // Fondo oscuro para Scaffolds
        cardColor: const Color(0xFF2C2F33), // Color de las tarjetas
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white), // Color de texto general
          bodyMedium:
              TextStyle(color: Colors.white), // Color de texto secundario
          titleLarge: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ), // Estilo para títulos
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
                color: const Color(0xFF00D16C)), // Verde en el borde activo
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF00D16C), // Verde para botones
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            textStyle: const TextStyle(fontSize: 18.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/all_sports': (context) => const AllSportsScreen(),
        '/live_matches': (context) {
          final args = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;
          final sportName = args['sportName']; // Obtiene el nombre del deporte
          return LiveMatchesScreen(
              sportName: sportName); // Crea la pantalla con el argumento
        },
        '/all_leagues': (context) => const AllLeaguesScreen(),
        '/add_funds': (context) => const AddFundsScreen(),
        '/bet': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map;
          return BetScreen(
            team1: args['team1'],
            team2: args['team2'],
            score: args['score'],
          );
        },
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simula una carga de 3 segundos y luego navega a LoginScreen
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F2126), // Usa tu color de fondo
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png', // Reemplaza con la ruta de tu logo
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF00D16C)),
            ),
          ],
        ),
      ),
    );
  }
}
