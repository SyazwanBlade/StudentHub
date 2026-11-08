import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/student.dart';
import '../state/app_state.dart';

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
          // Total students / programmes / active students (from sampleStudents).
          const Padding(padding: EdgeInsets.all(16), child: _SummaryCards()),

          // ===== MEET OUR STUDENTS CAROUSEL =====
          // Horizontal list that scrolls right, one card per student with photo.
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
    final active = sampleStudents.where((s) => s.isActive).length;
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
            value: '${programmes.length}',
          ),
        ),
        Expanded(
          child: _SummaryCard(
            icon: Icons.check_circle,
            label: 'Active',
            value: '$active',
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
    // Only students that have a photo are shown here.
    final featured = sampleStudents.where((s) => s.photoAsset != null).toList();
    // Blank card at the end: stands for the remaining students without photos.
    final others = sampleStudents.length - featured.length;
    final cards = [
      ...featured,
      Student(
        name: 'Unknown',
        matric: '-',
        programme: '+$others other students',
      ),
    ];
    return SizedBox(
      height: 230,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: cards.length,
        separatorBuilder: (_, _) => const SizedBox(width: 12),
        itemBuilder: (context, i) => _StudentCard(student: cards[i]),
      ),
    );
  }
}

class _StudentCard extends StatelessWidget {
  const _StudentCard({required this.student});

  final Student student;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final photo = student.photoAsset;
    return SizedBox(
      width: 160,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${student.name} (${student.matric})')),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: photo == null ? null : AssetImage(photo),
                  child: photo == null
                      ? const Icon(Icons.person, size: 40)
                      : null,
                ),
                const SizedBox(height: 10),
                Text(
                  student.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(student.matric, style: theme.textTheme.bodyMedium),
                Text(
                  student.programme,
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
