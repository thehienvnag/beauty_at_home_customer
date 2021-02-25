import 'package:flutter/material.dart';
import 'package:flutter_app/src/utils/widgets_utils.dart';
import 'package:flutter_app/src/view/blank_search.dart';
import 'package:flutter_app/src/widgets/search_screen_widget.dart';
import 'list_search_screen.dart';
import 'list_search_screen_noFound.dart';

class SearchPage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<SearchPage> {
  bool _selectedIndex = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildBar(context),
      body: _selectedIndex
          ? Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10),
                      Container(
                          alignment: Alignment.topLeft,
                          child: Text(' ĐÃ XEM GẦN ĐÂY',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ))),
                      SizedBox(height: 10),
                      ViewsServices(),
                      Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            ' GIỚI THIỆU CHO BẠN',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          )),
                      SizedBox(height: 10),
                      LoadServices(),
                    ],
                  ),
                ),
              ],
            )
          : ListView(
              padding: EdgeInsets.all(10.0),
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Được tìm kiếm nhiều',
                      style: TextStyle(color: Colors.black, fontSize: 27)),
                ),
                SizedBox(height: 5),
                Container(
                  width: size.width,
                  child: Row(children: [
                    ServiceInvite(
                      keysearch: 'Nail thái',
                      press: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ListSearchScreen(),
                          settings: RouteSettings(arguments: 'Nail thái'))),
                    ),
                    ServiceInvite(
                      keysearch: 'Nail hạt dẻ',
                      press: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ListSearchScreen(),
                          settings: RouteSettings(arguments: 'Nail hạt dẻ'))),
                    ),
                    ServiceInvite(
                      keysearch: 'Trang điểm',
                      press: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ListSearchScreen(),
                          settings: RouteSettings(arguments: 'Trang điểm'))),
                    )
                  ]),
                ),
                Container(
                  width: size.width,
                  child: Row(children: [
                    ServiceInvite(
                      keysearch: 'Làm tóc',
                      press: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ListSearchScreen(),
                          settings: RouteSettings(arguments: 'Tóc'))),
                    ),
                    ServiceInvite(
                      keysearch: 'Nối mi',
                      press: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ListSearchScreen(),
                          settings: RouteSettings(arguments: 'Mi'))),
                    ),
                    ServiceInvite(
                      keysearch: 'Massage thân',
                      press: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ListSearchScreen(),
                          settings: RouteSettings(arguments: 'Massage'))),
                    )
                  ]),
                ),
                Container(
                  width: size.width,
                  child: Row(children: [
                    ServiceInvite(
                      keysearch: 'Trang điểm tiệc',
                      press: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ListSearchScreen(),
                          settings: RouteSettings(arguments: 'Trang điểm'))),
                    ),
                    ServiceInvite(
                      keysearch: 'Uốn tóc đẹp',
                      press: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ListSearchScreen(),
                          settings: RouteSettings(arguments: 'Tóc đẹp'))),
                    ),
                  ]),
                ),
                SizedBox(height: 20),
                Container(width: size.width, height: 2, color: Colors.black),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Lịch sử tìm kiếm của bạn',
                      style: TextStyle(color: Colors.black, fontSize: 27)),
                ),
                SizedBox(height: 10),
                Container(
                  width: size.width,
                  child: Row(children: [
                    ServiceInvite(
                      keysearch: 'trang diem',
                      press: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ListSearchScreen(),
                          settings: RouteSettings(arguments: 'trang diem'))),
                    ),
                    ServiceInvite(
                      keysearch: 'son mong',
                      press: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ListSearchScreen(),
                          settings: RouteSettings(arguments: 'son mong'))),
                    ),
                    ServiceInvite(
                      keysearch: 'dam lung',
                      press: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ListSearchScreen(),
                          settings: RouteSettings(arguments: 'dam lung'))),
                    )
                  ]),
                ),
                Container(
                  width: size.width,
                  child: Row(children: [
                    ServiceInvite(
                      keysearch: 'son mong tay dep',
                      press: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ListSearchScreen(),
                          settings: RouteSettings(arguments: 'son mong tay'))),
                    ),
                    ServiceInvite(
                      keysearch: 'lam toc quan 9',
                      press: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ListSearchScreen(),
                          settings:
                              RouteSettings(arguments: 'lam toc quan 9'))),
                    ),
                  ]),
                ),
              ],
            ),
      bottomNavigationBar: WidgetUtils.appBottomNavigationBar(1),
    );
  }

  Widget _buildBar(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var _controller = TextEditingController();
    return new AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leadingWidth: 0,
      title: Container(
        margin: EdgeInsets.only(top: 12),
        height: 45,
        width: size.width,
        color: Color(0xffF2F2F2),
        child: TextField(
          //onTap: _buttonTapped,
          onTap: () {
            setState(() {
              this._selectedIndex = !this._selectedIndex;
            });
          },
          onSubmitted: (value) {
            if (value.isNotEmpty && value.length < 25) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ListSearchScreen(),
                  settings: RouteSettings(arguments: value)));
            } else if (value.length > 25) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ListSearchScreenNotFound(),
                  settings: RouteSettings(arguments: value)));
            }
          },
          controller: _controller,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 3),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              prefixIcon: Icon(Icons.search),
              hintText: 'Tìm kiếm dịch vụ...',
              suffixIcon: IconButton(
                onPressed: () => _controller.clear(),
                icon: Icon(Icons.clear),
              )),
        ),
      ),
    );
  }

  Future _buttonTapped() async {
    Navigator.of(context).push(new MaterialPageRoute<dynamic>(
      builder: (context) => BlankScreen(),
    ));
  }
}
