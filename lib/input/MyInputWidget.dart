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

  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(() {
      setState(() {
        input = _nameController.text;
      });
    });
    focusNode1.addListener(() {
      print(focusNode1.hasFocus);
    });
    focusNode2.addListener(() {
      print(focusNode2.hasFocus);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Input Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Theme(
          data: Theme.of(context).copyWith(
              hintColor: Colors.grey[200], //定义下划线颜色
              inputDecorationTheme: InputDecorationTheme(
                  labelStyle: TextStyle(color: Colors.red), //定义label字体样式
                  hintStyle:
                      TextStyle(color: Colors.orange, fontSize: 14.0) //定义提示文本样式
                  )),
          child: Column(
            children: <Widget>[
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                    labelText: "用户名",
                    hintText: "用户名或邮箱",
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder()),
                controller: _nameController,
                focusNode: focusNode1,
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "密码",
                      hintText: "您的登录密码",
                      prefixIcon: Icon(Icons.lock),
                      border: InputBorder.none),
                  obscureText: true,
                  focusNode: focusNode2,
                ),
                decoration: BoxDecoration(
                    // 下滑线浅灰色，宽度1像素
                    border: Border(
                        bottom:
                            BorderSide(color: Colors.green[200], width: 1.0))),
              ),
              FlatButton.icon(
                  onPressed: () {
                    setState(() {
                      input = _nameController.text;
                    });
                  },
                  icon: Icon(Icons.info),
                  label: Text('详情: $input')),
              Builder(
                builder: (ctx) {
                  return Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          child: Text("移动焦点"),
                          onPressed: () {
                            //将焦点从第一个TextField移到第二个TextField
                            // 这是一种写法 FocusScope.of(context).requestFocus(focusNode2);
                            // 这是第二种写法
                            if (null == focusScopeNode) {
                              focusScopeNode = FocusScope.of(context);
                            }
                            focusScopeNode.requestFocus(focusNode2);
                          },
                        ),
                      ),
                      Expanded(
                        child: RaisedButton(
                          child: Text("隐藏键盘"),
                          onPressed: () {
                            // 当所有编辑框都失去焦点时键盘就会收起
                            focusNode1.unfocus();
                            focusNode2.unfocus();
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
