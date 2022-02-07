import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyWidget()));
}

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String txt = "DIALOG";

  TextEditingController alertController = TextEditingController();

  myAlertDialog(BuildContext context) {
    return showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text("Enter Name"),
              content: TextField(
                controller: alertController,
              ),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.pop(context, 'cancel');
                    },
                    child: Text("Cancel")),
                TextButton(
                    onPressed: () {
                      print(alertController.text);

                      setState(() {
                        txt = alertController.text;
                      });
                      Navigator.pop(context, 'ok');
                      alertController.text = "";
                    },
                    child: Text("Ok")),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("$txt")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Dialog errorDialog = Dialog(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12.0)), //this right here
                      child: Container(
                        height: 300.0,
                        width: 300.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(15.0),

                              child: Container(
                                height: 100.0,
                                width: 100.0,
                                child: Image.asset("assets/images/alert1.jfif"),
                              ),
                              //child: Text('Cool', style: TextStyle(color: Colors.red,fontSize: 20.0),),
                            ),
                            Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                                'Awesome',
                                style: TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 50.0)),
                            TextButton(
                                onPressed: () {
                                  print("Do Something.....");

                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'Got It!',
                                  style: TextStyle(
                                      color: Colors.purple,
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                      ),
                    );

                    showDialog(
                        context: context,
                        builder: (BuildContext context) => errorDialog);
                  },
                  child: Text("Dialog")),
              ElevatedButton(
                  onPressed: () {
                    myAlertDialog(context);
                  },
                  child: Text("Input Dialog")),
              ElevatedButton(
                  onPressed: () {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Abort'),
                        content: const Text(
                            'Are you sure you want to abort this operation?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              print("Cancel Cancel Cancel Cancel");

                              Navigator.pop(context, 'Cancel');
                            },
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              print("Ok Ok Ok Ok");

                              Navigator.pop(context, 'OK');
                            },
                            child: const Text('Continue'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Text("Alert Dialog")),
              ElevatedButton(
                  onPressed: () {
                    Dialog errorDialog = Dialog(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(20.0)), //this right here
                      child: Container(
                        color: Colors.deepPurple,
                        height: 300.0,
                        width: 300.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(0.0),

                              child: Container(
                                height: 250.0,
                                width: 250.0,
                                child: Image.asset(
                                    "assets/images/download11.jfif"),
                              ),
                              //child: Text('Cool', style: TextStyle(color: Colors.red,fontSize: 20.0),),
                            ),
                            Padding(padding: EdgeInsets.only(top: 0.0)),
                            TextButton(
                                onPressed: () {
                                  print("Do Something.....");

                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'Ok',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                      ),
                    );

                    showDialog(
                        context: context,
                        builder: (BuildContext context) => errorDialog);
                  },
                  child: Text("Fourth Dialog")),
            ],
          ),
        ),
      ),
    );
  }
}
