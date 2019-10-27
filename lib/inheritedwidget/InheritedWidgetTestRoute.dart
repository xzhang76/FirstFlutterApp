import 'package:flutter/material.dart';
import 'package:myapp/inheritedwidget/InheritedShareDataWidget.dart';

class InheritedWidgetTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _InheritedWidgetTestRouteState();
  }
}

class _InheritedWidgetTestRouteState extends State<InheritedWidgetTestRoute> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InheritedWidget demo'),
      ),
      body: Center(
        child: InheritedShareDataWidget(
          data: count,
          child: _TextWidget(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_box),
        onPressed: () => setState(() {
              ++count;
            }),
      ),
    );
  }
}

class _TextWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _TextWidgetState();
  }
}

class _TextWidgetState extends State<_TextWidget> {
  @override
  Widget build(BuildContext context) {
    //使用InheritedWidget中的共享数据
    return new Text(
        InheritedShareDataWidget.of(context).data.toString(),
      style: TextStyle(fontSize: 20.0),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print("Dependencies change");
  }
}
