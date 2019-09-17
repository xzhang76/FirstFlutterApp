import 'package:flutter/material.dart';

double _volume = 0.0;

class MyIconButton extends StatefulWidget {
  const MyIconButton({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _MyIconButtonState();
  }
}

class _MyIconButtonState extends State<MyIconButton> {
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
      body: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Ink(
              decoration: new ShapeDecoration(shape: CircleBorder(), color: Colors.lightBlue),
              child: new IconButton(icon: new Icon(Icons.volume_up), onPressed: () {
                setState(() {
                  _volume += 10;
                });
              }),
            ),
            const SizedBox(height: 30),
            new Ink(
              decoration: new ShapeDecoration(shape: CircleBorder(), color: Colors.redAccent),
              child: new IconButton(icon: new Icon(Icons.volume_down), onPressed: () {
                setState(() {
                  _volume += -10;
                });
              }),
            ),
            new Text("Current Volume: $_volume"),
          ],
        ),
      ),
    );
  }
}
