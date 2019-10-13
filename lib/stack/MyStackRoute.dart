import 'package:flutter/material.dart';

class MyStackRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: new Text('Flex widget'),
        ),
        body: //通过ConstrainedBox来确保Stack占满屏幕
        ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Stack(
            alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
            children: <Widget>[
              Container(
                height: 120.0,
                width: 120.0,
                color: Colors.blue[50],
                child: Align(
                  //Alignment(x,y)的坐标原点为矩形的中心点
                  //Alignment(x,y)最终得到实际坐标点的计算公式:
                  // (Alignment.x*childWidth/2+childWidth/2, Alignment.x*childHeight+childHeight/2)
                  alignment: Alignment(1, -1), //topRight = Alignment(1.0, -1.0),即(60, 0)
                  widthFactor: 2,
                  heightFactor: 2,
                  child: FlutterLogo(
                    size: 60,
                  ),
                ),
              ),
              Positioned(
                bottom: 10.0,
                child: Container(
                  height: 120.0,
                  width: 120.0,
                  color: Colors.blue[50],
                  child: Align(
                    //FractionalOffset(x,y)的坐标原点为矩形的左侧顶点
                    //FractionalOffset(x,y)最终得到实际坐标点的计算公式:
                    //(FractionalOffset.x * childWidth, FractionalOffset.y * childHeight)
                    alignment: FractionalOffset(0.2, 0.6),
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                )
              ),
              Positioned(
                left: 18.0,
                child: Text("I am Jack"),
              ),
              Positioned(
                top: 18.0,
                child: Text("Your friend"),
              ),
            ],
          ),
        )
    );
  }
}
