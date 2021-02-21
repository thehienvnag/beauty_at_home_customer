import 'package:flutter/material.dart';
import 'package:flutter_app/src/view/blank_search.dart';


class ListSearchScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ListSearchScreenState();
}

class ListSearchScreenState extends State<ListSearchScreen> {

  @override
  Widget build(BuildContext context) {
    final String keySearch = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildBar(context),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Text('  Không có dịch vụ phù hợp',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
        ],
      ),
    );
  }
}

Widget _buildBar(BuildContext context) {
  final String keySearch = ModalRoute.of(context).settings.arguments;
  Size size = MediaQuery.of(context).size;
  var _controller = TextEditingController();
  return new AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leadingWidth: 0,
    title:
    Container(
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
          if (value.isNotEmpty) {
            Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => ListSearchScreen(),
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
