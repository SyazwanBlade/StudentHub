import 'package:flutter/material.dart';

import '../models/student.dart';

class ProgrammePage extends StatelessWidget {
  const ProgrammePage({super.key});

  @override
  Widget build(BuildContext context) {
    // ===== PROGRAMME TABS =====
    // One tab per programme in `programmes` (see models/student.dart).
    return DefaultTabController(
      length: programmes.length,
      child: Column(
        children: [
          // ----- Tab bar -----
          TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: [for (final p in programmes) Tab(text: p)],
          ),

          // ----- Tab content -----
          // Each tab shows the students whose programme matches the tab.
          Expanded(
            child: TabBarView(
              children: [
                for (final p in programmes) _ProgrammeTab(programme: p),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Content of one tab: the students in a programme
// ---------------------------------------------------------------------------
class _ProgrammeTab extends StatelessWidget {
  const _ProgrammeTab({required this.programme});

  final String programme;

  @override
  Widget build(BuildContext context) {
    final students = sampleStudents
        .where((s) => s.programme == programme)
        .toList();

    if (students.isEmpty) {
      return const Center(child: Text('No students in this programme yet.'));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: students.length,
      itemBuilder: (context, i) {
        final s = students[i];
        final photo = s.photoAsset;
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: photo == null ? null : AssetImage(photo),
              child: photo == null ? Text(s.name[0]) : null,
            ),
            title: Text(s.name),
            subtitle: Text(
              s.role == null ? s.matric : '${s.matric} • ${s.role}',
            ),
            trailing: Icon(
              s.isActive ? Icons.check_circle : Icons.pause_circle,
              color: s.isActive ? Colors.green : Colors.grey,
            ),
          ),
        );
      },
    );
  }
}
