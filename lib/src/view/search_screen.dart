import 'package:flutter/material.dart';
import 'package:flutter_app/src/utils/widgets_utils.dart';
import 'package:flutter_app/src/view/blank_search.dart';
import 'package:flutter_app/src/widgets/search_screen_widget.dart';
import 'list_search_screen.dart';
import 'list_search_screen_no_found.dart';

class SearchPage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildBar(context),
      body: Stack(
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
          onTap: _buttonTapped,
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
