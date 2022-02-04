import 'package:flutter/material.dart';

import 'dialog_utils.dart';

void main() {
  runApp(MaterialApp(home: MyWidget()) );
}


class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {

  String txt = "Alert Input Box";

  TextEditingController alertController = TextEditingController();



  myAlertDialog(BuildContext context){

    return showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text("Enter Name"),
          content: TextField(controller: alertController,),
          actions: <Widget>[

            TextButton(
                onPressed: (){
                  Navigator.pop(context,'cancel');
                },
                child: Text("Cancel")
            ),
            TextButton(
                onPressed: (){



                  print(alertController.text);

                  setState(() {
                    txt = alertController.text;
                  });
                  Navigator.pop(context,'ok');
                  alertController.text = "";

                },
                child: Text("Ok")
            ),

          ],


        ));




  }









  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      home: Scaffold(
        appBar: AppBar(title: Text("$txt")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: (){

                    Dialog errorDialog = Dialog(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), //this right here
                      child: Container(
                        height: 300.0,
                        width: 300.0,

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding:  EdgeInsets.all(15.0),
                              child: Text('Cool', style: TextStyle(color: Colors.red),),
                            ),
                            Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Text('Awesome', style: TextStyle(color: Colors.red),),
                            ),
                            Padding(padding: EdgeInsets.only(top: 50.0)),
                            TextButton(onPressed: () {

                              print("Do Something.....");


                              Navigator.of(context).pop();
                            },
                                child: Text('Got It!', style: TextStyle(color: Colors.purple, fontSize: 18.0),))
                          ],
                        ),
                      ),
                    );

                    showDialog(context: context, builder: (BuildContext context) => errorDialog);
                  },
                  child: Text("First Dialog")),




              ElevatedButton(
                  onPressed: (){


                    myAlertDialog(context);

                  },
                  child: Text("Second Dialog")),




              ElevatedButton(
                  onPressed: (){


                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('AlertDialog Title'),
                        content: const Text('AlertDialog description'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {

                              print("Cancel Cancel Cancel Cancel");

                    Navigator.pop(context, 'Cancel');

                    } ,
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {


                              print("Ok Ok Ok Ok");

                              Navigator.pop(context, 'OK');

                    },
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );






                  },
                  child: Text("Third Dialog")),
              ElevatedButton(
                  onPressed: (){},
                  child: Text("Fourth Dialog")),
            ],
          ),
        ),
      ),
    );
  }
}
