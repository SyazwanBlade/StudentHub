
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:studenthub/pages/programme_page.dart';

void main() {
  testWidgets('Programme page displays three tabs', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ProgrammePage(),
      ),
    );

    // Check that the tab components exist
    expect(find.byType(DefaultTabController), findsOneWidget);
    expect(find.byType(TabBar), findsOneWidget);
    expect(find.byType(TabBarView), findsOneWidget);

    // Check that all three programme tabs are displayed
    final tabBar = tester.widget<TabBar>(find.byType(TabBar));

    expect(tabBar.tabs.length, 3);
    expect(
      (tabBar.tabs[0] as Tab).text,
      'Software Engineering',
    );
    expect(
      (tabBar.tabs[1] as Tab).text,
      'Entrepreneurship',
    );
    expect(
      (tabBar.tabs[2] as Tab).text,
      'Sport Science',
    );
  });

  testWidgets('Programme tabs can be selected', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ProgrammePage(),
      ),
    );

    // Check the default selected tab
    expect(
      DefaultTabController.of(
        tester.element(find.byType(TabBar)),
      ).index,
      0,
    );

    // Select Entrepreneurship tab
    await tester.tap(find.text('Entrepreneurship').first);
    await tester.pumpAndSettle();

    expect(
      DefaultTabController.of(
        tester.element(find.byType(TabBar)),
      ).index,
      1,
    );

    // Select Sport Science tab
    await tester.tap(find.text('Sport Science').first);
    await tester.pumpAndSettle();

    expect(
      DefaultTabController.of(
        tester.element(find.byType(TabBar)),
      ).index,
      2,
    );

    // Select Software Engineering tab
    await tester.tap(find.text('Software Engineering').first);
    await tester.pumpAndSettle();

    expect(
      DefaultTabController.of(
        tester.element(find.byType(TabBar)),
      ).index,
      0,
    );
  });
}
