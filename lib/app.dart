import 'dart:convert';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String apiUrl = 'https://metreyar.api.onrender.com/api/hello';
  final String uploadUrl = 'https://metreyar.api.onrender.com/api/upload';

  Future<String> fetchHello() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['message'] ?? 'No message';
    } else {
      throw Exception('Failed to load message');
    }
  }

  Future<void> uploadFile() async {
    final html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
    uploadInput.accept = '*/*';
    uploadInput.click();

    uploadInput.onChange.listen((event) async {
      final file = uploadInput.files?.first;
      if (file != null) {
        final reader = html.FileReader();
        reader.readAsArrayBuffer(file);
        await reader.onLoad.first;

        final data = reader.result as List<int>;

        final request = http.MultipartRequest('POST', Uri.parse(uploadUrl));
        request.files.add(http.MultipartFile.fromBytes('file', data, filename: file.name));

        final response = await request.send();
        if (response.statusCode == 200) {
          html.window.alert('Upload successful');
        } else {
          html.window.alert('Upload failed');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Metreyar Web',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Metreyar Web')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder<String>(
                future: fetchHello(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Text('API says: ${snapshot.data}');
                  }
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: uploadFile,
                child: const Text('Upload File'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
