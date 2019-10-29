import 'package:flutter/material.dart';

import 'CartModel.dart';
import 'ChangeNotifierProvider.dart';

class Consumer<T> extends StatelessWidget {
  Consumer({
    Key key,
    @required this.builder,
    this.child,
  })  : assert(builder != null),
        super(key: key);

  final Widget child;

  final Widget Function(BuildContext context, T value) builder;

  @override
  Widget build(BuildContext context) {
    return builder(
      context,
      ChangeNotifierProvider.of<T>(context), //自动获取Model
    );
  }
}

class ProviderRoute extends StatefulWidget {
  @override
  _ProviderRouteState createState() => _ProviderRouteState();
}

class _ProviderRouteState extends State<ProviderRoute> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ChangeNotifierProvider<CartModel>(
        data: CartModel(),
        child: Builder(builder: (context) {
          return Scaffold(
            appBar: AppBar(title: Text('Provider demo'),),
            body: Center(
              child: Column(
                children: <Widget>[
                  Consumer<CartModel>(
                    builder: (context, cart) =>Text("总价: ${cart.totalPrice}"),
                  ),
                  Builder(builder: (context){
                    print("RaisedButton build"); //在后面优化部分会用到
                    return RaisedButton(
                      child: Text("添加商品"),
                      onPressed: () {
                        //给购物车中添加商品，添加后总价会更新
                        ChangeNotifierProvider.of<CartModel>(context, listen: false).add(Item(20.0, 1));
                      },
                    );
                  }),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}