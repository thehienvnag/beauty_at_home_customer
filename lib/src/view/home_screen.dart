import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/utils/widgets_utils.dart';
import 'package:flutter_app/src/widgets/home_screen_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 12),
            ),
            WidgetUtils.searchTextField,
            SlideService(),
            ServiceWidget(),
            BeauticianWidget()
          ],
        ),
      ),
      bottomNavigationBar: WidgetUtils.appBottomNavigationBar(0),
    );
  }
}
