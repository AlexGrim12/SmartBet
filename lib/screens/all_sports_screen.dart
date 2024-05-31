import 'package:flutter/material.dart';

class AllSportsScreen extends StatelessWidget {
  const AllSportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> allSports = [
      // Agrega aquí la lista completa de deportes con sus iconos
      {'nombre': 'Soccer', 'icono': Icons.sports_soccer},
      {'nombre': 'Basketball', 'icono': Icons.sports_basketball},
      {'nombre': 'Tennis', 'icono': Icons.sports_tennis},
      {'nombre': 'Baseball', 'icono': Icons.sports_baseball},
      {'nombre': 'American Football', 'icono': Icons.sports_football},
      {
        'nombre': 'Ice Hockey',
        'icono': Icons.sports_hockey,
      },
      {'nombre': 'Golf', 'icono': Icons.sports_golf},
      {'nombre': 'MMA', 'icono': Icons.sports_mma},
      {'nombre': 'Motorsports', 'icono': Icons.sports_motorsports},
      {'nombre': 'Rugby', 'icono': Icons.sports_rugby},
      {'nombre': 'Cricket', 'icono': Icons.sports_cricket},
      {'nombre': 'Volleyball', 'icono': Icons.sports_volleyball},
      {'nombre': 'Handball', 'icono': Icons.sports_handball},
      {'nombre': 'Field Hockey', 'icono': Icons.sports_hockey},
      // ... más deportes
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('All Sports'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Dos columnas
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        padding: const EdgeInsets.all(16.0),
        itemCount: allSports.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              // Lógica para manejar el toque en un deporte
              print('Selected Sport: ${allSports[index]['nombre']}');
              // Dentro de AllSportsScreen
  Navigator.pushNamed(
    context,
    '/live_matches',
    arguments: {'sportName': allSports[index]['nombre']}, // Pasa el nombre del deporte
  );

            },
            child: Card(
              // Puedes personalizar la apariencia de las tarjetas
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    allSports[index]['icono'],
                    size: 40.0,
                  ),
                  const SizedBox(height: 8.0),
                  Text(allSports[index]['nombre']),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}