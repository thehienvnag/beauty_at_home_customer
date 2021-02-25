import 'package:flutter/material.dart';

class DetailScreenAppBar extends StatelessWidget {
  final Widget title;
  const DetailScreenAppBar({
    Key key,
    this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.5,
      centerTitle: true,
      leading: IconButton(
        padding: EdgeInsets.only(bottom: 3),
        icon: Icon(Icons.keyboard_arrow_down_outlined),
        color: Color(0xff636363),
        onPressed: () {
          Navigator.pop(context);
        },
        iconSize: 40,
      ),
      backgroundColor: Colors.white,
      title: this.title,
    );
  }
}
