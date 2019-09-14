import 'package:flutter/material.dart';

class ListItem {
  final String title;
  final IconData icon;

  const ListItem({this.title, this.icon});
}

const List<ListItem> choices = const <ListItem>[
  const ListItem(title: 'SnackBar', icon: Icons.looks_one),
  const ListItem(title: 'Bicycle', icon: Icons.directions_bike),
  const ListItem(title: 'Boat', icon: Icons.directions_boat),
  const ListItem(title: 'Bus', icon: Icons.directions_bus),
  const ListItem(title: 'Railway', icon: Icons.directions_railway),
  const ListItem(title: 'Walk', icon: Icons.directions_walk),
  const ListItem(title: 'Subway', icon: Icons.directions_subway),
];
