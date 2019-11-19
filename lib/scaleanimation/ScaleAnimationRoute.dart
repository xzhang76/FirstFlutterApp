import 'package:flutter/material.dart';

class GrowTransition extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;

  const GrowTransition({Key key, this.animation, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
          animation: animation,
          child: child,
          builder: (BuildContext context, Widget child) {
            return Container(
              child: child,
              width: animation.value,
              height: animation.value,
            );
          }),
    );
  }
}

class ScaleAnimationRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ScaleAnimationRoute();
  }
}

//需要继承TickerProvider，如果有多个AnimationController，则应该使用TickerProviderStateMixin。
class _ScaleAnimationRoute extends State<ScaleAnimationRoute>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
    //使用弹性曲线
    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    //图片宽高从0变到300
    animation = new Tween(begin: 0.0, end: 1.0).animate(animation);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //动画执行结束时反向执行动画
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        //动画恢复到初始状态时执行动画（正向）
        controller.forward();
      }
    });
    //启动动画(正向执行)
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
//        child: FadeTransition(
//          opacity: animation,
//          child: Image.asset("./images/city.jpg"),
//        )
      child: RotationTransition(
        turns: animation,
        child: Image.asset("./images/city.jpg"),
      )
    );
  }

  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}
