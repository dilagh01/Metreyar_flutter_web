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
        fontFamily: 'Vazirmatn',
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontFamily: 'Vazirmatn'),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
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

  // خواندن متغیر محیطی BACKEND_URL برای دپلوی
  final String baseUrl = const String.fromEnvironment('BACKEND_URL', defaultValue: 'http://localhost:3000');

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
          _projects = jsonDecode(utf8.decode(response.bodyBytes));
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
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'پروژه‌های متره‌یار',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: _loading
            ? const Center(child: CircularProgressIndicator())
            : errorMessage.isNotEmpty
                ? Center(
                    child: Text(
                      errorMessage,
                      style: const TextStyle(color: Colors.red, fontSize: 16),
                    ),
                  )
                : ListView.builder(
                    itemCount: _projects.length,
                    itemBuilder: (context, index) {
                      final project = _projects[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: ListTile(
                          title: Text(
                            project['name'] ?? 'بدون عنوان',
                            style: const TextStyle(fontSize: 18),
                          ),
                          subtitle: Text(
                            project['description'] ?? 'بدون توضیح',
                          ),
                        ),
                      );
                    },
                  ),
      ),
    );
  }
}
