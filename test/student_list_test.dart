
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:studenthub/pages/student_list_page.dart';

void main() {
  testWidgets('Student list displays student names', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: StudentListPage(),
      ),
    );

    expect(find.text('Students'), findsOneWidget);
    expect(find.text('Ali Tan'), findsOneWidget);
    expect(find.text('Sara Lee'), findsOneWidget);
    expect(find.text('John Lim'), findsOneWidget);
  });

  testWidgets('Selecting a student opens student details', (
    tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: StudentListPage(),
      ),
    );

    await tester.tap(find.text('Ali Tan'));
    await tester.pumpAndSettle();

    expect(find.text('Student Details'), findsOneWidget);
    expect(find.text('Ali Tan'), findsOneWidget);
    expect(find.text('118998'), findsOneWidget);
    expect(find.text('ali.tan@unimas.my'), findsOneWidget);
  });
}
