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
