import 'package:flutter/material.dart';

class MyContainerWidgetRoute extends StatefulWidget {
  const MyContainerWidgetRoute({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _MyContainerWidgetRouteState();
  }
}

class _MyContainerWidgetRouteState extends State<MyContainerWidgetRoute> {
  @override
  Widget build(BuildContext context) {
    Widget redBox = DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
      child: Icon(Icons.ac_unit),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('容器类组件'),
        actions: <Widget>[
          //AppBar.build()方法中表明其是ConstrainedBox
          // 所以要"去除"父级限制
          UnconstrainedBox(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation(Colors.orangeAccent),
              ),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            //上下左右各添加16像素补白
            padding: EdgeInsets.all(16.0),
            child: Column(
              //显式指定对齐方式为左对齐，排除对齐干扰
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  //左边添加8像素补白
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text("Hello world"),
                ),
                Padding(
                  //上下各添加8像素补白
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text("I am xzhang"),
                ),
                Padding(
                  // 分别指定四个方向的补白
                  padding: const EdgeInsets.fromLTRB(20.0, .0, 20.0, 20.0),
                  child: Text("Your friend"),
                )
              ],
            ),
          ),
          //ConstrainedBox和SizedBox都是通过RenderConstrainedBox来渲染的,原理是相同的
          ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: double.infinity, //宽度尽可能大
                minHeight: 50.0 //最小高度为50像素
            ),
            child: Container(
                height: 5.0, //因为指定了最小高度为50,所以不生效
                child: redBox
            ),
          ),
          SizedBox(
              width: 80.0,
              height: 80.0,
              child: redBox
          ),
          //多重限制,父子中相应数值较大的
          ConstrainedBox(
              constraints: BoxConstraints(minWidth: 200.0, minHeight: 20.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: 60.0, minHeight: 30.0),
                child: redBox,
              )
          ),
          ConstrainedBox(
              constraints: BoxConstraints(minWidth: 60.0, minHeight: 100.0),  //父
              //"去除"父级限制,但注意并非是真正的去除
              //父ConstrainedBox是作用于子UnconstrainedBox上，而redBox只受子ConstrainedBox限制
              child: UnconstrainedBox( //“去除”父级限制
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),//子
                  child: redBox,
                ),
              )
          )
        ],
      ),
    );
  }
}
