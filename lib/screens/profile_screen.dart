import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 60.0,
                backgroundImage: AssetImage('assets/profile_placeholder.png'),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'John Doe',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'johndoe@example.com',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 32.0),

              // Sección de Balance de APTOS
              _buildBalanceCard(),

              const SizedBox(height: 32.0),

              // Gráfica de Ganancias
              _buildProfitChart(),

              const SizedBox(height: 32.0),

              // Historial de Apuestas Recientes
              _buildRecentBetsSection(),

              const SizedBox(height: 32.0),

              // Estadísticas de Usuario
              _buildUserStatsSection(),

              const SizedBox(height: 32.0),

              ElevatedButton(
                onPressed: () {
                  // Lógica para editar el perfil
                },
                child: const Text('Edit Profile', style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Lógica para cerrar sesión
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: const Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 32.0),
            ],
          ),
        ),
      ),
    );
  }

  // Función para construir la tarjeta de balance
  Widget _buildBalanceCard() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        children: const [
          Text(
            'APTOS Balance',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            '250.50 APTOS',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }

  // Función para construir la gráfica de ganancias
  Widget _buildProfitChart() {
    final List<ChartData> chartData = [
      ChartData('Jan', 25),
      ChartData('Feb', 12),
      ChartData('Mar', 40),
      ChartData('Apr', 18),
      ChartData('May', 35),
      ChartData('Jun', 28),
      ChartData('Jul', 45),
    ];

    return Container(
      height: 300,
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        series: <CartesianSeries>[
          LineSeries<ChartData, String>(
            dataSource: chartData,
            xValueMapper: (ChartData data, _) => data.month,
            yValueMapper: (ChartData data, _) => data.profit,
          ),
        ],
      ),
    );
  }

  // Función para construir la sección de historial de apuestas recientes
  Widget _buildRecentBetsSection() {
    final List<Map<String, dynamic>> betHistory = [
      {
        'sport': 'Soccer',
        'match': 'Team A vs Team B',
        'outcome': 'Won',
        'amount': 10.0,
      },
      {
        'sport': 'Basketball',
        'match': 'Team C vs Team D',
        'outcome': 'Lost',
        'amount': -5.0,
      },
      {
        'sport': 'Tennis',
        'match': 'Player X vs Player Y',
        'outcome': 'Won',
        'amount': 15.0,
      },
      {
        'sport': 'Soccer',
        'match': 'Team E vs Team F',
        'outcome': 'Lost',
        'amount': -8.0,
      },
      {
        'sport': 'Basketball',
        'match': 'Team G vs Team H',
        'outcome': 'Won',
        'amount': 22.5,
      },
      // Agrega más elementos al historial de apuestas
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Recent Bets',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        SizedBox(
          height: 200.0,
          child: ListView.builder(
            itemCount: betHistory.length,
            itemBuilder: (context, index) {
              final bet = betHistory[index];
              return ListTile(
                leading: _getSportIcon(bet['sport']),
                title: Text(bet['match']),
                subtitle: Text(
                    '${bet['outcome']} ${bet['amount'].toStringAsFixed(2)} APTOS'),
                trailing: Text(
                  bet['amount'] >= 0
                      ? '+${bet['amount'].toStringAsFixed(2)}'
                      : bet['amount'].toStringAsFixed(2),
                  style: TextStyle(
                    color: bet['amount'] >= 0 ? Colors.green : Colors.red,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // Función auxiliar para obtener el ícono del deporte
  Icon _getSportIcon(String sport) {
    switch (sport) {
      case 'Soccer':
        return const Icon(Icons.sports_soccer);
      case 'Basketball':
        return const Icon(Icons.sports_basketball);
      case 'Tennis':
        return const Icon(Icons.sports_tennis);
      default:
        return const Icon(Icons.sports);
    }
  }

  // Función para construir la sección de estadísticas del usuario
  Widget _buildUserStatsSection() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        children: const [
          Text(
            'User Statistics',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          _StatRow(label: 'Total Bets:', value: '25'),
          _StatRow(label: 'Successful Bets:', value: '18'),
          _StatRow(label: 'Total Earnings:', value: '120.50 APTOS'),
        ],
      ),
    );
  }
}

// Widget personalizado para mostrar una fila de estadísticas
class _StatRow extends StatelessWidget {
  final String label;
  final String value;

  const _StatRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}

// Clase de datos para la gráfica
class ChartData {
  final String month;
  final double profit;

  ChartData(this.month, this.profit);
}