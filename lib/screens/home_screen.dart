import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apuestas Deportivas', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.grey[800],
      ),
      body: ListView(
        children: <Widget>[
          _buildEventItem(context, 'Fútbol', 'Barcelona vs Real Madrid'),
          _buildEventItem(context, 'Baloncesto', 'Lakers vs Celtics'),
          _buildEventItem(context, 'Tenis', 'Federer vs Nadal'),
        ],
      ),
    );
  }

  Widget _buildEventItem(BuildContext context, String sport, String match) {
    return ListTile(
      leading: Icon(Icons.sports, color: Colors.grey[600]),
      title: Text(match),
      subtitle: Text(sport),
      onTap: () {
        // Navegar a la pantalla de detalles del evento
        Navigator.pushNamed(context, '/event_details');
      },
    );
  }
}