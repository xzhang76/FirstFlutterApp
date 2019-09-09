import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          leading: new IconButton(icon: new Icon(Icons.menu), onPressed: null),
          title: new Text('Volume Control'),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.search), onPressed: null)
          ],
        ),
        body: new MyVolumeWidget(),
      ),
    ));

double _volume = 0.0;

class MyVolumeWidget extends StatefulWidget {
  const MyVolumeWidget({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _MyVolumeWidgetState();
  }
}

class _MyVolumeWidgetState extends State<MyVolumeWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
