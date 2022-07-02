import 'package:flutter/material.dart';

class Bar extends StatelessWidget implements PreferredSizeWidget {
  const Bar({state}) : _state = state;

  final _state;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'My Joined Sports',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      actions: [
        Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.filter_alt),
            onPressed: () => Scaffold.of(context).openEndDrawer(),
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          ),
        ),
      ],
      backgroundColor: Color.fromRGBO(0, 60, 129, 1),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.0);
}
