import 'package:flutter/material.dart';

class CameraMeasurePage extends StatelessWidget {
  const CameraMeasurePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('اندازه‌گیری با دوربین')),
      body: const Center(
        child: Text('در این صفحه قابلیت اندازه‌گیری با دوربین اضافه خواهد شد.'),
      ),
    );
  }
}
