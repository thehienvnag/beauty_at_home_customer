import 'package:flutter/material.dart';

class DetailScreenAppBar extends StatelessWidget {
  final Widget title;
  final bool disabledBack;
  final bool previousBack;
  const DetailScreenAppBar({
    Key key,
    this.title,
    this.disabledBack = false,
    this.previousBack,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.5,
      centerTitle: true,
      leading: disabledBack
          ? Icon(
              Icons.height,
              color: Colors.transparent,
            )
          : IconButton(
              padding: EdgeInsets.only(bottom: 3),
              icon: this.previousBack
                  ? Icon(
                      Icons.arrow_back_ios,
                      size: 23,
                    )
                  : Icon(Icons.keyboard_arrow_down_outlined),
              color: Colors.grey,
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
