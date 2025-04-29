import 'package:flutter/material.dart';

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
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title:const Text(
          'Botão Pulsante',
          textAlign: TextAlign.center,
          ),
        ),
        body: Center(
          child: BotaoPulsante(
            onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Botão Pulsante Pressionado!'
                ),
              )
              );
            }
          )
        )
        );
  }
}

class BotaoPulsante extends StatefulWidget {
  final VoidCallback onPressed;

  const BotaoPulsante({super.key, required this.onPressed});

  @override
  State<BotaoPulsante> createState() => _BotaoPulsanteState();
}

class _BotaoPulsanteState extends State<BotaoPulsante> 
  with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.8, end: 1.2).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
      ),
    );
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: ElevatedButton(
        onPressed: () {
          _controller.forward().then((_) {
            widget.onPressed();
            _controller.reverse();
          });
        },
        child: const Text('Pressione-me!', 
        style:TextStyle(
          color: Colors.white,
           fontSize: 20),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          textStyle: const TextStyle(fontSize: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
  }
