import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfiniteGridViewRoute extends StatefulWidget {
  const InfiniteGridViewRoute({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _InfiniteGridViewRouteState();
  }
}

class _InfiniteGridViewRouteState extends State<InfiniteGridViewRoute> {
  List<IconData> _icons = []; //保存Icon数据

  @override
  void initState() {
    super.initState();
    _retrieveIcons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("GridView demo"),
        ),
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, //每行三列
                childAspectRatio: 1.0 //显示区域宽高相等
                ),
            itemCount: _icons.length,
            itemBuilder: (context, index) {
              //如果显示到最后一个并且Icon总数小于200时继续获取数据
              if (index == _icons.length - 1 && _icons.length < 200) {
                _retrieveIcons();
                return Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.center,
                  child: SizedBox(
                      width: 24.0,
                      height: 24.0,
                      child: CircularProgressIndicator(strokeWidth: 2.0)),
                );
              }
              return Icon(_icons[index]);
            }));
  }

  //模拟异步获取数据
  void _retrieveIcons() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _icons.addAll([
        Icons.ac_unit,
        Icons.airport_shuttle,
        Icons.all_inclusive,
        Icons.beach_access,
        Icons.cake,
        Icons.free_breakfast
      ]);
      setState(() {
        //重新构建列表
      });
    });
  }
}
