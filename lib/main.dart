import 'package:flutter/material.dart';
import 'pages/file_upload_page.dart';  // وارد کردن صفحه آپلود فایل
import 'pages/meter_calculation_page.dart'; // وارد کردن صفحه محاسبات متره

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Metreyar Web',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('صفحه اصلی')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('خوش آمدید به متره‌یار!'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FileUploadPage()),
                );
              },
              child: const Text('ورود به آپلود فایل'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MeterCalculationPage()),
                );
              },
              child: const Text('ورود به فرم محاسبات متره'),
            ),
          ],
        ),
      ),
    );
  }
}
