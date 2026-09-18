
import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ContadorAnimadoScreen(),
    );
  }
}

class ContadorAnimadoScreen extends StatefulWidget {
  const ContadorAnimadoScreen({super.key});

  @override
  State<ContadorAnimadoScreen> createState() => _ContadorAnimadoScreenState();
}

class _ContadorAnimadoScreenState extends State<ContadorAnimadoScreen> with SingleTickerProviderStateMixin {
  int _segundos Restantes = 10;
  Timer? _timer;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    
    // Controlador da animação com duração de 1 segundo (para cada batida do timer)
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _iniciarContador();
  }

  void _iniciarContador() {
    _animationController.forward(from: 0.0); // Inicia a primeira animação

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_segundosRestantes > 1) {
        setState(() {
          _segundosRestantes--;
        });
        _animationController.forward(from: 0.0); // Reinicia a animação a cada segundo
      } else {
        setState(() {
          _segundosRestantes = 0;
        });
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Evita vazamento de memória
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: _segundosRestantes > 0
            ? ScaleTransition(
                scale: Tween<double>(begin: 1.5, end: 0.8).animate(
                  CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
                ),
                child: FadeTransition(
                  opacity: Tween<double>(begin: 1.0, end: 0.2).animate(_animationController),
                  child: Text(
                    '$_segundosRestantes',
                    style: const TextStyle(
                      fontSize: 120,
                      fontWeight: FontWeight.bold,
                      color: Colors.cyanAccent,
                    ),
                  ),
                ),
              )
            : const Text(
                'Fogo! 🚀',
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.orangeAccent,
                ),
              ),
      ),
    );
  }
}
