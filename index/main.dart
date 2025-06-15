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
      title: 'متره یار وب',
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
  String message = 'در حال بارگذاری...';

  @override
  void initState() {
    super.initState();
    fetchMessage();
  }

  Future<void> fetchMessage() async {
    try {
      var url = Uri.parse('http://localhost:8000/api/metreyar'); // آدرس API خودت رو اینجا بزار
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        setState(() {
          message = data['message'];
        });
      } else {
        setState(() {
          message = 'خطا در دریافت داده از سرور';
        });
      }
    } catch (e) {
      setState(() {
        message = 'خطا: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('متره یار وب'),
      ),
      body: Center(
        child: Text(message),
      ),
    );
  }
}
