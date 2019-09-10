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
        body: new MyStatefulWidget(),
      ),
    ));

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _MyStatefulWidgetState();
  }
}

int _count = 0;
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text('Pressed button $_count times.'),
      ),
      backgroundColor: Colors.blueAccent.shade200,
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          _count++;
        });
      }, child: const Icon(Icons.add),),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(height: 50.0,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
