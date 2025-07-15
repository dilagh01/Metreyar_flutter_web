import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Metreyar Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Vazirmatn',
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  Future<String> fetchMessage() async {
    final baseUrl = const String.fromEnvironment('BACKEND_URL');
    
    if (baseUrl.isEmpty) {
      throw Exception('Environment variable BACKEND_URL not found.');
    }

    final uri = Uri.parse(baseUrl);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      return decoded['message'] ?? 'پیام خالی است';
    } else {
      throw Exception('خطا در دریافت اطلاعات از سرور');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('پیام از سرور')),
      body: FutureBuilder<String>(
        future: fetchMessage(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'خطا: ${snapshot.error}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else {
            return Center(
              child: Text(
                snapshot.data ?? 'پیامی دریافت نشد.',
                style: const TextStyle(fontSize: 20),
              ),
            );
          }
        },
      ),
    );
  }
}
