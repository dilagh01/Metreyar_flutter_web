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
        primarySwatch: Colors.indigo,
        fontFamily: 'Vazirmatn',
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

  // آدرس بک‌اند از طریق dart-define (در زمان build مشخص می‌شود)
  static const String baseUrl = String.fromEnvironment(
    'BACKEND_URL',
    defaultValue: 'http://localhost:8000',
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
          _projects = jsonDecode(utf8.decode(response.bodyBytes)); // برای رفع مشکل یونیکد
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
        title: const Text('پروژه‌های متره‌یار', textDirection: TextDirection.rtl),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(
                  child: Text(errorMessage, textDirection: TextDirection.rtl),
                )
              : _projects.isEmpty
                  ? const Center(
                      child: Text('هیچ پروژه‌ای یافت نشد.', textDirection: TextDirection.rtl),
                    )
                  : ListView.builder(
                      itemCount: _projects.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            _projects[index]['name'],
                            textDirection: TextDirection.rtl,
                          ),
                        );
                      },
                    ),
    );
  }
}
