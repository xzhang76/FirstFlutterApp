
import 'package:flutter/material.dart';

class MyRouteHome extends StatelessWidget {
  const MyRouteHome();

  @override
  Widget build(BuildContext context) {
    return new Navigator(
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        Scaffold scaffold = context.ancestorWidgetOfExactType(Scaffold);
        switch (settings.name) {
          case 'home':
            builder = (BuildContext context) => new HomePage(contextText: (scaffold.appBar as AppBar).title);
            break;
          case 'login':
            builder = (BuildContext context) => new LoginPage();
            break;
          default:
            throw new Exception('Invalid route: ${settings.name}');
        }
        return new MaterialPageRoute(builder: builder, settings: settings);
      },
      initialRoute: 'home',
    );
  }
}

class HomePage extends StatelessWidget {
  final Widget contextText;

  const HomePage({Key key, @required this.contextText}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Center(
          child: new Column(
            children: <Widget>[
              Icon(
                Icons.home,
                size: 108,
                color: Colors.lightBlue,
              ),
              new RaisedButton(
                child: new Text('login'),
                onPressed: () {
                  Navigator.of(context).pushNamed('login');
                },
              ),
              contextText,
            ],
          ),
        ),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Column(
        children: <Widget>[
          Icon(
            Icons.person,
            size: 108,
            color: Colors.lightBlue,
          ),
          new RaisedButton(
            child: new Text('logout'),
            onPressed: () {
              Navigator.of(context).pop('logout');
            },
          ),
        ],
      ),
    );
  }
}
