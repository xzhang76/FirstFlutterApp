import 'package:flutter/material.dart';

class MyWidgetHome extends StatefulWidget {
  const MyWidgetHome({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _MyWidgetHomeState();
  }
}

class _MyWidgetHomeState extends State<MyWidgetHome> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(icon: new Icon(Icons.menu), onPressed: null),
        title: new Text('Volume Control'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.search), onPressed: null)
        ],
      ),
      body: new Container(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.grey.shade800,
                child: Text('AB'),
              ),
              label: Text('Aaron Burr'),
            ),
            const SizedBox(
              height: 10,
            ),
            new RaisedButton(
                onPressed: () {
                  _askedToLead(context);
                },
                child: Text('enabled Button', style: TextStyle(fontSize: 10))),
            const SizedBox(
              height: 10,
            ),
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
            const SizedBox(
              height: 10,
            ),
            Card(
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  print('Card tapped.');
                },
                child: Container(
                  width: 300,
                  height: 100,
                  child: Text('A card that can be tapped'),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(
                      Icons.music_video,
                      color: Colors.red,
                    ),
                    title: Text('说好不哭'),
                    subtitle: Text('周杰伦&阿信最新单曲'),
                  ),
                  ButtonTheme.bar(
                    // make buttons use the appropriate styles for cards
                    child: ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text('BUY TICKETS'),
                          onPressed: () {},
                        ),
                        FlatButton(
                          child: const Text('LISTEN'),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
