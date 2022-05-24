import 'package:flutter/material.dart';

enum DialogOptionsEnum { confirm, cancel }

class DialogAction {
  static Future<DialogOptionsEnum> dialogOptions(
      BuildContext context,
      String dialogTitle,
      String dialogBody,
      String confirmOption,
      String cancelOption) async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(dialogTitle),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(dialogBody),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
                child: Text(
                  confirmOption,
                  style: const TextStyle(color: Colors.black),
                ),
                onPressed: () =>
                    Navigator.of(context).pop(DialogOptionsEnum.confirm)),
            TextButton(
                child: Text(cancelOption,
                    style: const TextStyle(color: Colors.red)),
                onPressed: () =>
                    Navigator.of(context).pop(DialogOptionsEnum.cancel)),
          ],
        );
      },
    );
    return (action != null) ? action : DialogOptionsEnum.cancel;
  }
}
