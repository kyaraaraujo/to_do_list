import 'package:flutter/material.dart';

import 'src/list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();

  // final myList = <String>[];

  int index = 0;

  Future<void> _deleteDialog(index) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Do you want to remove it?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  removeFromList(index);
                });
              },
            ),
            TextButton(
                child: const Text('No'),
                onPressed: () {
                  Navigator.of(context).pop();
                })
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Task List'),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(controller: controller),
              ),
              IconButton(
                  onPressed: () {
                    final textInput = controller.text.trim();
                    setState(() {
                      if (textInput.isNotEmpty) {
                        addToList(textInput);
                      }
                    });
                    controller.clear();
                  },
                  icon: const Icon(Icons.add))
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: myList().length,
            itemBuilder: (context, index) {
              final item = myList()[index];

              return ListTile(
                title: Text(item),
                onLongPress: () {
                  //   showDialog(
                  //     context: context,
                  //     builder: (_) => const DeleteDialog(),
                  //   );
                  // },

                  setState(() {
                    // await DeleteDialog();
                    _deleteDialog(index);
                    // myList.removeAt(index);
                  });
                },
              );
            },
          ),
        )
      ]),
    );
  }
}
