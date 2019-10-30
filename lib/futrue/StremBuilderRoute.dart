import 'package:flutter/material.dart';

class StreamBuilderRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _StreamBuilderRouteState();
  }

}

class _StreamBuilderRouteState extends State<StreamBuilderRoute> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: StreamBuilder<int>(
          stream: counter(),
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            if (snapshot.hasError)
              return Text('Error: ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Text('没有Stream');
              case ConnectionState.waiting:
                return Text('等待数据...');
              case ConnectionState.active:
                return Text('active: ${snapshot.data}');
              case ConnectionState.done:
                return Text('Stream已关闭');
            }
            return null; // unreachable
          },
        ),
      ),
    );
  }

  Stream<int> counter() {
    return Stream.periodic(Duration(seconds: 1), (i) {
      return i;
    });
  }
}

