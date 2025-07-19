import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// صفحات اصلی پروژه (فعلاً اسکلت‌بندی)
import 'pages/measurement_page.dart';
import 'pages/estimation_page.dart';
import 'pages/analysis_page.dart';
import 'pages/camera_measure_page.dart';
import 'pages/document_recognition_page.dart';
import 'pages/site_management_page.dart';
import 'pages/study_page.dart';

void main() {
  runApp(const MetreyarApp());
}

class MetreyarApp extends StatelessWidget {
  const MetreyarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Metreyar',
      theme: ThemeData(
        fontFamily: 'Vazirmatn',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: '/measurement',
  routes: [
    GoRoute(
      path: '/measurement',
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
      path: '/site-management',
      builder: (context, state) => const SiteManagementPage(),
    ),
    GoRoute(
      path: '/study',
      builder: (context, state) => const StudyPage(),
    ),
  ],
);
