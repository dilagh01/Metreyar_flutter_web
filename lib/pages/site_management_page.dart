import 'package:flutter/material.dart';

class SiteManagementPage extends StatelessWidget {
  const SiteManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('مدیریت کارگاه و مصالح')),
      body: const Center(
        child: Text('در این صفحه مدیریت کارگاه، موجودی مصالح و عملیات ثبت خواهد شد.'),
      ),
    );
  }
}
