import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/about_page.dart';
import 'pages/home_page.dart';
import 'pages/programme_page.dart';
import 'pages/records_page.dart';
import 'pages/splash_page.dart';
import 'pages/student_list_page.dart';
import 'state/app_state.dart';
import 'widgets/app_drawer.dart';
import 'widgets/bottom_nav.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppState(),
      child: const StudentHubApp(),
    ),
  );
}

/// Supports mouse and trackpad dragging on desktop and web.
class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}

class StudentHubApp extends StatelessWidget {
  const StudentHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StudentHub',
      debugShowCheckedModeBanner: false,
      scrollBehavior: AppScrollBehavior(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        ),
        useMaterial3: true,
      ),
      home: const SplashPage(
        next: MainShell(),
      ),
    );
  }
}

/// Navigation destination titles.
/// Their order must match the page and navigation destination order.
const List<String> _titles = [
  'Home',
  'Student Information',
  'Student Records',
  'Programmes',
  'About',
];

class MainShell extends StatelessWidget {
  const MainShell({super.key});

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.select<AppState, int>(
      (state) => state.currentIndex,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[currentIndex]),
      ),
      drawer: const AppDrawer(),
      body: IndexedStack(
        index: currentIndex,
        children: const [
          HomePage(),
          StudentListPage(),
          RecordsPage(),
          ProgrammePage(),
          AboutPage(),
        ],
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
