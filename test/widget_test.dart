import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:studenthub/main.dart';
import 'package:studenthub/state/app_state.dart';

void main() {
  testWidgets('app starts on Home and bottom nav switches pages', (
    tester,
  ) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => AppState(),
        child: const StudentHubApp(),
      ),
    );

    // Welcome screen first, then the main app after the delay.
    expect(find.text('Please wait...'), findsOneWidget);
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();

    final context = tester.element(find.byType(NavigationBar));
    expect(context.read<AppState>().currentIndex, 0);

    await tester.tap(
      find.descendant(
        of: find.byType(NavigationBar),
        matching: find.text('About'),
      ),
    );
    await tester.pump();
    expect(context.read<AppState>().currentIndex, 4);
  });

  test('AppState notifies only when index changes', () {
    final state = AppState();
    var count = 0;
    state.addListener(() => count++);

    state.setIndex(0);
    expect(count, 0);
    state.setIndex(2);
    expect(state.currentIndex, 2);
    expect(count, 1);
  });

  test('AppState rejects an out-of-range index', () {
    final state = AppState();
    expect(() => state.setIndex(-1), throwsRangeError);
    expect(() => state.setIndex(AppSection.values.length), throwsRangeError);
    expect(state.section, AppSection.home);
  });

  testWidgets('drawer and bottom nav stay in sync', (tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => AppState(),
        child: const StudentHubApp(),
      ),
    );
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();

    // Open the drawer and pick Student Records.
    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Student Records').last);
    await tester.pumpAndSettle();

    final nav = tester.widget<NavigationBar>(find.byType(NavigationBar));
    expect(nav.selectedIndex, AppSection.records.index);
  });
}
