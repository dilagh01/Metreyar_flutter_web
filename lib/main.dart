import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Metreyar Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Vazirmatn', // اگر فونت فارسی Vazirmatn اضافه کردی
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  Future<List<String>> fetchItems() async {
    // شبیه‌سازی دریافت داده بعد از یک ثانیه
    return Future.delayed(const Duration(seconds: 1), () => ['آیتم اول', 'آیتم دوم']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تست لود لیست')),
      body: FutureBuilder<List<String>>(
        future: fetchItems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('خطا در دریافت اطلاعات: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('موردی برای نمایش وجود ندارد.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(snapshot.data![index]),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
