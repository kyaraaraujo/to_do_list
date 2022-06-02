import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:to_do_list/my_list.dart';

import '../helper/test_helper.dart';

void main() {
  final List<String> taskList = myList;

  testWidgets("Title is displayed", (WidgetTester tester) async {
    await tester.pumpWidget(TestHelper.createWidgetUnderTest());
    expect(find.text('My Task List'), findsOneWidget);
  });

  testWidgets("Tasks are displayed", (WidgetTester tester) async {
    TestHelper.setUpTaskList(taskList);

    await tester.pumpWidget(TestHelper.createWidgetUnderTest());
    await tester.pump();

    for (String item in taskList) {
      expect(find.text(item), findsOneWidget);
    }
  });

  testWidgets("Help button is displayed", (WidgetTester tester) async {
    await tester.pumpWidget(TestHelper.createWidgetUnderTest());
    await tester.pump();

    expect(find.byIcon(Icons.help), findsOneWidget);
  });
}
