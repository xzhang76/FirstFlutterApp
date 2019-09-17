import 'package:flutter/material.dart';

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
  const ListItem(title: 'RaisedButton', icon: Icons.restaurant),
  const ListItem(title: 'IconButton', icon: Icons.import_contacts),
  const ListItem(title: 'Drawer', icon: Icons.cloud_done),
];
