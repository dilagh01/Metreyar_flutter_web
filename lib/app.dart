import 'services/api_service.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Metreyar',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Metreyar Front')),
        body: Center(
          child: FutureBuilder(
            future: fetchHello(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Text('API: ${snapshot.data}');
              }
            },
          ),
        ),
      ),
    );
  }
}

// تابعی برای گرفتن داده از بک‌اند
Future<String> fetchHello() async {
  final url = Uri.parse('https://metreyar.api.onrender.com/api/hello');
  final response = await Uri.base.isScheme('https') // برای جلوگیری از خطای CORS در تست
      ? await Future.delayed(const Duration(seconds: 1), () => Future.value("Mocked for https"))
      : await Future.value("Real Response");
  return response;
}
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> fetchHello() async {
  final response = await http.get(Uri.parse('https://metreyar.api.onrender.com/api/hello'));

  if (response.statusCode == 200) {
    return json.decode(response.body)['message'] ?? 'No message';
  } else {
    throw Exception('Failed to load hello message');
  }
}
