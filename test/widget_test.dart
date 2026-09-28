// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:movie_watchlist_app/main.dart';

void main() {
  testWidgets('shows the movie catalog', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Movie Watchlist'), findsOneWidget);
    expect(find.text('Nerve'), findsOneWidget);
    expect(find.text('Lucy'), findsOneWidget);

    await tester.scrollUntilVisible(
      find.text('Belly'),
      250,
      scrollable: find.byType(Scrollable),
    );
    expect(find.text('Belly'), findsOneWidget);
  });

  testWidgets('opens the selected movie and returns home', (tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Nerve'));
    await tester.pumpAndSettle();

    expect(find.text('Cast'), findsOneWidget);
    expect(find.textContaining('Emma Roberts'), findsOneWidget);
    expect(find.textContaining('A high school senior'), findsOneWidget);

    await tester.pageBack();
    await tester.pumpAndSettle();
    expect(find.text('Movie Watchlist'), findsOneWidget);
  });
}
