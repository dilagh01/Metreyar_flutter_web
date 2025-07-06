import 'package:flutter/material.dart';
import 'services/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Metreyar Front")),
        body: Center(
          child: FutureBuilder<String>(
            future: ApiService.ping(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text("❌ Error: ${snapshot.error}");
              } else {
                return Text(snapshot.data ?? "No response");
              }
            },
          ),
        ),
      ),
    );
  }
}
