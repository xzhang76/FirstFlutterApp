import 'package:flutter/material.dart';
import 'package:myapp/listItem.dart';
import 'package:myapp/snackBar.dart';
import 'package:myapp/myBottomNavigationBar.dart';

import 'appbar/simpleAppbar.dart';
import 'appbar/tabbedAppbar.dart';
import 'bottombar/bottomBar.dart';


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

class MyStatelessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('My Flutter Demo'),
      ),
      body: new ListView.builder(
          itemBuilder: (context, i) {
            // 在每一列之前，添加一个1像素高的分隔线widget
            if (i.isOdd) return new Divider();

            // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整），比如i为：1, 2, 3, 4, 5
            // 时，结果为0, 1, 1, 2, 2， 这可以计算出ListView中减去分隔线后的实际单词对数量
            final index = i ~/ 2;
            // 如果是建议列表中最后一个单词对
            if(index < itemList.length) {
              return _buildRow(itemList[index], context, index);
            }
            return null;
          }),
    );
  }
}

Widget _buildRow(ListItem item, BuildContext context, int index) {
  return new ListTile(
    title: new Text(
      item.title,
      style: new TextStyle(fontSize: 18.0),
    ),
    leading: new Icon(
      item.icon,
    ),
    trailing: new Icon(
      Icons.navigate_next,
    ),
    onTap: () {
      if(index == 0) {
        snackBarDemo(context);
      } else if(index == 1) {
        bottomNavigationBarDemo(context);
      } else if(index == 2) {
        tabbedAppbarBarDemo(context);
      } else if(index == 3) {
        simpleAppbarDemo(context);
      } else if(index == 4) {
        bottomBarWithText(context);
      }
    },
  );
}

void snackBarDemo(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return new SnackBarWidget();
  }));
}

void bottomNavigationBarDemo(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return new MyBottomNavigationBar();
  }));
}

void tabbedAppbarBarDemo(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return new TabbedAppBarSample();
  }));
}

void simpleAppbarDemo(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return new SimpleAppBar();
  }));
}

void bottomBarWithText(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return new BottomBarWithTextCenter();
  }));
}
