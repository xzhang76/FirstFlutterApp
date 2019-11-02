import 'package:flutter/material.dart';

class MyDialogRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyDialogRouteSate();
  }
}

class _MyDialogRouteSate extends State<MyDialogRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DialogRoute"),
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                child: Text('AlertDialog'),
                onPressed: () async {
                  bool sure = await showAlertDialog(context);
                  if (sure == null) {
                    print("取消");
                  } else {
                    print("确认");
                  }
                }),
            RaisedButton(
                child: Text('SimpleDialog'),
                onPressed: () async {
                  int index = await showSimpleDialog(context);
                  if (index == 1) {
                    print("中文简体");
                  } else {
                    print("美国英语");
                  }
                }),
            RaisedButton(
                child: Text('ListDialog'),
                onPressed: ()  {
                  showListDialog(context);
                })
          ],
        ),
      )),
    );
  }
}

Future<bool> showAlertDialog(BuildContext context) {
  return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('AlertDialog'),
          content: Text('Are you sure?'),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Sure'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            )
          ],
        );
      });
}

Future<int> showSimpleDialog(BuildContext context) {
  return showDialog<int>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text('请选择语言'),
          children: <Widget>[
            SimpleDialogOption(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Text('中文简体'),
              ),
              onPressed: () => Navigator.of(context).pop(1),
            ),
            SimpleDialogOption(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Text('美国英语'),
              ),
              onPressed: () => Navigator.of(context).pop(2),
            )
          ],
        );
      });
}

Future<void> showListDialog(BuildContext context) async {
  int index = await showDialog<int>(
    context: context,
    builder: (BuildContext context) {
      var child = Column(
        children: <Widget>[
          ListTile(title: Text("请选择")),
          Expanded(
              child: ListView.builder(
                itemCount: 30,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text("$index"),
                    onTap: () => Navigator.of(context).pop(index),
                  );
                },
              )),
        ],
      );
      //使用AlertDialog会报错
      //return AlertDialog(content: child);
      return Dialog(child: child);
    },
  );
  if (index != null) {
    print("点击了：$index");
  }
}
