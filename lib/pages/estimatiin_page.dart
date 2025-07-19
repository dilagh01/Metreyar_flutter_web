import 'package:flutter/material.dart';

class EstimationPage extends StatelessWidget {
  const EstimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('صفحه برآورد'),
      ),
      body: const Center(
        child: Text(
          'در این صفحه می‌توان برآورد هزینه و مصالح را انجام داد.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
