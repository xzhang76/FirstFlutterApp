import 'package:flutter/material.dart';
import 'package:myapp/Choice.dart';
import 'package:myapp/ChoiceCard.dart';

void main() => runApp(new BasicAppBarSample());

class BasicAppBarSample extends StatefulWidget {
  const BasicAppBarSample({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _BasicAppBarSampleState();
  }
}

class _BasicAppBarSampleState extends State<BasicAppBarSample> {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new DefaultTabController(
          length: choices.length,
          child: new Scaffold(
            appBar: new AppBar(
              title: new Text('Tabbed Appbar'),
              bottom: new TabBar(
                  isScrollable: true,
                  tabs: choices.map((Choice choice) {
                    return new Tab(
                      text: choice.title,
                      icon: new Icon(choice.icon),
                    );
                  }).toList()),
            ),
            body: new TabBarView(
                children: choices.map((Choice choice) {
              return new Padding(
                  padding: EdgeInsets.all(16.0),
                  child: new ChoiceCard(
                    choice: choice,
                  ));
            }).toList()),
          )),
    );
  }
}
