import 'package:flutter/material.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

class SnackBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
        title: new Text('AppBar demo'),
        actions: <Widget>[
          new IconButton(
              icon: const Icon(Icons.add_alert),
              tooltip: 'Show SnackBar',
              onPressed: () {
                scaffoldKey.currentState.showSnackBar(snackBar);
              }),
          new IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Next Page',
              onPressed: () {
                openNextPage(context);
              })
        ],
      ),
      body: new Center(
        child: DefaultTextStyle(
          style: TextStyle(
            color: Colors.red,
            fontSize: 20.0,
          ),
          textAlign: TextAlign.start,
          child: new Column(
            children: <Widget>[
              Text.rich(TextSpan(
                children: [
                  TextSpan(text: "Home: "),
                  TextSpan(
                    text: "https://flutterchina.club",
                    style: TextStyle(color: Colors.blue),
                    recognizer: null,
                  ),
                ],
              )),
              Text("hello world"),
              Text("I am Jack"),
              Text(
                "I am Jack",
                style: TextStyle(
                    inherit: false, //2.不继承默认样式
                    color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void openNextPage(BuildContext context) {
  Navigator.push(
      context,
      PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 500), //动画时间为500毫秒
          pageBuilder: (BuildContext context, Animation animation,
              Animation secondaryAnimation) {
            return FadeTransition(
              child: Scaffold(
                appBar: new AppBar(
                  title: new Text('Next Page'),
                ),
                body: const Center(
                  child: Text(
                    'This is next Page',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              opacity: animation,
            );
          }
      )
  );
}
