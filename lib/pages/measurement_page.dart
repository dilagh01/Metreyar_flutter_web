import 'package:flutter/material.dart';

class MeasurementPage extends StatelessWidget {
  const MeasurementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('صفحه متره'),
      ),
      body: const Center(
        child: Text(
          'اینجا ابزارهای مربوط به متره‌گذاری قرار می‌گیرد.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
