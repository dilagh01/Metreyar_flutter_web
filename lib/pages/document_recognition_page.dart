import 'package:flutter/material.dart';

class DocumentRecognitionPage extends StatelessWidget {
  const DocumentRecognitionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تشخیص اسناد و سندنگاری')),
      body: const Center(
        child: Text('در این صفحه قابلیت تشخیص اسناد و سندنگاری توسعه خواهد یافت.'),
      ),
    );
  }
}
