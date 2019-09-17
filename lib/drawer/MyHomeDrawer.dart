import 'package:flutter/material.dart';

class HomeDrawer {
  static Widget homeDrawer() {
    return new ListView(
      padding: const EdgeInsets.only(),
      children: <Widget>[
        _drawerHeader(),
        new ClipRect(
          child: new ListTile(
            leading: new CircleAvatar(child: new Text("A")),
            title: new Text('Drawer item A'),
            onTap: () => {},
          ),
        ),
        new ListTile(
          leading: new CircleAvatar(child: new Text("B")),
          title: new Text('Drawer item B'),
          onTap: () => {},
        ),
        new AboutListTile(
          icon: new CircleAvatar(child: new Text("Ab")),
          child: new Text("About"),
          applicationName: "Test",
          applicationVersion: "1.0",
          applicationIcon: new Icon(Icons.label),
          applicationLegalese: "applicationLegalese",
          aboutBoxChildren: <Widget>[
            new Text("BoxChildren"),
            new Text("box child 2")
          ],
        ),
      ],
    );
  }

  static Widget _drawerHeader() {
    return new UserAccountsDrawerHeader(
      accountName: new Text(
        'xzhang76',
      ),
      accountEmail: new Text('zhangxiaoting@163.com'),
      currentAccountPicture: new CircleAvatar(
        child: new Icon(Icons.palette),
      ),
      onDetailsPressed: () {},
      otherAccountsPictures: <Widget>[
        new CircleAvatar(
          child: new Icon(Icons.book),
        ),
      ],
    );
  }
}
