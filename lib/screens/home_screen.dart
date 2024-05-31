import 'package:aptos_hackathon/screens/bet_screen.dart';
import 'package:aptos_hackathon/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
            icon: const Icon(
              Icons.account_circle,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Tarjetas de balance y agregar fondos
            Row(
              children: [
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
                        // Agrega aquí la navegación a la pantalla de agregar fondos
                        Navigator.pushNamed(context, '/add_funds');

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

            // Featured Sports
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
              child: _buildSportsList(context),
            ),

            const SizedBox(height: 20.0),

            // Popular Leagues
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
              child: _buildLeaguesList(context),
            ),

            const SizedBox(height: 20.0),

            // Popular Matches
            const Text(
              'Popular Matches',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            SizedBox(
              height: 120.0,
              child: _buildPopularMatchesList(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSportsList(BuildContext context) {
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
              // Agrega aquí la navegación a la pantalla de todos los deportes
              Navigator.pushNamed(context, '/all_sports');
            } else {
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

  Widget _buildLeaguesList(BuildContext context) {
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
            if (leagues[index]['nombre'] == 'See All') {
              // Agrega aquí la navegación a la pantalla de todas las ligas
              Navigator.pushNamed(context, '/all_leagues');
            } else {
              Navigator.pushNamed(
                context,
                '/live_matches',
                arguments: {'sportName': leagues[index]['nombre']},
              );
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
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

  Widget _buildPopularMatchesList(BuildContext context) {
    final List<Map<String, dynamic>> popularMatches = [
      {
        'team1': 'Aptos Apes',
        'team2': 'Solana Sharks',
        'score': '2 - 1',
      },
      {
        'team1': 'Ethereum Eagles',
        'team2': 'Polygon Panthers',
        'score': '0 - 0',
      },
      {
        'team1': 'Bitcoin Bulls',
        'team2': 'Cardano Cobras',
        'score': '3 - 2',
      },
    ];

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: popularMatches.length,
      itemBuilder: (context, index) {
        final match = popularMatches[index];
        return InkWell(
          onTap: () {
            // Agrega aquí la navegación a la pantalla de detalles del partido
            // Puedes usar:
            // Navigator.pushNamed(context, '/match_details', arguments: match);
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BetScreen(
                    team1: match['team1'],
                    team2: match['team2'],
                    score: match['score'],
                  ),
                ));
          },
          child: Container(
            width: 220.0,
            margin: const EdgeInsets.only(right: 16.0),
            decoration: BoxDecoration(
              color: const Color(0xFF2C2F33),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        match['team1'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'vs',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 14.0,
                        ),
                      ),
                      Text(
                        match['team2'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    match['score'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
