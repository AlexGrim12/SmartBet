import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F2126),
      appBar: AppBar(
        title: const Text(
          'SmartBet',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF2C2F33),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Tarjetas de Balance y Agregar Fondos (Fila)
            Row(
              children: [
                // Tarjeta de Balance
                SizedBox(
                  width: 180,
                  child: Card(
                    color: const Color(0xFF2C2F33),
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Available Balance',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            '150.00 APTOS',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                // Tarjeta de Agregar Fondos
                SizedBox(
                  width: 180,
                  child: Card(
                    color: const Color(0xFF00D16C),
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: InkWell(
                      onTap: () {
                        print('Add Funds');
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.add_circle_outline,
                              color: Colors.white,
                              size: 30.0,
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Add Funds',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            // Featured Sports (Horizontal)
            const Text(
              'Featured Sports',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            SizedBox(
              height: 80.0,
              child: _buildSportsList(),
            ),
            // Popular Leagues (Horizontal - Tarjetas cuadradas)
            const SizedBox(height: 20.0),
            const Text(
              'Popular Leagues',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            SizedBox(
              height: 100.0,
              child: _buildLeaguesList(),
            ),
            // Resto del contenido de la pantalla...
          ],
        ),
      ),
    );
  }

  Widget _buildSportsList() {
    final List<Map<String, dynamic>> sports = [
      {'nombre': 'Soccer', 'icono': Icons.sports_soccer},
      {'nombre': 'Basketball', 'icono': Icons.sports_basketball},
      {'nombre': 'Tennis', 'icono': Icons.sports_tennis},
      {'nombre': 'Baseball', 'icono': Icons.sports_baseball},
      {'nombre': 'See All', 'icono': Icons.arrow_forward},
    ];

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: sports.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            if (sports[index]['nombre'] == 'See All') {
              Navigator.pushNamed(context, '/all_sports');
            } else {
              // Navegar a LiveMatchesScreen con el nombre del deporte
              Navigator.pushNamed(
                context,
                '/live_matches',
                arguments: {'sportName': sports[index]['nombre']},
              );
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    sports[index]['icono'],
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  sports[index]['nombre'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildLeaguesList() {
    final List<Map<String, dynamic>> leagues = [
      {'nombre': 'NCAA', 'icono': Icons.school},
      {'nombre': 'Olympics', 'icono': Icons.sports},
      {'nombre': 'NBA', 'icono': Icons.sports_basketball},
      {'nombre': 'NFL', 'icono': Icons.sports_football},
      {'nombre': 'See All', 'icono': Icons.arrow_forward},
    ];

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: leagues.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            // ... [Lógica para manejar el toque en las ligas]
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Tarjeta para el logo de la liga
                Card(
                  color: Colors.grey[800],
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Container(
                    width: 60.0,
                    height: 60.0,
                    child: Icon(
                      leagues[index]['icono'],
                      color: Colors.white,
                      size: 30.0,
                    ),
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  leagues[index]['nombre'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}