import 'package:flutter/material.dart';
import '../widgets/BotaoPulsante.dart';

/// Tela que exibe um botão pulsante que aumenta e diminui de tamanho
/// quando pressionado e executa uma ação quando pressionado.
class TelaBotaoPulsante extends StatelessWidget {
  const TelaBotaoPulsante({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        title: const Text('Botão Pulsante.'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 300),
            BotaoPulsante(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Botão Pulsante Pressionado!')),
                );
              },
            ),
            SizedBox(height: 400),
            const Text(
              'Luiz Felipe Bastião',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const Text(
              'João Victor Pires Novais',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
