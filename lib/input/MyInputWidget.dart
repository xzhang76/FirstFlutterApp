import 'package:flutter/material.dart';

class MyInputWidget extends StatefulWidget {
  const MyInputWidget({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _MyInputWidgetState();
  }
}

class _MyInputWidgetState extends State<MyInputWidget> {
  String input = "";
  TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.addListener(() {
      setState(() {
        input = _nameController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Input Demo'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            autofocus: true,
            decoration: InputDecoration(
                labelText: "用户名",
                hintText: "用户名或邮箱",
                prefixIcon: Icon(Icons.person)),
            controller: _nameController,
          ),
          TextField(
            decoration: InputDecoration(
                labelText: "密码",
                hintText: "您的登录密码",
                prefixIcon: Icon(Icons.lock)),
            obscureText: true,
          ),
          FlatButton.icon(
              onPressed: () {
                setState(() {
                  input = _nameController.text;
                });
              },
              icon: Icon(Icons.info),
              label: Text('详情: $input')),
        ],
      ),
    );
  }
}
