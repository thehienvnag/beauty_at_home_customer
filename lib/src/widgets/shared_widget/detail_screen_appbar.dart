import 'package:flutter/material.dart';

class DetailScreenAppBar extends StatelessWidget {
  final Widget title;
  final bool disabledBack;
  const DetailScreenAppBar({
    Key key,
    this.title, this.disabledBack,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.5,
      centerTitle: true,
      leading: disabledBack ? Icon(Icons.height, color: Colors.transparent,): IconButton(
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
