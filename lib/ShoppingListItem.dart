import 'package:flutter/material.dart';

class Product {
  const Product({this.name});
  final String name;
}

typedef void CartChangedCallBack(Product product, bool inChart);

class ShoppingListItem extends StatelessWidget {


  final Product product;
  final bool inCart;
  final CartChangedCallBack onCartChanged;

  const ShoppingListItem({Key key, this.product, this.inCart, this.onCartChanged}) : super(key: key);

  Color _getColorBg(BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context) {
    if (!inCart) return null;
    return new TextStyle(color: Colors.black54, decoration: TextDecoration.lineThrough);
  }

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      //widget会调用其父widget给它的onCartChanged回调函数
      //当父项收到onCartChanged回调时，父项将更新其内部状态，这将触发父项使用新inCart值重建ShoppingListItem新实例。
      onTap: () {
        onCartChanged(product, !inCart);
      },
      leading: new CircleAvatar(
        backgroundColor: _getColorBg(context),
        child: new Text(product.name[0]),
      ),
      title: new Text(product.name, style: _getTextStyle(context),),
    );
  }

}