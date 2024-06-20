import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loginchat/login_page.dart';

void main() {
  testWidgets('LoginPage renders correctly', (WidgetTester tester) async {
    // Build the LoginPage widget and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: LoginPage()));

    // Verify that the email and password TextFields are present.
    expect(find.byType(TextField), findsNWidgets(2));

    // Verify that the login button is present.
    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  testWidgets('Email and password text fields input', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginPage()));

    // Find the email and password TextFields using their respective Key
    final emailField = find.byKey(Key('email'));
    final passwordField = find.byKey(Key('password'));

    // Enter text into the email and password TextFields
    await tester.enterText(emailField, 'testuser@example.com');
    await tester.enterText(passwordField, 'password');

    // Verify that the text was entered correctly
    expect(find.text('testuser@example.com'), findsOneWidget);
    expect(find.text('password'), findsOneWidget);
  });
}
