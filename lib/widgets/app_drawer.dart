import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/app_state.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  void _navigate(BuildContext context, int index) {
    context.read<AppState>().setIndex(index);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.select<AppState, int>(
      (state) => state.currentIndex,
    );

    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Text(
              'StudentHub',
              style: TextStyle(fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            selected: currentIndex == 0,
            onTap: () => _navigate(context, 0),
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('Student List'),
            selected: currentIndex == 1,
            onTap: () => _navigate(context, 1),
          ),
          ListTile(
            leading: const Icon(Icons.table_chart),
            title: const Text('Student Records'),
            selected: currentIndex == 2,
            onTap: () => _navigate(context, 2),
          ),
          ListTile(
            leading: const Icon(Icons.school),
            title: const Text('Programmes'),
            selected: currentIndex == 3,
            onTap: () => _navigate(context, 3),
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            selected: currentIndex == 4,
            onTap: () => _navigate(context, 4),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Settings coming soon'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
