import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewRoute extends StatefulWidget {
  const ListViewRoute({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _ListViewRouteState();
  }
}

class _ListViewRouteState extends State<ListViewRoute> {
  @override
  Widget build(BuildContext context) {
    //下划线widget预定义以供复用。
    Widget divider1 = Divider(
      color: Colors.blue,
    );
    Widget divider2 = Divider(color: Colors.green);
    return Scaffold(
        appBar: AppBar(
          title: Text("ListView demo"),
        ),
        body: Scrollbar(
          // 显示进度条
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            itemCount: 100,
            //列表项构造器
            itemBuilder: (BuildContext context, int index) {
              return ListTile(title: Text("$index"));
            },
            //分割器构造器
            separatorBuilder: (BuildContext context, int index) {
              return index % 2 == 0 ? divider1 : divider2;
            },
          ),
        )
    );
  }
}
