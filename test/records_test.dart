
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:studenthub/pages/records_page.dart';

void main() {
  testWidgets('Student records display correctly', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: RecordsPage(),
      ),
    );

    expect(find.byType(DataTable), findsOneWidget);

    final table = tester.widget<DataTable>(
      find.byType(DataTable),
    );

    expect(table.columns.length, 5);
    expect(table.rows.length, 10);

    expect(find.text('ID'), findsOneWidget);
    expect(find.text('Name'), findsOneWidget);
    expect(find.text('Department'), findsOneWidget);
    expect(find.text('Age'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
  });

  testWidgets('Student records can be sorted by name', (tester) async {

    await tester.pumpWidget(
      const MaterialApp(
        home: RecordsPage(),
      ),
    );

    await tester.tap(find.text('Name'));
    await tester.pumpAndSettle();

    var table = tester.widget<DataTable>(
      find.byType(DataTable),
    );

    expect(table.sortColumnIndex, 1);
    expect(table.sortAscending, true);

    var firstRow = table.rows.first;
    expect(
      (firstRow.cells[1].child as Text).data,
      'Adib',
    );

    await tester.tap(find.text('Name'));
    await tester.pumpAndSettle();

    table = tester.widget<DataTable>(
      find.byType(DataTable),
    );

    expect(table.sortColumnIndex, 1);
    expect(table.sortAscending, false);

    firstRow = table.rows.first;
    expect(
      (firstRow.cells[1].child as Text).data,
      'Syazwan',
    );
  });
}
