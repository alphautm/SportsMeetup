import 'package:flutter/material.dart';

class Bar extends StatelessWidget implements PreferredSizeWidget {
  const Bar({state}) : _state = state;

  final _state;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Sports Details',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      backgroundColor: Color.fromRGBO(64, 64, 64, 1),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.0);
}
