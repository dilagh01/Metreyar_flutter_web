import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const String apiBase = String.fromEnvironment('BACKEND_URL', defaultValue: 'https://metreyar.onrender.com');

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<String> fetchHello() async {
    final response = await http.get(Uri.parse('$apiBase/api/hello'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['message'] ?? 'No message';
    } else {
      throw Exception('Failed to load message: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Metreyar Web',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Metreyar Web')),
        body: Center(
          child: FutureBuilder<String>(
            future: fetchHello(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text(
                  '❌ Error: ${snapshot.error}',
                  style: const TextStyle(color: Colors.red),
                );
              } else {
                return Text(
                  '✅ API Response: ${snapshot.data}',
                  style: const TextStyle(fontSize: 18),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
