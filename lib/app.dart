import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Metreyar App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String backendMessage = '⏳ در حال اتصال به سرور...';

  final String apiUrl = 'https://metreyar.api.onrender.com/api/hello';

  @override
  void initState() {
    super.initState();
    fetchBackendMessage();
  }

  Future<void> fetchBackendMessage() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final decoded = json.decode(response.body);
        setState(() {
          backendMessage = decoded['message'] ?? '✅ پاسخ بدون پیام مشخص';
        });
      } else {
        setState(() {
          backendMessage = '❌ خطای دریافت: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        backendMessage = '⚠️ خطای ارتباط با سرور: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🏗️ متریار وب'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            backendMessage,
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
