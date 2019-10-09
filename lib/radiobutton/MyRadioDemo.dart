import 'package:flutter/material.dart';
import 'package:myapp/widgets/MyStateManager.dart';

class MyRadioWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MyRadioWidgetState();
  }
}

enum SingingCharacter { lafayette, jefferson }

class _MyRadioWidgetState extends State<MyRadioWidget> {
  SingingCharacter _character = SingingCharacter.jefferson;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(icon: new Icon(Icons.menu), onPressed: null),
        title: new Text('Radio demo'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.search), onPressed: null)
        ],
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            ListTile(
              title: const Text('lafayette'),
              leading: new Radio(
                  //If groupValue and value match, this radio will be selected
                  value: SingingCharacter.lafayette,
                  groupValue: _character,
                  onChanged: (SingingCharacter value) {
                    _radioChanged(value);
                  }),
            ),
            ListTile(
              title: const Text('jefferson'),
              leading: new Radio(
                  value: SingingCharacter.jefferson,
                  groupValue: _character,
                  onChanged: (SingingCharacter value) {
                    _radioChanged(value);
                  }),
            ),
            new MyParentWidget(),
          ],
        ),
      ),
    );
  }

  void _radioChanged(SingingCharacter value) {
    setState(() {
      _character = value;
    });
  }
}
