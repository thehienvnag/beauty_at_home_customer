import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_app/src/widgets/home_screen_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: HomeAppBarTitle(),
        actions: [
          Container(
            child: CircleAvatar(
              backgroundImage: AssetImage('public/img/meo.jpg'),
              radius: 20,
            ),
            margin: EdgeInsets.only(right: 10),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 12),
            ),
            Container(
              height: 47,
              width: 340,
              color: Colors.white,
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 3),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Tìm kiếm dịch vụ...',
                ),
              ),
            ),
            SlideService(),
            ServiceWidget(),
            BeauticianWidget()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
      ),
    );
  }
}
