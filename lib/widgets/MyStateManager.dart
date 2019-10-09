import 'package:flutter/material.dart';

class MyParentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MyParentWidgetState();
  }
}

class _MyParentWidgetState extends State<MyParentWidget> {
  bool _active = false;

  void _handleTapBoxChanged(bool newState) {
    setState(() {
      _active = newState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new TapBox(active: _active, onChanged: _handleTapBoxChanged),
    );
  }
}

class TapBox extends StatefulWidget {
  const TapBox({Key key, this.active, @required this.onChanged})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _TapBoxState();
  }

  final bool active;
  final ValueChanged<bool> onChanged;
}

class _TapBoxState extends State<TapBox> {
  bool _highLight = false;
  void _handleTap() {
    widget.onChanged(!widget.active);
  }
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      onTapDown: _handleTapDown,
      onTapCancel: _handleTapCancel,
      onTapUp: _handleTapUp,
      child: new Container(
        child: new Center(
          child: new Text(widget.active ? 'Active' : 'Inactive',
              style: new TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highLight
              ? new Border.all(
            color: Colors.teal[700],
            width: 10.0,
          )
              : null,
        ),
      ),
    );
  }

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highLight = true;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highLight = false;
    });
  }
  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highLight = false;
    });
  }
}
