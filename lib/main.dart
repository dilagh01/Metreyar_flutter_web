import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Metreyar Web',
      home: Scaffold(
        appBar: AppBar(title: const Text('Metreyar Web')),
        body: const Center(child: Text('Hello from Flutter Web!')),
      ),
    );
  }
}
