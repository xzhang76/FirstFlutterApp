import 'package:flutter/material.dart';
import 'package:myapp/radiobutton/MyRadioDemo.dart';
import 'package:myapp/routedemo/MyRouteHome.dart';
import 'package:myapp/snackBar.dart';
import 'package:myapp/widgets/MyWidgetsHome.dart';

import 'appbar/simpleAppbar.dart';
import 'appbar/tabbedAppbar.dart';
import 'bottombar/bottomBar.dart';
import 'button/iconButton.dart';
import 'button/myAllButton.dart';
import 'drawer/MyHomePage.dart';
import 'input/MyInputWidget.dart';
import 'myBottomNavigationBar.dart';

class ListItem {
  final String title;
  final IconData icon;

  const ListItem({this.title, this.icon});
}

const List<ListItem> itemList = const <ListItem>[
  const ListItem(title: 'SnackBar', icon: Icons.looks_one),
  const ListItem(title: 'BottomNavigationBar', icon: Icons.looks_two),
  const ListItem(title: 'TabbedAppbar', icon: Icons.apps),
  const ListItem(title: 'SimpleAppbar', icon: Icons.label),
  const ListItem(title: 'BottomBarWithText', icon: Icons.book),
  const ListItem(title: 'MyButton', icon: Icons.restaurant),
  const ListItem(title: 'IconButton', icon: Icons.import_contacts),
  const ListItem(title: 'Drawer', icon: Icons.cloud_done),
  const ListItem(title: 'Widgets', icon: Icons.wc),
  const ListItem(title: 'Radio', icon: Icons.radio),
  const ListItem(title: 'Route', icon: Icons.blur_linear),
  const ListItem(title: 'input', icon: Icons.input),
];

Map<String, WidgetBuilder> routes = {
  itemList[0].title: (context) => SnackBarWidget(),
  itemList[1].title: (context) => MyBottomNavigationBar(),
  itemList[2].title: (context) => TabbedAppBarSample(),
  itemList[3].title: (context) => SimpleAppBar(),
  itemList[4].title: (context) => BottomBarWithTextCenter(),
  itemList[5].title: (context) => MyButton(),
  itemList[6].title: (context) => MyIconButton(),
  itemList[7].title: (context) => MyHomePageWidget(),
  itemList[8].title: (context) => MyWidgetHome(),
  itemList[9].title: (context) => MyRadioWidget(),
  itemList[10].title: (context) => MyBottomNavigationBar(),
  itemList[11].title: (context) => MyInputWidget(),
};
