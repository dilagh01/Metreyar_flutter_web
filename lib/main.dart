import 'dart:html' as html;
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String uploadUrl = 'https://metreyar.onrender.com/upload'; // آدرس درست رو بذار

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Metreyar Web',
      home: Scaffold(
        appBar: AppBar(title: const Text('آپلود فایل')),
        body: Center(
          child: ElevatedButton(
            child: const Text('انتخاب و آپلود فایل'),
            onPressed: () async {
              final uploadInput = html.FileUploadInputElement()..accept = '*/*';
              uploadInput.click();

              uploadInput.onChange.listen((e) async {
                final files = uploadInput.files;
                if (files != null && files.isNotEmpty) {
                  final reader = html.FileReader();
                  reader.readAsArrayBuffer(files[0]!);
                  await reader.onLoad.first;

                  final data = reader.result as Uint8List;
                  final response = await http.post(
                    Uri.parse(uploadUrl),
                    headers: {'Content-Type': 'application/octet-stream'},
                    body: data,
                  );

                  // نمایش وضعیت
                  if (response.statusCode == 200) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('آپلود موفقیت‌آمیز بود')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('خطا: ${response.statusCode}')),
                    );
                  }
                }
              });
            },
          ),
        ),
      ),
    );
  }
}
