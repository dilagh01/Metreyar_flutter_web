import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  String _query = '';

  final List<_SearchItem> items = [
    _SearchItem(title: 'خانه', route: '/', icon: Icons.home), // صفحه خانه
    _SearchItem(title: 'متره', route: '/measure', icon: Icons.list_alt),
    _SearchItem(title: 'برآورد', route: '/estimation', icon: Icons.calculate),
    _SearchItem(title: 'تحلیل', route: '/analysis', icon: Icons.analytics),
    _SearchItem(title: 'اندازه‌گیری با دوربین', route: '/camera', icon: Icons.camera_alt),
    _SearchItem(title: 'تشخیص اسناد پروژه', route: '/documents', icon: Icons.description),
    _SearchItem(title: 'مدیریت کارگاه', route: '/site', icon: Icons.business),
    _SearchItem(title: 'مطالعه', route: '/study', icon: Icons.menu_book),
  ];

  List<_SearchItem> get _filteredItems {
    if (_query.isEmpty) return items;
    return items
        .where((item) => item.title.contains(_query) || item.title.startsWith(_query))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('جستجو')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              onChanged: (val) => setState(() => _query = val.trim()),
              decoration: const InputDecoration(
                hintText: 'جستجو...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredItems.length,
                itemBuilder: (context, index) {
                  final item = _filteredItems[index];
                  return ListTile(
                    leading: Icon(item.icon),
                    title: Text(item.title),
                    onTap: () => context.go(item.route),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchItem {
  final String title;
  final String route;
  final IconData icon;

  const _SearchItem({
    required this.title,
    required this.route,
    required this.icon,
  });
}
