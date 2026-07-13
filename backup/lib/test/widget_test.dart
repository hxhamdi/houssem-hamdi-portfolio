// This is a basic Flutter widget test for the portfolio website.

import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_website/app.dart';

void main() {
  testWidgets('Portfolio app loads and displays navigation bar',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const PortfolioApp());

    // Verify that the navigation bar is displayed
    expect(find.text('EMH'), findsOneWidget); // Initials from name

    // Verify navigation items are present
    expect(find.text('Accueil'), findsOneWidget);
    expect(find.text('Projets'), findsOneWidget);
    expect(find.text('Expérience'), findsOneWidget);
    expect(find.text('Contact'), findsOneWidget);
  });

  testWidgets('Navigation works correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const PortfolioApp());

    // Tap on Projets and verify navigation
    await tester.tap(find.text('Projets'));
    await tester.pumpAndSettle();
    expect(find.text('PROJETS'), findsOneWidget);

    // Tap on Expérience and verify navigation
    await tester.tap(find.text('Expérience'));
    await tester.pumpAndSettle();
    expect(find.text('EXPÉRIENCE'), findsOneWidget);

    // Tap on Contact and verify navigation
    await tester.tap(find.text('Contact'));
    await tester.pumpAndSettle();
    expect(find.text('CONTACT'), findsOneWidget);

    // Tap on logo to return to home
    await tester.tap(find.text('EMH'));
    await tester.pumpAndSettle();
    // Verify we're back on home page
    expect(find.text('À PROPOS'), findsOneWidget);
  });
}
