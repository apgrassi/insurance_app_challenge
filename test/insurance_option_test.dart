import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:insurance_app_challenge/modules/home/presentation/widgets/insurance_option.dart';

void main() {
  testWidgets('deve exibir o título da opção de seguro', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: InsuranceOption(
            icon: Icons.directions_car,
            title: 'Automóvel',
          ),
        ),
      ),
    );

    expect(find.text('Automóvel'), findsOneWidget);
  });
}
