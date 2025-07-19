import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'dart:io';

class DocumentRecognitionPage extends StatefulWidget {
  const DocumentRecognitionPage({super.key});

  @override
  _DocumentRecognitionPageState createState() =>
      _DocumentRecognitionPageState();
}

class _DocumentRecognitionPageState extends State<DocumentRecognitionPage> {
  File? _image;
  String _text = "متنی شناسایی نشده است";
  final picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      _performOCR(pickedFile);
    }
  }

  Future<void> _performOCR(PickedFile pickedFile) async {
    final inputImage = InputImage.fromFilePath(pickedFile.path);
    final textRecognizer = GoogleMlKit.vision.textRecognizer();

    try {
      final RecognizedText recognizedText =
          await textRecognizer.processImage(inputImage);

      setState(() {
        _text = recognizedText.text.isEmpty
            ? "متنی پیدا نشد."
            : recognizedText.text;
      });
    } catch (e) {
      setState(() {
        _text = "خطا در پردازش تصویر.";
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("تشخیص اسناد")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _pickImage,
                child: const Text("انتخاب تصویر از دوربین"),
              ),
              const SizedBox(height: 20),
              if (_image != null)
                Image.file(
                  _image!,
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              const SizedBox(height: 20),
              Text(
                _text,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
