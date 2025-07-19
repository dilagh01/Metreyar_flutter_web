import 'package:flutter/material.dart';

class StudyPage extends StatelessWidget {
  const StudyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('مطالعه و مستندسازی')),
      body: const Center(
        child: Text('در این صفحه امکان مطالعه، مستندسازی و گزارش‌گیری وجود خواهد داشت.'),
      ),
    );
  }
}
