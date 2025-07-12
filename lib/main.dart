import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MetreyarApp());
}

class MetreyarApp extends StatelessWidget {
  const MetreyarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Metreyar Web',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProjectsPage(),
    );
  }
}

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  List<dynamic> _projects = [];
  bool _loading = true;
  String errorMessage = '';

  // آدرس بک‌اند از محیط
  final String baseUrl = const String.fromEnvironment(
    'BACKEND_URL',
    defaultValue: 'https://metreyar.onrender.com',
  );

  @override
  void initState() {
    super.initState();
    fetchProjects();
  }

  Future<void> fetchProjects() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/projects'));
      if (response.statusCode == 200) {
        setState(() {
          _projects = jsonDecode(response.body);
          _loading = false;
        });
      } else {
        setState(() {
          errorMessage = 'خطا در بارگذاری پروژه‌ها: ${response.statusCode}';
          _loading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'ارتباط با سرور برقرار نشد 😢';
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('پروژه‌های متره‌یار'),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(child: Text(errorMessage))
              : ListView.builder(
                  itemCount: _projects.length,
                  itemBuilder: (context, index) {
                    final item = _projects[index];
                    return ListTile(
                      title: Text(item['name']),
                      subtitle: Text('ID: ${item['id']}'),
                    );
                  },
                ),
    );
  }
}
