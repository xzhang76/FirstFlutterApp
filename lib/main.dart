import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
  title: 'Welcome to Flutter',
  home: MyScaffold(),
));



class MyAppBar extends StatelessWidget {

  MyAppBar({this.title});
  final Widget title;
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 56.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: new BoxDecoration(color: Colors.blue[500]),
      child: new Row(
        children: <Widget>[
          new IconButton(
            icon: new Icon(Icons.menu),
            tooltip: 'Navigation menu',
            //null 会禁用 button
            onPressed: null,
          ),
          // Expanded expands its child to fill the available space.
          new Expanded(child: title),
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Search',
            //null 会禁用 button
            onPressed: null,
          ),
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Material 是UI呈现的“一张纸”
    return new Material(
      child: new Column(
        children: <Widget>[
          new MyAppBar(
            title: new Text(
              'Example text',
              style: Theme.of(context).primaryTextTheme.title,
            ),
          ),
          //MyScaffold使用了一个Expanded来填充剩余的空间
          new Expanded(
            child: new Center(
              child: new Text('Hello World'),
            ),
          )
        ],
      ),
    );
  }
}

