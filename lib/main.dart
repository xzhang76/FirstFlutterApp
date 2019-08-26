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
        child: new MyButton(),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: null,
        child: new Icon(Icons.add),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        print('MyButton was tapped');
      },
      onDoubleTap: () {
        print('MyButton was double tapped');
      },
      onLongPress: () {
        print('MyButton was long pressed');
      },
      child: new Container(
        height: 36.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(5.0),
          color: Colors.blue,
        ),
        child: new Center(
          child: new Text('Engage'),
        ),
      ),
    );
  }

}
