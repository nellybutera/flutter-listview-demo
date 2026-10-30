import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:listview_demo/main.dart';

void main() {
  testWidgets('Home screen lists all demos', (tester) async {
    await tester.pumpWidget(const ListViewDemoApp());

    expect(find.text('1. Basic ListView'), findsOneWidget);
    expect(find.text('5. Dynamic list (Stateful)'), findsOneWidget);
  });

  testWidgets('Builder list only builds visible items', (tester) async {
    await tester.pumpWidget(const ListViewDemoApp());
    await tester.tap(find.text('2. ListView.builder'));
    await tester.pumpAndSettle();

    expect(find.text('Item 1'), findsOneWidget);
    // Item 1000 exists in the data but has not been built yet.
    expect(find.text('Item 1000'), findsNothing);
  });

  testWidgets('Adding a task updates the list', (tester) async {
    await tester.pumpWidget(const ListViewDemoApp());
    await tester.tap(find.text('5. Dynamic list (Stateful)'));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), 'Buy milk');
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('Buy milk'), findsOneWidget);
    expect(find.text('Tasks (4)'), findsOneWidget);
  });
}
