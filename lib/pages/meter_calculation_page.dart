import 'package:flutter/material.dart';

class MeterCalculationPage extends StatefulWidget {
  const MeterCalculationPage({super.key});

  @override
  State<MeterCalculationPage> createState() => _MeterCalculationPageState();
}

class _MeterCalculationPageState extends State<MeterCalculationPage> {
  final _lengthController = TextEditingController();
  final _widthController = TextEditingController();
  final _heightController = TextEditingController();

  double? area;
  double? volume;

  void _calculate() {
    final length = double.tryParse(_lengthController.text) ?? 0;
    final width = double.tryParse(_widthController.text) ?? 0;
    final height = double.tryParse(_heightController.text) ?? 0;

    setState(() {
      area = length * width;
      volume = area! * height;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("فرم محاسبات متره")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _lengthController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'طول (متر)'),
            ),
            TextField(
              controller: _widthController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'عرض (متر)'),
            ),
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'ارتفاع (متر)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculate,
              child: const Text('محاسبه'),
            ),
            const SizedBox(height: 20),
            if (area != null && volume != null)
              Column(
                children: [
                  Text('مساحت: ${area!.toStringAsFixed(2)} متر مربع'),
                  Text('حجم: ${volume!.toStringAsFixed(2)} متر مکعب'),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
