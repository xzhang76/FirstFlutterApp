import 'package:flutter/material.dart';

import 'CartModel.dart';
import 'ChangeNotifierProvider.dart';

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
                  Builder(builder: (context){
                    var cart=ChangeNotifierProvider.of<CartModel>(context);
                    return Text("总价: ${cart.totalPrice}");
                  }),
                  Builder(builder: (context){
                    print("RaisedButton build"); //在后面优化部分会用到
                    return RaisedButton(
                      child: Text("添加商品"),
                      onPressed: () {
                        //给购物车中添加商品，添加后总价会更新
                        ChangeNotifierProvider.of<CartModel>(context).add(Item(20.0, 1));
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