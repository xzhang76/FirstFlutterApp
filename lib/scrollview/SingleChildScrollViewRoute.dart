import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class SingleChildScrollViewRoute extends StatefulWidget {
  const SingleChildScrollViewRoute({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _SingleChildScrollViewRouteState();
  }
}

class _SingleChildScrollViewRouteState extends State<SingleChildScrollViewRoute> {
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scaffold(
      appBar: AppBar(
        title: Text("SingleChildScrollView demo"),
      ),
      body: CupertinoScrollbar( // 显示进度条
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          reverse: true,
          padding: EdgeInsets.all(16.0),
          physics: BouncingScrollPhysics(),
          child: Center(
            child: Column(
              //动态创建一个List<Widget>
              children: str.split("")
              //每一个字母都用一个Text显示,字体为原来的两倍
                  .map((c) => Text(c, textScaleFactor: 2.0,))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}