import 'package:flutter/material.dart';
import 'package:to_do_list/home_page.dart';

class TestHelper {
  static void setUpTaskList(List<String> tasks) {
    if (tasks.isNotEmpty) tasks.clear();

    tasks.addAll(["Task 1", "Task 2"]);
  }

  static Widget createWidgetUnderTest() {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const HomePage(title: 'myList'),
    );
  }
}
