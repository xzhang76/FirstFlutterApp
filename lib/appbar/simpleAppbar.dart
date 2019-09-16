import 'package:flutter/material.dart';

import 'choice.dart';
import 'choiceCard.dart';

class SimpleAppBar extends StatefulWidget {
  const SimpleAppBar({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _SimpleAppBarState();
  }
}

class _SimpleAppBarState extends State<SimpleAppBar> {
  Choice _selectedChoice = choices[0];

  void _selectChoice(Choice choice) {
    setState(() {
      _selectedChoice = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
          appBar: new AppBar(
            title: const Text('Basic AppBar'),
            actions: <Widget>[
              new IconButton(
                  icon: new Icon(choices[0].icon),
                  onPressed: () {
                    _selectChoice(choices[0]);
                  }),
              new IconButton(
                  icon: new Icon(choices[1].icon),
                  onPressed: () {
                    _selectChoice(choices[1]);
                  }),
              new PopupMenuButton<Choice>(
                  itemBuilder: (BuildContext context) {
                    return choices.skip(2).map((Choice choice) {
                      return new PopupMenuItem<Choice>(
                        child: new Text(choice.title),
                        value: choice,
                      );
                    }).toList();
                  },
                  onSelected: _selectChoice),
            ],
          ),
          body: new Padding(
              padding: const EdgeInsets.all(16.0),
              child: new ChoiceCard(choice: _selectedChoice)
          ),
    );
  }
}
