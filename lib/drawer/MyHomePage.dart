import 'package:flutter/material.dart';

import 'MyHomeDrawer.dart';

class MyHomePageWidget extends StatefulWidget {
  const MyHomePageWidget({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _MyHomePageWidgetState();
  }
}

class _MyHomePageWidgetState extends State<MyHomePageWidget> {
  @override
  Widget build(BuildContext context) {
    var img = NetworkImage("https://avatars2.githubusercontent.com/u/20411648?s=460&v=4");
    return new Scaffold(
      appBar: AppBar(
        title: new Text('Drawer Demo'),
      ),
      body: SingleChildScrollView(
        child: Column(
            children: <Image>[
              Image(
                image: img,
                height: 50.0,
                width: 100.0,
                fit: BoxFit.fill,
              ),
              Image(
                image: img,
                height: 50,
                width: 50.0,
                fit: BoxFit.contain,
              ),
              Image(
                image: img,
                width: 100.0,
                height: 50.0,
                fit: BoxFit.cover,
              ),
              Image(
                image: img,
                width: 100.0,
                height: 50.0,
                fit: BoxFit.fitWidth,
              ),
              Image(
                image: img,
                width: 100.0,
                height: 50.0,
                fit: BoxFit.fitHeight,
              ),
              Image(
                image: img,
                width: 100.0,
                height: 50.0,
                fit: BoxFit.scaleDown,
              ),
              Image(
                image: img,
                height: 50.0,
                width: 100.0,
                fit: BoxFit.none,
              ),
              Image(
                image: img,
                width: 100.0,
                color: Colors.blue,
                colorBlendMode: BlendMode.difference,
                fit: BoxFit.fill,
              ),
              Image(
                image: img,
                width: 100.0,
                height: 200.0,
                repeat: ImageRepeat.repeatY ,
              )
            ].map((e){
              return Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: 100,
                      child: e,
                    ),
                  ),
                  Text(e.fit.toString())
                ],
              );
            }).toList()
        ),
      ),
      drawer: new Drawer(
        child: HomeDrawer.homeDrawer(),
      ),
    );
  }
}
