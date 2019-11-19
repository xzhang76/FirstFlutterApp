import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'HeroAnimationRouteB.dart';

class HeroAnimationRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HeorA"),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: InkWell(
          child: Hero(
              tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
              child: ClipOval(
                child: Image.asset(
                  "./images/city.jpg",
                  width: 50.0,
                  height: 50.0,
                ),
              )),
          onTap: () {
            //打开B路由
            Navigator.push(context, CupertinoPageRoute(builder: (context) {
              return Scaffold(
                appBar: AppBar(
                  title: Text("原图"),
                ),
                body: HeroAnimationRouteB(),
              );
            }));
          },
        ),
      ),
    );
  }
}
