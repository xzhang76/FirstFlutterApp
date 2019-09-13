import 'package:flutter/material.dart';

void main() => runApp(new BasicAppBarSample());

class BasicAppBarSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'AppBar demo',
      home: new MyStatelessWidget(),
    );
  }
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

class MyStatelessWidget extends StatelessWidget {
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
      body: const Center(
        child: Text(
          'This is the home page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

void openNextPage(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Next Page'),
      ),
      body: const Center(
        child: Text('This is next Page', style: TextStyle(fontSize: 24),),
      ),
    );
  }));
}
