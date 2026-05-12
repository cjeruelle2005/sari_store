import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sari_store/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Full login flow', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    // Should see splash, then login because no session (first run)
    expect(find.text('Sign in to continue'), findsOneWidget);

    await tester.enterText(find.byType(TextFormField).at(0), 'owner');
    await tester.enterText(find.byType(TextFormField).at(1), 'admin123');
    await tester.tap(find.text('Sign In'));
    await tester.pumpAndSettle();

    // Now should be on dashboard
    expect(find.text('Dashboard'), findsWidgets); // AppBar title
  });
}