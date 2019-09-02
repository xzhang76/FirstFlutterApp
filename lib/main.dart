import 'package:flutter/material.dart';
import 'package:myapp/ShoppingListItem.dart';

void main() => runApp(new MaterialApp(
  //当这个widget的父级重建时，父级将创建一个新的ShoppingList实例，
  // 但是Flutter框架将重用已经在树中的_ShoppingListState实例，而不是再次调用createState创建一个新的。
      title: 'Welcome to Flutter',
      home: new ShoppingList(
        products: <Product>[
          new Product(name: 'Eggs'),
          new Product(name: 'Flour'),
          new Product(name: 'Chocolate chips'),
        ],
      ),
    ));

class ShoppingList extends StatefulWidget {
  final List<Product> products;

  const ShoppingList({Key key, this.products}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    //_ShoppingListState不会重新构建，但其widget的属性会更新为新构建的widget
    return new _ShoppingListState();
  }
}

class _ShoppingListState extends State<ShoppingList> {
  Set<Product> _shoppingCart = new Set();

  void _handleCartChanged(Product product, bool inCart) {
    //当父项收到onCartChanged回调时，父项将更新其内部状态，这将触发父项使用新inCart值重建ShoppingListItem新实例。
    //为了通知框架它改变了它的内部状态，需要调用setState。
    // 调用setState将该widget标记为”dirty”(脏的)，并且计划在下次应用程序需要更新屏幕时重新构建它。
    setState(() {
      if (inCart) {
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(icon: new Icon(Icons.menu), onPressed: null),
        title: new Text('Shopping List'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.search), onPressed: null)
        ],
      ),
      body: new ListView(
        padding: new EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map((Product product) {
          return ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product),
            onCartChanged: _handleCartChanged,
          );
        }).toList(),
      ),
    );
  }
}
