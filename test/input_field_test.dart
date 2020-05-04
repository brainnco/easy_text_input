import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:easy_text_input/easy_text_input.dart';

Widget _buildTestableWidget({Widget child}) {
  return MaterialApp(
    home: Scaffold(
      body: child,
    ),
  );
}

void main() {
  testWidgets('shows input field', (WidgetTester tester) async {
    await tester.pumpWidget(
      _buildTestableWidget(
        child: InputField(
          stream: null,
          onChanged: null,
          labelText: 'anything',
        ),
      ),
    );

    await tester.pump();

    expect(find.byType(InputField), findsOneWidget);
    expect(find.text('anything'), findsOneWidget);
  });
}
