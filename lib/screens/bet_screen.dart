import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BetScreen extends StatefulWidget {
  final String team1;
  final String team2;
  final String score;

  const BetScreen({
    Key? key,
    required this.team1,
    required this.team2,
    required this.score,
  }) : super(key: key);

  @override
  State<BetScreen> createState() => _BetScreenState();
}

class _BetScreenState extends State<BetScreen> {
  String? _selectedTeam; // Equipo seleccionado
  final TextEditingController _amountController = TextEditingController();
  bool _showBetCard = false;
  double _totalBetAmount = 0.0; // Cantidad total apostada

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  // Función para calcular el porcentaje de ganancia
  String _calculateWinPercentage(String score, String teamName) {
    final scoreParts = score.split(' - ');
    final score1 = int.parse(scoreParts[0]);
    final score2 = int.parse(scoreParts[1]);

    double percentage = 0.0;
    if (widget.team1 == teamName) {
      percentage = (100 - (score2 - score1).toDouble() * 10).clamp(10.0, 90.0);
    } else {
      percentage = (100 - (score1 - score2).toDouble() * 10).clamp(10.0, 90.0);
    }
    return '${percentage.toStringAsFixed(1)}%';
  }

  // Función para mostrar la alerta de confirmación
  Future<void> _showConfirmationDialog() async {
    // Validar si ya hay un equipo seleccionado y es diferente al actual
    if (_selectedTeam != null && _selectedTeam != _selectedTeam) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('You can only bet on the same team')),
      );
      return;
    }
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(color: Colors.green, width: 2.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Icon(
                  Icons.warning_amber_rounded,
                  color: Colors.amber,
                  size: 48.0,
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Confirm Bet',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12.0),
                Text(
                  'Are you sure you want to bet ${_amountController.text} APTOS on $_selectedTeam?',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 12.0),
                const Text(
                  'This transaction will be processed through a smart contract.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 24.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print(
                            'Apuesta confirmada! Equipo: $_selectedTeam, Cantidad: ${_amountController.text} APTOS');
                        // Actualizar la cantidad total apostada
                        setState(() {
                          _totalBetAmount +=
                              double.tryParse(_amountController.text) ?? 0.0;
                        });

                        // Actualizar el estado para mostrar la tarjeta y guardar el equipo seleccionado
                        setState(() {
                          _showBetCard = true;
                          _selectedTeam =
                              _selectedTeam; // Guardar el equipo seleccionado
                        });

                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: const Text(
                        'Confirm',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Función para crear una columna para la selección de equipo
  Widget _buildTeamSelectionColumn(String teamName) {
    return Column(
      children: [
        _buildTeamButton(teamName),
        const SizedBox(height: 4.0),
        Text(
          _calculateWinPercentage(widget.score, teamName),
          style: const TextStyle(color: Colors.white70),
        ),
      ],
    );
  }

  // Función para crear una fila de estadísticas
  Widget _buildStatRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.white70)),
          Text(value, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _buildTeamButton(String teamName) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _selectedTeam = teamName;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: _selectedTeam == teamName ? Colors.green : null,
      ),
      child: Text(teamName, style: const TextStyle(color: Colors.white)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Place Your Bet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Título del Partido
            Container(
              padding: const EdgeInsets.symmetric(
                  vertical: 16.0, horizontal: 24.0),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                '${widget.team1} vs ${widget.team2}',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0,
                    ),
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Current Score: ${widget.score}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 20.0),

            // Sección de Estadísticas
            Card(
              elevation: 4.0,
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildStatRow('Possession', '60% - 40%'),
                    _buildStatRow('Shots', '8 - 5'),
                    _buildStatRow('Corners', '3 - 2'),
                    // ... Puedes agregar más estadísticas aquí
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20.0),

            // Selección de equipo con porcentaje de ganancia
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Equipo 1
                _buildTeamSelectionColumn(widget.team1),
                const SizedBox(width: 20.0),
                // Equipo 2
                _buildTeamSelectionColumn(widget.team2),
              ],
            ),

            const SizedBox(height: 8.0),
            const Text(
              'Estimated win percentage based on current score.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12.0,
              ),
            ), // Leyenda del porcentaje
            const SizedBox(height: 20.0),

            // Input para la cantidad de APTOS
            SizedBox(
              width: 200.0,
              child: TextFormField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                ],
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: 'Amount (APTOS)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                validator: (value) {
                  // ... [Validaciones]
                },
              ),
            ),
            const SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () {
                // Validaciones antes de mostrar el diálogo
                if (_selectedTeam == null) {
                  // Mostrar un mensaje al usuario si no ha seleccionado un equipo
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please select a team')),
                  );
                  return;
                }
                if (_amountController.text.isEmpty) {
                  // Mostrar un mensaje al usuario si no ha ingresado una cantidad
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter a bet amount')),
                  );
                  return;
                }
                // Si todas las validaciones pasan, mostrar el diálogo de confirmación
                _showConfirmationDialog();
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    horizontal: 40.0, vertical: 16.0),
              ),
              child: const Text('Place Bet',
                  style: TextStyle(color: Colors.white)),
            ),

            // Tarjeta de apuesta
            if (_showBetCard)
              Card(
                elevation: 4.0,
                margin: const EdgeInsets.all(16.0),
                color: Colors.green[700], // Color de fondo verde oscuro
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.check_circle,
                        color: Colors.white,
                        size: 48.0,
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        'Bet Placed!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      Text(
                        'You bet a total of $_totalBetAmount APTOS on $_selectedTeam', // Mostrar la cantidad total
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}