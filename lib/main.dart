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
        child: new Counter(),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: null,
        child: new Icon(Icons.add),
      ),
    );
  }
}

//这两种类型的对象具有不同的生命周期：
// Counter(StatefulWidget)是临时对象，用于构建当前状态下的应用程序;
// _MyButton(State)对象在多次调用build()之间保持不变，允许它们记住信息(状态)
// 如果构建一个StatefulWidget,那么会有State对象和其搭配

class Counter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _Counter();
  }
}

class _Counter extends State<Counter> {
  int _count = 0;

  void _increment() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new CounterAdder(onPressed: _increment),
        new CounterDisplay(count: _count)
      ],
    );
  }
}

class CounterAdder extends StatelessWidget {
  CounterAdder({this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 100.0,
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.circular(15.0),
        color: Colors.blue,
      ),
      child: new RaisedButton(onPressed: onPressed, child: new Icon(Icons.add),),
    );
  }
}

class CounterDisplay extends StatelessWidget {
  CounterDisplay({this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return new Text('Counter: $count');
  }
}
