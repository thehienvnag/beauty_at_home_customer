import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class _bottomBar extends StatelessWidget {
  const _bottomBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Color(0xff0DB5B4),
      unselectedItemColor: Color(0xffC4C4C4),
      items: [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(
            Icons.home,
          ),
        ),
        BottomNavigationBarItem(
          label: 'Search',
          icon: Icon(
            Icons.search,
          ),
        ),
        BottomNavigationBarItem(
          label: 'Activity',
          icon: Icon(
            Icons.list,
          ),
        ),
        BottomNavigationBarItem(
          label: 'Messages',
          icon: Icon(
            Icons.message,
          ),
        ),
        BottomNavigationBarItem(
          label: 'Account',
          icon: Icon(
            Icons.account_circle,
          ),
        ),
      ],
    );
  }
}