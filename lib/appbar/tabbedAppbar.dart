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

class _TabbedAppBarSampleState extends State<TabbedAppBarSample>
    with SingleTickerProviderStateMixin {
  TabController _tabController; //需要定义一个Controller

  @override
  void initState() {
    super.initState();
    // 创建Controller
    _tabController = TabController(length: choices.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        bottom: new TabBar(
            controller: _tabController,
            isScrollable: true,
            tabs: choices.map((Choice choice) {
              return new Tab(
                text: choice.title,
                icon: new Icon(choice.icon),
              );
            }).toList()),
      ),
      body: new TabBarView(
          controller: _tabController,
          children: choices.map((Choice choice) {
            return new Padding(
                padding: EdgeInsets.all(16.0),
                child: new ChoiceCard(
                  choice: choice,
                ));
          }).toList()),
    );
  }
}
