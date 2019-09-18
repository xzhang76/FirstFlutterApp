import 'package:flutter/material.dart';

import 'MyHomeDrawer.dart';

class MyHomePageWidget extends StatefulWidget {
  const MyHomePageWidget({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _MyHomePageWidgetState();
  }
}

class _MyHomePageWidgetState extends State<MyHomePageWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text('Drawer Demo'),
      ),
      body: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              onPressed: () {
                /*...*/
              },
              child: Text(
                "Flat Button",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            const SizedBox(height: 30),
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
      drawer: new Drawer(
        child: HomeDrawer.homeDrawer(),
      ),
    );
  }
}
