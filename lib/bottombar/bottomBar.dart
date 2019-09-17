import 'package:flutter/material.dart';


class BottomBarWithTextCenter extends StatefulWidget {
  const BottomBarWithTextCenter({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _BottomBarWithTextCenterState();
  }
}

int _count = 0;
class _BottomBarWithTextCenterState extends State<BottomBarWithTextCenter> {
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