import 'package:flutter/material.dart';

import 'choice.dart';
import 'choiceCard.dart';

class TabbedAppBarSample extends StatefulWidget {
  const TabbedAppBarSample({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _TabbedAppBarSampleState();
  }
}

class _TabbedAppBarSampleState extends State<TabbedAppBarSample> {

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
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
          ),
    );
  }
}