import 'package:flutter/material.dart';

class LiveMatchesScreen extends StatelessWidget {
  final String sportName;

  const LiveMatchesScreen({Key? key, required this.sportName}) : super(key: key);

    @override
  Widget build(BuildContext context) {
    // Lista de equipos ficticios (ampliada)
    List<String> teams = [
      'Aptos Apes',
      'Solana Sharks',
      'Ethereum Eagles',
      'Polygon Panthers',
      'Bitcoin Bulls',
      'Cardano Cobras',
      'Polkadot Pythons',
      'Dogecoin Dogs',
      'Chainlink Cheetahs',
      'Cosmos Cosmos',
      // Agrega más equipos si lo deseas
    ];

    List<Map<String, dynamic>> liveMatches = [];
    for (int i = 0; i < teams.length; i++) { // Genera un partido para cada equipo
      String team1 = teams[i % teams.length];
      String team2 = teams[(i + 1) % teams.length];
      int score1 = (i * 2) % 5;
      int score2 = ((i + 1) * 3) % 5;
      liveMatches.add({
        'team1': team1,
        'team2': team2,
        'score': '$score1 - $score2',
      });
    
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Live $sportName Matches'),
      ),
      body: ListView.builder(
        itemCount: liveMatches.length,
        padding: const EdgeInsets.all(16.0), // Agrega padding
        itemBuilder: (context, index) {
          final match = liveMatches[index];
          return InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/bet',
                arguments: {
                  'team1': match['team1'],
                  'team2': match['team2'],
                  'score': match['score'],
                },
              );
            },
            child: Card( // Usa Card para cada partido
              elevation: 2.0,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Equipo 1 con icono
                    Row(
                      children: [
                        const Icon(Icons.sports_soccer, size: 24.0), // Puedes cambiar el icono
                        const SizedBox(width: 8.0),
                        Text(match['team1']),
                      ],
                    ),
                    // Marcador
                    Text(
                      match['score'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    // Equipo 2 con icono
                    Row(
                      children: [
                        Text(match['team2']),
                        const SizedBox(width: 8.0),
                        const Icon(Icons.sports_soccer, size: 24.0), // Puedes cambiar el icono
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}