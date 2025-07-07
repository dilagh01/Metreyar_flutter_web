import 'package:flutter/material.dart';
// فرض بر این است که فایل api_service.dart شما دارای متد fetchHello است.
import 'api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HelloScreen(),
    );
  }
}

class HelloScreen extends StatelessWidget {
  const HelloScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Metreyar")),
      body: Center(
        child: FutureBuilder<String>(
          future: ApiService.fetchHello(),
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
    );
  }
}
