import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/student.dart';
import '../state/app_state.dart';

/// One card in the "Meet Our Students" carousel.
class _CarouselPerson {
  const _CarouselPerson({
    required this.name,
    required this.matric,
    required this.subtitle,
    required this.photoAsset,
  });

  final String name;
  final String matric;
  final String subtitle;
  final String photoAsset;
}

/// Our group members, shown first in the carousel with their photos.
const _team = [
  _CarouselPerson(
    name: 'Syazwan Bin Salleh',
    matric: '102208',
    subtitle: 'Project Manager',
    photoAsset: 'assets/images/syazwan.jpg',
  ),
  _CarouselPerson(
    name: 'Ahmad Fakhrurizzudin Bin Ahmad Fairuz',
    matric: '103118',
    subtitle: 'Requirements',
    photoAsset: 'assets/images/ahmad.jpg',
  ),
  _CarouselPerson(
    name: 'Samson Riger Anak Samuel Kruger',
    matric: '106222',
    subtitle: 'Flutter Architect',
    photoAsset: 'assets/images/samson.jpg',
  ),
  _CarouselPerson(
    name: 'Adib Aziman Bin Hossen',
    matric: '97930',
    subtitle: 'Backend & AI Integration',
    photoAsset: 'assets/images/adib.jpg',
  ),
  _CarouselPerson(
    name: 'Izz Fariq Hazim Dahlan',
    matric: '99207',
    subtitle: 'QA & CI/CD',
    photoAsset: 'assets/images/izz.jpg',
  ),
];

/// Irasutoya illustrations used for the "Unknown" cards.
const _unknownPhotos = [
  'assets/images/unknown1.jpg',
  'assets/images/unknown2.jpg',
  'assets/images/unknown3.jpg',
  'assets/images/unknown4.jpg',
  'assets/images/unknown5.jpg',
  'assets/images/unknown6.jpg',
  'assets/images/unknown7.jpg',
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ===== HEADER BANNER =====
          // Gradient banner with school icon, app name and welcome message.
          const _HeaderBanner(),

          // ===== SUMMARY CARDS =====
          // Total students / programmes / average CGPA (from sampleStudents).
          const Padding(padding: EdgeInsets.all(16), child: _SummaryCards()),

          // ===== MEET OUR STUDENTS CAROUSEL =====
          // Horizontal list that scrolls right, one card per person with photo.
          const _SectionTitle('Meet Our Students'),
          const _StudentCarousel(),

          // ===== QUICK ACTIONS =====
          // Buttons that jump to other tabs through AppState.setIndex.
          const _SectionTitle('Quick Actions'),
          const _QuickActions(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Header banner
// ---------------------------------------------------------------------------
class _HeaderBanner extends StatelessWidget {
  const _HeaderBanner();

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [scheme.primary, scheme.tertiary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(28)),
      ),
      child: Column(
        children: [
          Icon(Icons.school, size: 72, color: scheme.onPrimary),
          const SizedBox(height: 12),
          Text(
            'StudentHub',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: scheme.onPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Welcome! Manage student information, records and programmes in one place.',
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: scheme.onPrimary),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Summary cards
// ---------------------------------------------------------------------------
class _SummaryCards extends StatelessWidget {
  const _SummaryCards();

  @override
  Widget build(BuildContext context) {
    final total = sampleStudents.length;
    final programmeCount = sampleStudents
        .map((s) => s.programme)
        .toSet()
        .length;
    final avgCgpa = total == 0
        ? 0.0
        : sampleStudents.map((s) => s.cgpa).reduce((a, b) => a + b) / total;
    return Row(
      children: [
        Expanded(
          child: _SummaryCard(
            icon: Icons.people,
            label: 'Students',
            value: '$total',
          ),
        ),
        Expanded(
          child: _SummaryCard(
            icon: Icons.school,
            label: 'Programmes',
            value: '$programmeCount',
          ),
        ),
        Expanded(
          child: _SummaryCard(
            icon: Icons.star,
            label: 'Avg CGPA',
            value: avgCgpa.toStringAsFixed(2),
          ),
        ),
      ],
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            Icon(icon, color: theme.colorScheme.primary),
            const SizedBox(height: 8),
            Text(
              value,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(label, style: theme.textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Section title
// ---------------------------------------------------------------------------
class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Text(
        text,
        style: Theme.of(
          context,
        ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Student carousel (scrolls right)
// ---------------------------------------------------------------------------
class _StudentCarousel extends StatelessWidget {
  const _StudentCarousel();

  @override
  Widget build(BuildContext context) {
    // Group members first, then one "Unknown" card per sample student,
    // each with an Irasutoya illustration.
    final cards = [
      ..._team,
      for (var i = 0; i < sampleStudents.length; i++)
        _CarouselPerson(
          name: 'Unknown',
          matric: '-',
          subtitle: '-',
          photoAsset: _unknownPhotos[i % _unknownPhotos.length],
        ),
    ];
    return SizedBox(
      height: 230,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: cards.length,
        separatorBuilder: (_, _) => const SizedBox(width: 12),
        itemBuilder: (context, i) => _StudentCard(person: cards[i]),
      ),
    );
  }
}

class _StudentCard extends StatelessWidget {
  const _StudentCard({required this.person});

  final _CarouselPerson person;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: 160,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${person.name} (${person.matric})')),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(person.photoAsset),
                ),
                const SizedBox(height: 10),
                Text(
                  person.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(person.matric, style: theme.textTheme.bodyMedium),
                Text(
                  person.subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Quick actions
// ---------------------------------------------------------------------------
class _QuickActions extends StatelessWidget {
  const _QuickActions();

  @override
  Widget build(BuildContext context) {
    final appState = context.read<AppState>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: FilledButton.icon(
              onPressed: () => appState.setIndex(1),
              icon: const Icon(Icons.people),
              label: const Text('Student Info'),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: FilledButton.tonalIcon(
              onPressed: () => appState.setIndex(2),
              icon: const Icon(Icons.table_chart),
              label: const Text('Records'),
            ),
          ),
        ],
      ),
    );
  }
}
