import 'package:flutter/material.dart';
import 'package:myapp/combineturnbox/turn_box_route.dart';
import 'package:myapp/custompaint/gradient_circular_progress_route.dart';
import 'package:myapp/listener/ListenerRoute.dart';
import 'package:myapp/provider/ProviderRoute.dart';
import 'package:myapp/radiobutton/MyRadioDemo.dart';
import 'package:myapp/routedemo/MyRouteHome.dart';
import 'package:myapp/scaffold/ScaffoldRoute.dart';
import 'package:myapp/scaleanimation/ScaleAnimationRoute.dart';
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
import 'package:myapp/staggeranimation/StaggerAnimationRoute.dart';
import 'package:myapp/widgets/MyWidgetsHome.dart';

import 'Flex/MyFlexWidget.dart';
import 'animatedswitcher/animatedSwitcherCounter.dart';
import 'animatedwidgets/animated_widgets_route.dart';
import 'appbar/simpleAppbar.dart';
import 'appbar/tabbedAppbar.dart';
import 'bottombar/bottomBar.dart';
import 'button/iconButton.dart';
import 'button/myAllButton.dart';
import 'colortheme/ThemeRoute.dart';
import 'composedwidgets/gradient_button_route.dart';
import 'containerwidgets/MyContainerWidgetRoute.dart';
import 'custompaint/custom_paint_route.dart';
import 'dialog/MyDialogRoute.dart';
import 'drawer/MyHomePage.dart';
import 'form/MyFormWidget.dart';
import 'futrue/FutureBuilderRoute.dart';
import 'futrue/StremBuilderRoute.dart';
import 'gesture/BothDirectionTestRoute.dart';
import 'gesture/DragRoute.dart';
import 'gesture/GestureDetectorRoute.dart';
import 'gesture/GestureRecognizerRoute.dart';
import 'gesture/ScaleRoute.dart';
import 'hero/HeroAnimationRoute.dart';
import 'inheritedwidget/InheritedWidgetTestRoute.dart';
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
  const ListItem(title: 'ScrollNotification', icon: Icons.audiotrack),
  const ListItem(title: 'InheritedWidget', icon: Icons.backup),
  const ListItem(title: 'ProviderRoute', icon: Icons.battery_alert),
  const ListItem(title: 'ThemeRoute', icon: Icons.palette),
  const ListItem(title: 'FutureBuilderRoute', icon: Icons.favorite),
  const ListItem(title: 'StreamBuilder', icon: Icons.filter_list),
  const ListItem(title: 'DialogRoute', icon: Icons.add_comment),
  const ListItem(title: 'ListenerRoute', icon: Icons.add_a_photo),
  const ListItem(title: 'GestureDetectorRoute', icon: Icons.account_balance),
  const ListItem(title: 'DragRoute', icon: Icons.account_circle),
  const ListItem(title: 'ScaleRoute', icon: Icons.backup),
  const ListItem(title: 'GestureRecognizerRoute', icon: Icons.beach_access),
  const ListItem(title: 'BothDirectionTestRoute', icon: Icons.beenhere),
  const ListItem(title: 'ScaleAnimationRoute', icon: Icons.block),
  const ListItem(title: 'HeroRoute', icon: Icons.blur_circular),
  const ListItem(title: 'StaggerAnimation', icon: Icons.blur_linear),
  const ListItem(title: 'AnimatedSwitcher', icon: Icons.blur_circular),
  const ListItem(title: 'ComposedGradientButton', icon: Icons.border_all),
  const ListItem(title: 'AnimatedWidgetsTest', icon: Icons.check),
  const ListItem(title: 'CombinedTurnBox', icon: Icons.center_focus_weak),
  const ListItem(title: 'CustomPaint', icon: Icons.cached),
  const ListItem(title: 'GradientCircularProgress', icon: Icons.cake),
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
  itemList[25].title: (context) => InheritedWidgetTestRoute(),
  itemList[26].title: (context) => ProviderRoute(),
  itemList[27].title: (context) => ThemeRoute(),
  itemList[28].title: (context) => FutureBuilderRoute(),
  itemList[29].title: (context) => StreamBuilderRoute(),
  itemList[30].title: (context) => MyDialogRoute(),
  itemList[31].title: (context) => ListenerRoute(),
  itemList[32].title: (context) => GestureDetectorRoute(),
  itemList[33].title: (context) => DragRoute(),
  itemList[34].title: (context) => ScaleRoute(),
  itemList[35].title: (context) => GestureRecognizerRoute(),
  itemList[36].title: (context) => BothDirectionTestRoute(),
  itemList[37].title: (context) => ScaleAnimationRoute(),
  itemList[38].title: (context) => HeroAnimationRoute(),
  itemList[39].title: (context) => StaggerRoute(),
  itemList[40].title: (context) => AnimatedSwitcherCounterRoute(),
  itemList[41].title: (context) => GradientButtonRoute(),
  itemList[42].title: (context) => AnimatedWidgetsTest(),
  itemList[43].title: (context) => TurnBoxRoute(),
  itemList[44].title: (context) => CustomPaintRoute(),
  itemList[45].title: (context) => GradientCircularProgressRoute(),
};
