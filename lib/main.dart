import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      title: 'Welcome to Flutter',
      home: TutorialHome(),
    ));

class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(icon: new Icon(Icons.menu), onPressed: null),
        title: new Text('Example Text'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.search), onPressed: null)
        ],
      ),
      body: new Center(
        child: new Text('Hello World'),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: null,
        child: new Icon(Icons.add),
      ),
    );
  }
}
