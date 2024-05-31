import 'package:flutter/material.dart';

class LiveMatchesScreen extends StatelessWidget {
  final String sportName; // Recibirá el nombre del deporte

  const LiveMatchesScreen({Key? key, required this.sportName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Aquí obtendrías los datos de los partidos en vivo del deporte seleccionado
    // Puedes usar una API, un archivo local, o simular los datos
    // por ahora para este ejemplo.
    List<Map<String, dynamic>> liveMatches = [
      {'team1': 'Equipo A', 'team2': 'Equipo B', 'score': '1 - 0'},
      {'team1': 'Equipo C', 'team2': 'Equipo D', 'score': '2 - 2'},
      // ... más partidos del deporte seleccionado
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Live $sportName Matches'), // Título con el nombre del deporte
      ),
      body: ListView.builder(
        itemCount: liveMatches.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              '${liveMatches[index]['team1']} vs ${liveMatches[index]['team2']}',
            ),
            trailing: Text(liveMatches[index]['score']),
          );
        },
      ),
    );
  }
}