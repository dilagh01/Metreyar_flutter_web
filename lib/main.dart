import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// صفحات پروژه
import 'pages/search_page.dart';
import 'pages/measurement_page.dart';
import 'pages/estimation_page.dart';
import 'pages/analysis_page.dart';
import 'pages/camera_measure_page.dart';
import 'pages/document_recognition_page.dart';
import 'pages/site_management_page.dart';
import 'pages/study_page.dart';
import 'pages/home_page.dart'; // در صورت نیاز به صفحه خانه جداگانه

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final _router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const SearchPage(), // صفحه اصلی
        ),
        GoRoute(
          path: '/measure',
          builder: (context, state) => const MeasurementPage(),
        ),
        GoRoute(
          path: '/estimation',
          builder: (context, state) => const EstimationPage(),
        ),
        GoRoute(
          path: '/analysis',
          builder: (context, state) => const AnalysisPage(),
        ),
        GoRoute(
          path: '/camera',
          builder: (context, state) => const CameraMeasurePage(),
        ),
        GoRoute(
          path: '/documents',
          builder: (context, state) => const DocumentRecognitionPage(),
        ),
        GoRoute(
          path: '/site',
          builder: (context, state) => const SiteManagementPage(),
        ),
        GoRoute(
          path: '/study',
          builder: (context, state) => const StudyPage(),
        ),
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomePage(),
        ),
      ],
    );

    return MaterialApp.router(
      title: 'Metreyar Web',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Vazirmatn',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}
