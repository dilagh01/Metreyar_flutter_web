import 'dart:html' as html;
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FileUploadPage extends StatefulWidget {
  const FileUploadPage({super.key});

  @override
  State<FileUploadPage> createState() => _FileUploadPageState();
}

class _FileUploadPageState extends State<FileUploadPage> {
  String status = "هنوز فایلی انتخاب نشده";

  Future<void> _pickFile() async {
    if (kIsWeb) {
      html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
      uploadInput.accept = '.pdf,.xls,.xlsx'; // فقط فایل‌های PDF و Excel
      uploadInput.click();

      uploadInput.onChange.listen((e) {
        final file = uploadInput.files!.first;
        final reader = html.FileReader();

        reader.onLoadEnd.listen((e) async {
          final bytes = reader.result as Uint8List;
          final request = http.MultipartRequest('POST', Uri.parse('https://api.homkar.ir/upload/'));
          request.files.add(http.MultipartFile.fromBytes('file', bytes, filename: file.name));
          final response = await request.send();
          setState(() {
            status = response.statusCode == 200 ? "فایل با موفقیت ارسال شد" : "ارسال فایل با خطا مواجه شد";
          });
        });

        reader.readAsArrayBuffer(file);
      });
    } else {
      setState(() {
        status = "این قابلیت فقط در نسخه وب فعال است";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('آپلود فایل PDF یا Excel')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(status),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickFile,
              child: const Text('انتخاب فایل'),
            ),
          ],
        ),
      ),
    );
  }
}
