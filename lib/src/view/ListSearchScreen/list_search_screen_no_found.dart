import 'package:flutter/material.dart';
import 'package:flutter_app/src/view/BlankSearch/blank_search.dart';
import 'package:flutter_app/src/widgets/search_screen_widget.dart';
import 'list_search_screen.dart';

class ListSearchScreenNotFound extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ListSearchScreenState();
}

class ListSearchScreenState extends State<ListSearchScreenNotFound> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _buildBar(context),
        body: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        ' Không có dịch vụ phù hợp',
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 20),
                      )),
                  SizedBox(height: 10),
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
        ));
  }
}

Widget _buildBar(BuildContext context) {
  final String keySearch = ModalRoute.of(context).settings.arguments;
  Size size = MediaQuery.of(context).size;
  var _controller = TextEditingController();
  return new AppBar(
    backgroundColor: Colors.white,
    leading: IconButton(
      padding: EdgeInsets.only(top: 10, left: 10),
      icon: Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    elevation: 0,
    leadingWidth: 20,
    title: Container(
      margin: EdgeInsets.only(top: 12),
      height: 45,
      width: size.width,
      color: Color(0xffF2F2F2),
      child: TextField(
        textInputAction: TextInputAction.search,
        controller: _controller..text = '$keySearch',
        cursorColor: Colors.red,
        cursorHeight: 20,
        style: TextStyle(
          height: 1,
        ),
        onSubmitted: (value) {
          if (value.isNotEmpty && value.length < 22) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ListSearchScreen(),
                settings: RouteSettings(arguments: value)));
          } else if (value.length > 22) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ListSearchScreenNotFound(),
                settings: RouteSettings(arguments: value)));
          }
        },
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 6.0),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(
                    color: Colors.grey.withOpacity(0.2), width: 0.5)),
            hintText: 'Tìm kiếm dịch vụ...',
            prefixIcon: Icon(
              Icons.search,
              size: 25.0,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BlankScreen(),
                ));
                _controller.clear();
              },
              icon: Icon(Icons.clear),
            )),
      ),
    ),
  );
}
