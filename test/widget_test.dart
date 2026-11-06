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

    expect(find.text('Home Page'), findsOneWidget);

    await tester.tap(find.text('About'));
    await tester.pump();
    expect(find.text('About Page'), findsOneWidget);
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
}
