import 'package:flutter/material.dart';
import 'services/api_service.dart'; // مطمئن شو مسیر درست باشه

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Metreyar Web',
      home: HelloScreen(),
    );
  }
}

class HelloScreen extends StatelessWidget {
  const HelloScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🧱 Metreyar Web Example'),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: ApiService.fetchHello(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('❌ Error: ${snapshot.error}');
            } else {
              return Text('✅ Response: ${snapshot.data}');
            }
          },
        ),
      ),
    );
  }
}
