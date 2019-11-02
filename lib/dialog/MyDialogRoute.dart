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
                  bool sure = await showAlertDialog(context: context);
                  if (sure == null) {
                    print("取消");
                  } else {
                    print("确认");
                  }
                }),
            RaisedButton(
                child: Text('SimpleDialog'),
                onPressed: () async {
                  int index = await showSimpleDialog(context: context);
                  if (index == 1) {
                    print("中文简体");
                  } else {
                    print("美国英语");
                  }
                }),
            RaisedButton(
                child: Text('ListDialog'),
                onPressed: () {
                  showListDialog(context: context);
                }),
            RaisedButton(
                child: Text('WidgetListDialog'),
                onPressed: () {
                  showAnotherListDialog(context: context);
                }),
            RaisedButton(
                child: Text('CustomDialog'),
                onPressed: () async {
                  bool sure = await showCustomDialog<bool>(
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
                  if (sure == null) {
                    print("取消");
                  } else {
                    print("确认");
                  }
                })
          ],
        ),
      )),
    );
  }
}

Future<bool> showAlertDialog({@required BuildContext context}) {
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

Future<int> showSimpleDialog({@required BuildContext context}) {
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

Future<void> showListDialog({@required BuildContext context}) async {
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

Future<void> showAnotherListDialog({@required BuildContext context}) async {
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
      //可以返回非Dialog的widget
//      return UnconstrainedBox(
//        child: ConstrainedBox(
//          constraints: BoxConstraints(maxWidth: 280),
//          child: Material(
//            child: child,
//            type: MaterialType.card,
//          ),
//        ),
//        constrainedAxis: Axis.vertical,
//      );
      return Card(
        child: child,
        margin: EdgeInsets.fromLTRB(20, 40, 20, 40),
      );
    },
  );
  if (index != null) {
    print("点击了：$index");
  }
}

Widget _buildMaterialDialogTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child) {
  // 使用缩放动画
  return ScaleTransition(
    scale: CurvedAnimation(
      parent: animation,
      curve: Curves.easeOut,
    ),
    child: child,
  );
}

Future<T> showCustomDialog<T>({
  @required BuildContext context,
  bool barrierDismissible = true,
  WidgetBuilder builder,
}) {
  final ThemeData theme = Theme.of(context, shadowThemeOnly: true);
  return showGeneralDialog(
    context: context,
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      final Widget pageChild = Builder(builder: builder);
      return SafeArea(
        child: Builder(
          builder: (BuildContext context) {
            return theme != null
                ? Theme(data: theme, child: pageChild)
                : pageChild;
          },
        ),
      );
    },
    //点击遮罩是否关闭对话框
    barrierDismissible: barrierDismissible,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black87,
    //自定义遮罩颜色
    transitionDuration: const Duration(milliseconds: 150),
    //对话框打开/关闭的动画
    transitionBuilder: _buildMaterialDialogTransitions,
  );
}
