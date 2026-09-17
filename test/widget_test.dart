import 'package:flutter_test/flutter_test.dart';
import 'package:insurance_app_challenge/app.dart';

void main() {
  testWidgets('should render Insurance App', (WidgetTester tester) async {
    await tester.pumpWidget(const InsuranceApp());

    expect(find.text('Insurance App'), findsOneWidget);
  });
}
