import 'package:flutter/material.dart';


class MyRaisedButton extends StatefulWidget {
  final String message;
  const MyRaisedButton({Key key,  this.message}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _MyRaisedButtonState(message);
  }
}

class _MyRaisedButtonState extends State<MyRaisedButton> {
  final String message;

  _MyRaisedButtonState(this.message);
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text('Raised Button Response'),
      ),
      body: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(message),
            const SizedBox(height: 30),
            const RaisedButton(
              onPressed: null,
              child: Text('Disabled Button', style: TextStyle(fontSize: 10)),
            ),
            const SizedBox(height: 30),
            new RaisedButton(
                onPressed: () {
                  Navigator.pop(context, "response form child");
                },
                child: Text('Return', style: TextStyle(fontSize: 10))),
            const SizedBox(height: 30),
            new RaisedButton(
              onPressed: () {
                _neverSatisfied(context);
              },
              textColor: Colors.white,
              padding: const EdgeInsets.all(0.0),
              child: new Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: <Color>[
                    Color(0xFF0D47A1),
                    Color(0xFF1976D2),
                    Color(0xFF42A5F5),
                  ])),
                  padding: const EdgeInsets.all(15.0),
                  child: new Text('Gradient Button',
                      style: TextStyle(fontSize: 10))),
            ),
          ],
        ),
      ),
    );
  }
}

enum Department { treasury, state }

Future<void> _askedToLead(BuildContext context) async {
  switch (await showDialog<Department>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Select assignment'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Department.treasury);
              },
              child: const Text('Treasury department'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Department.state);
              },
              child: const Text('State department'),
            ),
          ],
        );
      })) {
    case Department.treasury:
    // Let's go.
    // ...
      break;
    case Department.state:
    // ...
      break;
  }
}

Future<void> _neverSatisfied(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Rewind and remember'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('You will never be satisfied.'),
              Text('You\’re like me. I’m never satisfied.'),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Regret'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

