import 'package:flutter/material.dart';
import 'package:to_do_list/show_alert_dialog.dart';

import 'my_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Task List')),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            Expanded(
              child: TextField(controller: controller),
            ),
            IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  final textInput = controller.text.trim();
                  setState(() {
                    if (textInput.isNotEmpty) {
                      myList.add(textInput);
                    }
                  });
                  controller.clear();
                })
          ]),
        ),
        Expanded(
            child: ListView.builder(
                itemCount: myList.length,
                itemBuilder: (context, index) {
                  final item = myList[index];

                  return ListTile(
                      title: Text(item),
                      onLongPress: () async {
                        final action = await ShowAlertDialog.dialogOptions(
                            context,
                            'Delete Action',
                            'Do you want to remove it?',
                            'Yes',
                            'No');
                        if (action == DialogOptionsEnum.confirm) {
                          setState(() => myList.remove(item));
                        }
                      });
                })),
      ]),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () async {
          await ShowAlertDialog.dialogOptions(context, 'Help',
              'Long press in the task to remove it.', 'Ok', '');
        },
        child: const Icon(Icons.help),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
