import 'package:flutter/material.dart';

class ThemeRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ThemeRouteState();
  }

}

class _ThemeRouteState extends State<ThemeRoute> {
  Color _themeColor = Colors.teal; //当前路由主题色
  @override
  Widget build(BuildContext context) {
    ThemeData _themeData = Theme.of(context);
    return Theme(
      data: ThemeData(
          primarySwatch: _themeColor, //用于导航栏、FloatingActionButton的背景色等
          iconTheme: IconThemeData(color: _themeColor) //用于Icon颜色
      ),
      child: Scaffold(
        appBar: AppBar(title: Text("Theme Demo"),),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //第一行Icon使用主题中的iconTheme
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.favorite),
                Icon(Icons.airline_seat_recline_normal),
                Text("  颜色跟随主题")
              ],
            ),
            //为第二行Icon自定义颜色（固定为黑色)
            Theme(
              data: _themeData.copyWith(
                iconTheme: IconThemeData(color: Colors.black),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.favorite),
                  Icon(Icons.airline_seat_recline_normal),
                  Text("  颜色固定黑色")
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () =>
              setState(() =>
              _themeColor =
              _themeColor == Colors.teal ? Colors.blue : Colors.teal
              ),
          child: Icon(Icons.palette),
        ),
      ),
    );
  }

}