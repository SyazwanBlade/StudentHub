
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:studenthub/models/student.dart';
import 'package:studenthub/pages/student_detail_page.dart';

void main() {
  const student = Student(
    name: 'Ali Tan',
    matricNo: '118998',
    programme: 'Software Engineering',
    email: 'ali.tan@unimas.my',
    cgpa: 3.90,
  );

  testWidgets('Student details are displayed correctly', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: StudentDetailPage(student: student),
      ),
    );

    expect(find.text('Student Details'), findsOneWidget);
    expect(find.text('Ali Tan'), findsOneWidget);
    expect(find.text('Matric Number'), findsOneWidget);
    expect(find.text('118998'), findsOneWidget);
    expect(find.text('Programme'), findsOneWidget);
    expect(find.text('Software Engineering'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('ali.tan@unimas.my'), findsOneWidget);
    expect(find.text('CGPA'), findsOneWidget);
    expect(find.text('3.90'), findsOneWidget);
  });

  testWidgets('Matric number and email use SelectableText', (
    tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: StudentDetailPage(student: student),
      ),
    );

    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is SelectableText && widget.data == '118998',
      ),
      findsOneWidget,
    );

    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is SelectableText &&
            widget.data == 'ali.tan@unimas.my',
      ),
      findsOneWidget,
    );
  });
}
