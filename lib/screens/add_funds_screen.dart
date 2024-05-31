import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart'; // Asegúrate de instalar la librería qr_flutter

class AddFundsScreen extends StatelessWidget {
  const AddFundsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const walletAddress = '1234'; // Reemplaza con tu dirección de wallet

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Funds'),
      ),
      body: Center( // Centra el contenido
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centra verticalmente
          children: [
            QrImageView(data: walletAddress, size: 200.0, foregroundColor: Colors.white,
), // Muestra el código QR (200x200

            const SizedBox(height: 20.0),
            Text(
              'Wallet Address:',
              style: Theme.of(context).textTheme.titleLarge, // Usar headline6 en lugar de titleLarge
            ),
            const SizedBox(height: 8.0),
            SelectableText( // Permite al usuario copiar la dirección
              walletAddress,
              style: Theme.of(context).textTheme.bodyMedium, // Usar bodyText2 en lugar de bodyLarge
            ),
            const SizedBox(height: 20.0),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                'Scan the QR code or copy the wallet address to transfer APTOS to your account.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
