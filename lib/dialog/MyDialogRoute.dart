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
                }),
            RaisedButton(
                child: Text('AlertDialog'),
                onPressed: () async {
                  bool sure = await showAlertDialog1(context: context);
                  if (sure == null) {
                    print("取消");
                  } else {
                    print("确认");
                  }
                }),
            RaisedButton(
                child: Text('ModalBottomDialog'),
                onPressed: () async {
                  int type = await _showModalBottomSheet(context: context);
                  print(type);
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

Future<bool> showAlertDialog1({@required BuildContext context}) {
  var _withTree = false;
  return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('提示'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("您确定要删除当前文件吗?"),
              Row(
                children: <Widget>[
                  Text("同时删除子目录？"),
//                  //使用StatefulBuilder来构建StatefulWidget上下文
//                  StatefulBuilder(
//                    builder: (context, _setState) {
//                      return Checkbox(
//                        value: _withTree, //默认不选中
//                        onChanged: (bool value) {
//                          //_setState方法实际就是该StatefulWidget的setState方法，
//                          //调用后builder方法会重新被调用
//                          _setState(() {
//                            //更新选中状态
//                            _withTree = !_withTree;
//                          });
//                        },
//                      );
//                    },
//                  ),
                  // 通过Builder来获得构建Checkbox的`context`，
                  // 这是一种常用的缩小`context`范围的方式
                  Builder(
                    builder: (BuildContext context) {
                      return Checkbox(
                        value: _withTree,
                        onChanged: (bool value) {
                          (context as Element).markNeedsBuild();
                          _withTree = !_withTree;
                        },
                      );
                    },
                  )
                ],
              ),
            ],
          ),
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

// 弹出底部菜单列表模态对话框
Future<int> _showModalBottomSheet({@required BuildContext context}) {
  return showModalBottomSheet<int>(
    context: context,
    builder: (BuildContext context) {
      return ListView.builder(
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text("$index"),
            onTap: () => Navigator.of(context).pop(index),
          );
        },
      );
    },
  );
}

