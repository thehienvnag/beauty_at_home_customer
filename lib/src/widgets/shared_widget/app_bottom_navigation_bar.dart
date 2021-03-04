import 'package:flutter/material.dart';
import 'package:flutter_app/src/view/history_screen.dart';

import 'package:flutter_app/src/view/home_screen.dart';
<<<<<<< HEAD
import 'package:flutter_app/src/view/notification_screen.dart';
=======
import 'package:flutter_app/src/view/profile_screen.dart';
>>>>>>> origin/feature/FE/LongDH/CR_Code_BookingActivity&UserProfile
import 'package:flutter_app/src/view/search_screen.dart';

class AppBottomNavigationBar extends StatelessWidget {
  final int currentActiveIndex;
  AppBottomNavigationBar({
    Key key,
    this.currentActiveIndex,
  }) : super(key: key);
  final dynamic currentScreenState = {
    0: HomeScreen(),
    1: SearchPage(),
<<<<<<< HEAD
    3: NotificationScreen(),
=======
    2: HistoryScreen(),
    4: ProfileScreen(),
>>>>>>> origin/feature/FE/LongDH/CR_Code_BookingActivity&UserProfile
  };

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentActiveIndex,
      selectedItemColor: Color(0xff0DB5B4),
      unselectedItemColor: Color(0xffC4C4C4),
      onTap: (value) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => currentScreenState[value],
        ));
      },
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
