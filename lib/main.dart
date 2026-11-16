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

/// Lets mouse and trackpad drag lists sideways (Flutter web/desktop ignores
/// mouse drags by default).
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      // Welcome screen first, then the main shell.
      home: const SplashPage(next: MainShell()),
    );
  }
}

/// AppBar title for each section. The exhaustive switch makes the compiler
/// flag a missing title when a new [AppSection] is added.
String _titleFor(AppSection section) => switch (section) {
  AppSection.home => 'Home',
  AppSection.students => 'Student Information',
  AppSection.records => 'Student Records',
  AppSection.programmes => 'Programmes',
  AppSection.about => 'About',
};

class MainShell extends StatelessWidget {
  const MainShell({super.key});

  @override
  Widget build(BuildContext context) {
    // Rebuilds only when the selected section changes.
    final section = context.select<AppState, AppSection>((s) => s.section);
    return Scaffold(
      appBar: AppBar(title: Text(_titleFor(section))),
      drawer: const AppDrawer(),
      // Children must follow the AppSection order.
      body: IndexedStack(
        index: section.index,
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
