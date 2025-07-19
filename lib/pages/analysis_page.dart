import 'package:flutter/material.dart';

class AnalysisPage extends StatelessWidget {
  const AnalysisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('صفحه آنالیز')),
      body: const Center(
        child: Text('اینجا صفحه آنالیز اطلاعات متره است'),
      ),
    );
  }
}
