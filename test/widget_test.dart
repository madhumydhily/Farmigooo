import 'package:flutter_test/flutter_test.dart';
import 'package:farmigo/main.dart';
import 'package:farmigo/core/constants/app_strings.dart';

void main() {
  testWidgets('FarmigoApp renders login screen foundation', (WidgetTester tester) async {
    await tester.pumpWidget(const FarmigoApp());

    // Verify App title is rendered on login screen
    expect(find.text(AppStrings.appName), findsOneWidget);
    expect(find.text(AppStrings.loginButton), findsOneWidget);
  });
}
