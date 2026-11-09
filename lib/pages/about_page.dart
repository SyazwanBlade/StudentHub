import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
        children: [
          Semantics(
            label: 'StudentHub profile header',
            child: SizedBox(
              height: 230,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 155,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      gradient: LinearGradient(
                        colors: [colors.primary, colors.secondary],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.school_rounded,
                          color: colors.onPrimary,
                          size: 32,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'StudentHub',
                          style: theme.textTheme.headlineSmall?.copyWith(
                            color: colors.onPrimary,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          'Your student portal companion',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: colors.onPrimary.withValues(alpha: .85),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 24,
                    bottom: 0,
                    child: CircleAvatar(
                      radius: 49,
                      backgroundColor: colors.surface,
                      child: CircleAvatar(
                        radius: 43,
                        backgroundColor: colors.primaryContainer,
                        child: Icon(
                          Icons.person_rounded,
                          size: 50,
                          color: colors.onPrimaryContainer,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 140,
                    right: 8,
                    bottom: 18,
                    child: Text(
                      'About Page',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          _InfoCard(
            icon: Icons.info_outline_rounded,
            title: 'About StudentHub',
            child: Text(
              'StudentHub is a simple student management application that '
              'brings student information, records and academic programmes '
              'together in one place.',
              style: theme.textTheme.bodyLarge,
            ),
          ),
          const SizedBox(height: 16),
          _InfoCard(
            icon: Icons.groups_rounded,
            title: 'Developed for TMA3084',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Software Engineering Laboratory',
                  style: theme.textTheme.bodyLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  'Profile page by Adib Aziman',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _InfoCard(
            icon: Icons.auto_awesome_rounded,
            title: 'Built with Flutter',
            child: Text(
              'Material 3 components and shared Provider state keep the '
              'application responsive and consistent across its pages.',
              style: theme.textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.icon,
    required this.title,
    required this.child,
  });

  final IconData icon;
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: colors.primary, semanticLabel: ''),
            const SizedBox(height: 12),
            Text(
              title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            child,
          ],
        ),
      ),
    );
  }
}
