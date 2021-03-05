import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/utils/widgets_utils.dart';
import 'package:flutter_app/src/widgets/home_screen_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isScrollTop = false;
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(95),
        child: AppBar(
          bottom: PreferredSize(
            child: WidgetUtils.searchTextField,
            preferredSize: Size.fromHeight(30),
          ),
          elevation: isScrollTop ? 0 : 1,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          actions: [
            Container(
              width: screenSize.width * 0.95,
              padding: EdgeInsets.only(right: 10, top: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      HomeAppBarTitle(),
                      Container(
                        child: CircleAvatar(
                          backgroundImage: AssetImage('public/img/meo.jpg'),
                          radius: 17,
                        ),
                        margin: EdgeInsets.only(right: 10),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: NotificationListener(
        onNotification: (notification) {
          if (notification is ScrollNotification) {
            if (_scrollController.position.pixels == 0) {
              setState(() {
                isScrollTop = true;
              });
            } else {
              setState(() {
                isScrollTop = false;
              });
            }
          }
          return;
        },
        child: SingleChildScrollView(
          controller: _scrollController,
          scrollDirection: Axis.vertical,
          child: Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 12),
                ),
                SlideService(),
                ServiceWidget(),
                BeauticianWidget()
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: WidgetUtils.appBottomNavigationBar(0),
    );
  }
}
