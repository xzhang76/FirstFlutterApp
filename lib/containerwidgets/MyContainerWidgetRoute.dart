import 'package:flutter/material.dart';
import 'dart:math' as math;

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
      body: SingleChildScrollView(
        child: Column(
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
                    padding: const EdgeInsets.fromLTRB(20.0, .0, 20.0, .0),
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
                  child: redBox),
            ),
            SizedBox(width: 50.0, height: 50.0, child: redBox),
            //多重限制,父子中相应数值较大的
            ConstrainedBox(
                constraints: BoxConstraints(minWidth: 200.0, minHeight: 20.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 60.0, minHeight: 30.0),
                  child: redBox,
                )),
            ConstrainedBox(
                constraints: BoxConstraints(minWidth: 60.0, minHeight: 80.0), //父
                //"去除"父级限制,但注意并非是真正的去除
                //父ConstrainedBox是作用于子UnconstrainedBox上，而redBox只受子ConstrainedBox限制
                child: UnconstrainedBox(
                  //“去除”父级限制
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: 90.0, minHeight: 5.0),
                    //子
                    child: redBox,
                  ),
                )),
            DecoratedBox(
              position: DecorationPosition.background, //或者不写
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.red, Colors.orange[700]]), //背景渐变
                  borderRadius: BorderRadius.circular(3.0), //3像素圆角
                  boxShadow: [
                    //阴影
                    BoxShadow(
                        color: Colors.black54,
                        offset: Offset(2.0, 2.0),
                        blurRadius: 4.0)
                  ]),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 50,),
            Container(
              color: Colors.deepOrange,
              child: Transform(
                alignment: Alignment.topRight, //相对于坐标系原点的对齐方式
                transform: new Matrix4.skewY(0.3), //沿Y轴倾斜0.3弧度
                child: new Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.blue,
                  child: const Text('Apartment for rent!'),
                ),
              ),
            ),
            SizedBox(height: 30),
            DecoratedBox(
              decoration:BoxDecoration(color: Colors.red),
              //默认原点为左上角，左移20像素，向上平移5像素
              child: Transform.translate(
                offset: Offset(-20.0, -5.0),
                child: Text("Hello world"),
              ),
            ),
            SizedBox(height: 50),
            DecoratedBox(
              decoration:BoxDecoration(color: Colors.red),
              child: Transform.rotate(
                //旋转90度
                angle:math.pi/2 ,
                child: Text("Hello World"),
              ),
            ),
            SizedBox(height: 50),
            DecoratedBox(
                decoration:BoxDecoration(color: Colors.red),
                child: Transform.scale(
                    scale: 1.5, //放大到1.5倍
                    child: Text("Hello world")
                )
            ),
            SizedBox(height: 30),
            // Transform的变换是应用在绘制阶段，而并不是应用在布局(layout)阶段，
            // 所以无论对子组件应用何种变化，其占用空间的大小和在屏幕上的位置都是固定不变的，因为这些是在布局阶段就确定的。

            //由于矩阵变化只会作用在绘制阶段，所以在某些场景下，在UI需要变化时，可以直接通过矩阵变化来达到视觉上的UI改变，
            // 而不需要去重新触发build流程，这样会节省layout的开销，所以性能会比较好。
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DecoratedBox(
                    decoration:BoxDecoration(color: Colors.red),
                    child: Transform.translate(offset: Offset(20.0, 5.0),
                        child: Text("Hello world", style: TextStyle(color: Colors.blueGrey, fontSize: 15.0))
                    )
                ),
                Text("你好", style: TextStyle(color: Colors.green, fontSize: 18.0),)
              ],
            ),
            SizedBox(height: 30),
            //RotatedBox的变换是在layout阶段，会影响在子组件的位置和大小
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  //将Transform.rotate换成RotatedBox
                  child: RotatedBox(
                    quarterTurns: 1, //旋转90度(1/4圈)
                    child: Text("Hello World"),
                  ),
                ),
                Text("你好", style: TextStyle(color: Colors.green, fontSize: 18.0),)
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0, left: 0.0, bottom: 50.0), //容器外填充
              constraints: BoxConstraints.tightFor(width: 200.0, height: 150.0), //卡片大小
              decoration: BoxDecoration(//背景装饰
                  gradient: RadialGradient( //背景径向渐变
                      colors: [Colors.red, Colors.orange],
                      center: Alignment.topLeft,
                      radius: .98
                  ),
                  boxShadow: [ //卡片阴影
                    BoxShadow(
                        color: Colors.black54,
                        offset: Offset(2.0, 2.0),
                        blurRadius: 4.0
                    )
                  ]
              ),
              transform: Matrix4.rotationZ(.2), //卡片倾斜变换
              alignment: Alignment.center, //卡片内文字居中
              child: Text( //卡片文字
                "5.20", style: TextStyle(color: Colors.white, fontSize: 40.0),
              ),
            ),
            //margin的留白是在容器外部，而padding的留白是在容器内部
            Container(
              margin: EdgeInsets.all(20.0), //容器外补白
              color: Colors.orange,
              child: Text("Hello world!"),
            ),
            Container(
              padding: EdgeInsets.all(20.0), //容器内补白
              color: Colors.orange,
              child: Text("Hello world!"),
            ),
//Container内margin和padding都是通过Padding 组件来实现的
//            Padding(
//              padding: EdgeInsets.all(20.0),
//              child: DecoratedBox(
//                decoration: BoxDecoration(color: Colors.orange),
//                child: Text("Hello world!"),
//              ),
//            ),
//            DecoratedBox(
//              decoration: BoxDecoration(color: Colors.orange),
//              child: Padding(
//                padding: const EdgeInsets.all(20.0),
//                child: Text("Hello world!"),
//              ),
//            ),
          ],
        ),
      )
    );
  }
}
