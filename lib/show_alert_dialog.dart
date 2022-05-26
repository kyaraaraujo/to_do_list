import 'package:flutter/material.dart';

enum DialogOptionsEnum { confirm, cancel }

class ShowAlertDialog {
  static Widget _addCancelButtonIfRequired(
      BuildContext context, String cancelOption) {
    return TextButton(
        child: Text(cancelOption, style: const TextStyle(color: Colors.red)),
        onPressed: () => Navigator.of(context).pop(DialogOptionsEnum.cancel));
  }

  static Widget _confirmButton(BuildContext context, String confirmOption) {
    return TextButton(
        child: Text(
          confirmOption,
          style: const TextStyle(color: Colors.black),
        ),
        onPressed: () => Navigator.of(context).pop(DialogOptionsEnum.confirm));
  }

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
            _confirmButton(context, confirmOption),
            if (cancelOption.isNotEmpty)
              _addCancelButtonIfRequired(context, cancelOption)
          ],
        );
      },
    );
    return (action != null) ? action : DialogOptionsEnum.cancel;
  }
}
