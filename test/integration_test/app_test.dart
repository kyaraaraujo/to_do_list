import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:to_do_list/my_list.dart';

import '../helper/test_helper.dart';

void main() {
  final List<String> taskList = myList;

  testWidgets("A task is deleted", (WidgetTester tester) async {
    TestHelper.setUpTaskList(taskList);

    await tester.pumpWidget(TestHelper.createWidgetUnderTest());
    await tester.pump();

    await tester.longPress(find.text('Task 2'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Yes'));
    await tester.pumpAndSettle();

    expect(find.text('Task 1'), findsOneWidget);
    expect(find.text('Task 2'), findsNothing);
  });

  testWidgets("A task is not deleted.", (WidgetTester tester) async {
    TestHelper.setUpTaskList(taskList);

    await tester.pumpWidget(TestHelper.createWidgetUnderTest());
    await tester.pump();

    await tester.longPress(find.text('Task 1'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('No'));
    await tester.pumpAndSettle();

    expect(find.text('Task 1'), findsOneWidget);
  });

    testWidgets("Help button shows information.", (WidgetTester tester) async {
    await tester.pumpWidget(TestHelper.createWidgetUnderTest());
    await tester.pump();

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    expect(find.text('Ok'), findsOneWidget);
  });
}
