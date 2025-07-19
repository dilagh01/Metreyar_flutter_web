import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('جستجو')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'جستجو...',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),

          ListTile(
            leading: const Icon(Icons.list_alt),
            title: const Text('متره'),
            onTap: () => context.go('/measure'),
          ),
          ListTile(
            leading: const Icon(Icons.calculate),
            title: const Text('برآورد'),
            onTap: () => context.go('/estimation'),
          ),
          ListTile(
            leading: const Icon(Icons.analytics),
            title: const Text('تحلیل'),
            onTap: () => context.go('/analysis'),
          ),
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('اندازه‌گیری با دوربین'),
            onTap: () => context.go('/camera'),
          ),
          ListTile(
            leading: const Icon(Icons.description),
            title: const Text('تشخیص اسناد پروژه'),
            onTap: () => context.go('/documents'),
          ),
          ListTile(
            leading: const Icon(Icons.business),
            title: const Text('مدیریت کارگاه'),
            onTap: () => context.go('/site'),
          ),
          ListTile(
            leading: const Icon(Icons.menu_book),
            title: const Text('مطالعه'),
            onTap: () => context.go('/study'),
          ),
        ],
      ),
    );
  }
}
