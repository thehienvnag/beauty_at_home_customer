import 'package:flutter/material.dart';
import 'package:flutter_app/src/view/blank_search.dart';
import 'package:flutter_app/src/widgets/search_screen_widget.dart';

class SearchPage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildBar(context),
      body:
      ListView(
        padding: EdgeInsets.only(left: 10),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          SizedBox(height: 10),
          Text(' ĐÃ XEM GẦN ĐÂY', style: TextStyle(color: Colors.black, fontSize: 20,)), SizedBox(height: 10),
          ViewsServices(),
          Text(' GIỚI THIỆU CHO BẠN',style: TextStyle(color: Colors.black,fontSize: 20,)),SizedBox(height: 10),
          RecomendServices(),
        ],
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

  Future _buttonTapped() async {
    Navigator.of(context).push(new MaterialPageRoute<dynamic>(
      builder: (BuildContext context) {
        return new BlankScreen();
      },
    ));
  }

  Widget _buildBar(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return new AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leadingWidth: 0,
      title: Container(
        margin: EdgeInsets.only(top:12),
        height: 45,
        width: size.width,
        color: Color(0xffF2F2F2),
        child: TextField(
          onTap: _buttonTapped,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 3),
              border:OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              prefixIcon: Icon(Icons.search),
              hintText: 'Tìm kiếm dịch vụ...',
          ),
        ),
      ),
    );
  }
}
