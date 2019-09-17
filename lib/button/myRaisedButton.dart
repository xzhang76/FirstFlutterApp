import 'package:flutter/material.dart';

class MyRaisedButton extends StatefulWidget {
  const MyRaisedButton({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _MyRaisedButtonState();
  }
}

class _MyRaisedButtonState extends State<MyRaisedButton> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text('Raised Button'),
      ),
      body: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const RaisedButton(
              onPressed: null,
              child: Text('Disabled Button', style: TextStyle(fontSize: 10)),
            ),
            const SizedBox(height: 30),
            new RaisedButton(
                onPressed: () {},
                child: Text('enabled Button', style: TextStyle(fontSize: 10))),
            const SizedBox(height: 30),
            new RaisedButton(
              onPressed: () {},
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
