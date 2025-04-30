import 'package:flutter/material.dart';
import 'widgets/BotaoPulsante.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Botão Pulsante',
      home: const TelaBotaoPulsante(),
    );
  }
}

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
