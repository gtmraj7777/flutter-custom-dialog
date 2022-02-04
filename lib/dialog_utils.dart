import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  static DialogUtils _instance = new DialogUtils.internal();

  DialogUtils.internal();

  factory DialogUtils() => _instance;

  static void showCustomDialog(BuildContext context,
      {required String title,
        String okBtnText = "Ok",
        String cancelBtnText = "Cancel",
        required Function okBtnFunction}) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(title),
            content: Text("GAUTAM"),/* Here add your custom widget  */
            actions: <Widget>[
              FlatButton(
                child: Text(okBtnText),
                onPressed: (){

                  print("HHHHHHHUUUUUUGGGGGGGNNNNNNNN");

                  Navigator.pop(context);


                },
              ),
              FlatButton(
                  child: Text(cancelBtnText),
                  onPressed: () => Navigator.pop(context))
            ],
          );
        });
  }
}