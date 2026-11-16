import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/app_state.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  void _go(BuildContext context, AppSection section) {
    context.read<AppState>().select(section);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    // Rebuilds only when the selected section changes.
    final current = context.select<AppState, AppSection>((s) => s.section);

    ListTile item(IconData icon, String title, AppSection section) {
      return ListTile(
        leading: Icon(icon),
        title: Text(title),
        selected: current == section,
        onTap: () => _go(context, section),
      );
    }

    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Text('StudentHub', style: TextStyle(fontSize: 24)),
          ),
          item(Icons.home, 'Home', AppSection.home),
          item(Icons.people, 'Student List', AppSection.students),
          item(Icons.table_chart, 'Student Records', AppSection.records),
          item(Icons.school, 'Programmes', AppSection.programmes),
          item(Icons.info, 'About', AppSection.about),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // Get the messenger before closing the drawer, so we don't use
              // the drawer's context after it has been removed.
              final messenger = ScaffoldMessenger.of(context);
              Navigator.pop(context);
              messenger.showSnackBar(
                const SnackBar(content: Text('Settings coming soon')),
              );
            },
          ),
        ],
      ),
    );
  }
}
