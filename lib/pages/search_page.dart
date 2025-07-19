import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();
  List<String> allItems = [
    'متره پی‌ریزی',
    'برآورد دیوارچینی',
    'تحلیل مصالح',
    'اندازه‌گیری سقف',
    'تشخیص اسناد پروژه',
    'مدیریت مصالح',
    'مطالعه ضوابط آیین‌نامه‌ای',
    'هزینه‌گذاری نقاشی',
    'برآورد تاسیسات',
  ];

  List<String> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = allItems;
    _controller.addListener(_filterResults);
  }

  void _filterResults() {
    final query = _controller.text.toLowerCase();
    setState(() {
      filteredItems = allItems
          .where((item) => item.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('جستجو')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'جستجو...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: filteredItems.isEmpty
                  ? const Center(child: Text('نتیجه‌ای یافت نشد.'))
                  : ListView.separated(
                      itemCount: filteredItems.length,
                      separatorBuilder: (_, __) => const Divider(),
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(filteredItems[index]),
                          leading: const Icon(Icons.article_outlined),
                          onTap: () {
                            // TODO: Implement navigation to selected item
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
