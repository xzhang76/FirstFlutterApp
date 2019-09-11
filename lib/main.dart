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
  Choice _selectedChoice = choices[0];

  void _selectChoice(Choice choice) {
    setState(() {
      _selectedChoice = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
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
              child: new ChoiceCard(choice: _selectedChoice))),
    );
  }
}
