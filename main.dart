import 'dart:html' as html;
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String uploadUrl = 'https://metreyar.onrender.com/upload/'; // یا homkar.ir/upload/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Metreyar Web',
      home: Scaffold(
        appBar: AppBar(title: Text('آپلود فایل')),
        body: Center(
          child: ElevatedButton(
            child: Text('انتخاب و آپلود فایل'),
            onPressed: () async {
              final html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
              uploadInput.accept = '*/*';
              uploadInput.click();

              uploadInput.onChange.listen((e) async {
                final file = uploadInput.files!.first;
                final reader = html.FileReader();

                reader.readAsArrayBuffer(file);

                reader.onLoadEnd.listen((event) async {
                  Uint8List data = reader.result as Uint8List;

                  final request = http.MultipartRequest('POST', Uri.parse(uploadUrl));
                  request.files.add(
                    http.MultipartFile.fromBytes('file', data, filename: file.name),
                  );

                  final response = await request.send();

                  if (response.statusCode == 200) {
                    print('Upload successful!');
                  } else {
                    print('Upload failed with status ${response.statusCode}');
                  }
                });
              });
            },
          ),
        ),
      ),
    );
  }
}
