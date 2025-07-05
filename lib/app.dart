import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<String> fetchHello() async {
    final response = await http.get(Uri.parse('https://api.homkar.ir/api/hello'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['message'] ?? 'No message';
    } else {
      throw Exception('Failed to load message');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                return Text('Error: ${snapshot.error}');
              } else {
                return Text('API response: ${snapshot.data}');
              }
            },
          ),
        ),
      ),
    );
  }
}
