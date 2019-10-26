import 'package:flutter/material.dart';
import 'package:myapp/radiobutton/MyRadioDemo.dart';
import 'package:myapp/routedemo/MyRouteHome.dart';
import 'package:myapp/scaffold/ScaffoldRoute.dart';
import 'package:myapp/scrollview/CustomScrollViewRoute.dart';
import 'package:myapp/scrollview/GridViewRoute.dart';
import 'package:myapp/scrollview/InfiniteGridViewRoute.dart';
import 'package:myapp/scrollview/InfiniteListViewRoute.dart';
import 'package:myapp/scrollview/ListViewRoute.dart';
import 'package:myapp/scrollview/ScrollControllerRoute.dart';
import 'package:myapp/scrollview/ScrollNotificationRoute.dart';
import 'package:myapp/scrollview/SingleChildScrollViewRoute.dart';
import 'package:myapp/snackBar.dart';
import 'package:myapp/stack/MyStackRoute.dart';
import 'package:myapp/widgets/MyWidgetsHome.dart';

import 'Flex/MyFlexWidget.dart';
import 'appbar/simpleAppbar.dart';
import 'appbar/tabbedAppbar.dart';
import 'bottombar/bottomBar.dart';
import 'button/iconButton.dart';
import 'button/myAllButton.dart';
import 'containerwidgets/MyContainerWidgetRoute.dart';
import 'drawer/MyHomePage.dart';
import 'form/MyFormWidget.dart';
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
  const ListItem(title: 'Input', icon: Icons.input),
  const ListItem(title: 'Form', icon: Icons.format_align_center),
  const ListItem(title: 'Flex', icon: Icons.new_releases),
  const ListItem(title: 'Stack', icon: Icons.music_video),
  const ListItem(title: 'Container', icon: Icons.contacts),
  const ListItem(title: 'Scaffold', icon: Icons.access_alarm),
  const ListItem(title: 'SingleScrollView', icon: Icons.scanner),
  const ListItem(title: 'ListView', icon: Icons.filter_list),
  const ListItem(title: 'InfiniteListView', icon: Icons.rate_review),
  const ListItem(title: 'GridView', icon: Icons.grid_on),
  const ListItem(title: 'InfiniteGridView', icon: Icons.grid_off),
  const ListItem(title: 'CustomScrollView', icon: Icons.center_focus_weak),
  const ListItem(title: 'ScrollControllerView', icon: Icons.accessibility),
  const ListItem(title: 'ScrollNotification', icon: Icons.accessibility),
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
  itemList[12].title: (context) => MyFormRoute(),
  itemList[13].title: (context) => FlexLayoutRoute(),
  itemList[14].title: (context) => MyStackRoute(),
  itemList[15].title: (context) => MyContainerWidgetRoute(),
  itemList[16].title: (context) => ScaffoldRoute(),
  itemList[17].title: (context) => SingleChildScrollViewRoute(),
  itemList[18].title: (context) => ListViewRoute(),
  itemList[19].title: (context) => InfiniteListViewRoute(),
  itemList[20].title: (context) => GridViewRoute(),
  itemList[21].title: (context) => InfiniteGridViewRoute(),
  itemList[22].title: (context) => CustomScrollViewRoute(),
  itemList[23].title: (context) => ScrollControllerRoute(),
  itemList[24].title: (context) => ScrollNotificationRoute(),
};
