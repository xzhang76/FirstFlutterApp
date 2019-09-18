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
          ],
        ),
      ),
    );
  }
}
