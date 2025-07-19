import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isLargeScreen = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('متره‌یار'),
        centerTitle: true,
      ),
      drawer: isLargeScreen ? null : _buildDrawer(context),
      body: Row(
        children: [
          if (isLargeScreen) _buildDrawer(context),
          const Expanded(
            child: Center(
              child: Text(
                'به متره‌یار خوش آمدید!',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return NavigationDrawer(
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text('منو', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        _navItem(context, 'متره', '/quantity'),
        _navItem(context, 'برآورد', '/estimation'),
        _navItem(context, 'آنالیز', '/analysis'),
        _navItem(context, 'اندازه‌گیری با دوربین', '/camera'),
        _navItem(context, 'تشخیص اسناد', '/documents'),
        _navItem(context, 'مدیریت کارگاه', '/site'),
        _navItem(context, 'مطالعه', '/study'),
        _navItem(context, 'جستجو', '/search'),
      ],
    );
  }

  Widget _navItem(BuildContext context, String label, String route) {
    return ListTile(
      title: Text(label),
      onTap: () {
        GoRouter.of(context).go(route);
      },
    );
  }
}
