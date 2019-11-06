import 'package:flutter/material.dart';

class GestureDetectorRoute extends StatefulWidget {
  @override
  _GestureDetectorRouteState createState() => new _GestureDetectorRouteState();
}

class _GestureDetectorRouteState extends State<GestureDetectorRoute>
    with SingleTickerProviderStateMixin {
  String _operation = "No Gesture detected!"; //保存事件名
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('GestureDetectorRoute'),
        ),
        body: Center(
          child: GestureDetector(
            child: Container(
              alignment: Alignment.center,
              color: Colors.blue,
              height: 100.0,
              child: Text(
                _operation,
                style: TextStyle(color: Colors.white),
              ),
            ),
            onTap: () => updateText("Tap"), //点击
            onDoubleTap: () => updateText("DoubleTap"), //双击
            onLongPress: () => updateText("LongPress"), //长按
          ),
        ));
  }

  void updateText(String text) {
    //更新显示的事件名
    setState(() {
      _operation = text;
    });
  }
}
