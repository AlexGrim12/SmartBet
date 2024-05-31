import 'package:flutter/material.dart';

class AllLeaguesScreen extends StatelessWidget {
  const AllLeaguesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> allLeagues = [
      // Agrega aquí la lista completa de ligas con sus iconos
      {'nombre': 'NCAA', 'icono': Icons.school},
      {'nombre': 'Olympics', 'icono': Icons.sports},
      {'nombre': 'NBA', 'icono': Icons.sports_basketball},
      {'nombre': 'NFL', 'icono': Icons.sports_football},
      {'nombre': 'Premier League', 'icono': Icons.sports_soccer},
      {
        'nombre': 'UEFA Champions League',
        'icono': Icons.sports_soccer,
      },
      {'nombre': 'La Liga', 'icono': Icons.sports_soccer},
      {'nombre': 'Serie A', 'icono': Icons.sports_soccer},
      {'nombre': 'Ligue 1', 'icono': Icons.sports_soccer},
      {'nombre': 'Bundesliga', 'icono': Icons.sports_soccer},
      {'nombre': 'MLS', 'icono': Icons.sports_soccer},
      {'nombre': 'Copa Libertadores', 'icono': Icons.sports_soccer},
      {'nombre': 'Copa Sudamericana', 'icono': Icons.sports_soccer},
      {'nombre': 'FIFA World Cup', 'icono': Icons.sports_soccer},
      {'nombre': 'Super Bowl', 'icono': Icons.sports_football},
      {'nombre': 'MLB', 'icono': Icons.sports_baseball},
      {'nombre': 'NHL', 'icono': Icons.sports_hockey},
      {'nombre': 'UFC', 'icono': Icons.sports_mma},
      {'nombre': 'NASCAR', 'icono': Icons.sports_motorsports},
      {'nombre': 'PGA Tour', 'icono': Icons.sports_golf},
      {'nombre': 'ATP Tour', 'icono': Icons.sports_tennis},
      {'nombre': 'WTA Tour', 'icono': Icons.sports_tennis},
      {'nombre': 'Rugby', 'icono': Icons.sports_rugby},
      {'nombre': 'Cricket', 'icono': Icons.sports_cricket},
      {'nombre': 'WNBA', 'icono': Icons.sports_basketball},
      {'nombre': 'EuroLeague', 'icono': Icons.sports_basketball},
      {'nombre': 'NWSL', 'icono': Icons.sports_soccer},
      {'nombre': 'CFL', 'icono': Icons.sports_football},
      {'nombre': 'XFL', 'icono': Icons.sports_football},
      
      // ... más ligas
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('All Leagues'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Dos columnas
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        padding: const EdgeInsets.all(16.0),
        itemCount: allLeagues.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              // Lógica para navegar a la pantalla de partidos en vivo de la liga
              Navigator.pushNamed(
                context,
                '/live_matches', // Usar la misma plantilla de partidos en vivo
                arguments: {'sportName': allLeagues[index]['nombre']},
              );
            },
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    allLeagues[index]['icono'],
                    size: 40.0,
                  ),
                  const SizedBox(height: 8.0),
                  Text(allLeagues[index]['nombre']),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}