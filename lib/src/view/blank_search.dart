import 'package:flutter/material.dart';
import 'package:flutter_app/src/view/list_search_screen.dart';
import 'list_search_screen_noFound.dart';

class BlankScreen extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<BlankScreen> {
  @override
  Widget build(BuildContext context) {
    Future _press(String keySearch) async {
      Navigator.of(context).push(new MaterialPageRoute<dynamic>(
          builder: (context) => ListSearchScreen(),
          settings: RouteSettings(arguments: keySearch)),
      );
    }
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _buildBar(context),
        body: ListView(
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
                  press: () => _press('Nail Thái'),
                ),
                ServiceInvite(
                  keysearch: 'Nail hạt dẻ',
                  press: () => _press('Nail hạt dẻ'),
                ),
                ServiceInvite(
                  keysearch: 'Trang điểm',
                  press: () => _press('Trang điểm'),
                )
              ]),
            ),
            Container(
              width: size.width,
              child: Row(children: [
                ServiceInvite(
                  keysearch: 'Làm tóc',
                  press: () => _press('Làm tóc'),
                ),
                ServiceInvite(
                  keysearch: 'Nối mi',
                  press: () => _press('Mi'),
                ),
                ServiceInvite(
                  keysearch: 'Massage thân',
                  press: () => _press('Massage'),
                )
              ]),
            ),
            Container(
              width: size.width,
              child: Row(children: [
                ServiceInvite(
                  keysearch: 'Trang điểm tiệc',
                  press: () => _press('Trang điểm tiệc'),
                ),
                ServiceInvite(
                  keysearch: 'Uốn tóc đẹp',
                  press: () => _press('Tóc đẹp'),
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
                  press: () => _press('trang diem'),
                ),
                ServiceInvite(
                  keysearch: 'son mong',
                  press: () => _press('son mong'),
                ),
                ServiceInvite(
                  keysearch: 'dam lung',
                  press: () => _press('dam lung'),
                )
              ]),
            ),
            Container(
              width: size.width,
              child: Row(children: [
                ServiceInvite(
                  keysearch: 'son mong tay dep',
                  press: () => _press('son mong tay dep'),
                ),
                ServiceInvite(
                  keysearch: 'lam toc quan 9',
                  press: () => _press('lam toc quan 9'),
                ),
              ]),
            ),
          ],
        )
        // : _listSearch(context),
        );
  }

  Widget _buildBar(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var _controller = TextEditingController();
    return new AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        padding: EdgeInsets.only(top: 10,left: 10),
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
          controller: _controller,
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
}

class ServiceInvite extends StatelessWidget {
  const ServiceInvite({
    Key key,
    this.keysearch,
    this.press,
  }) : super(key: key);
  final String keysearch;
  final Function press;



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Card(
        color: Color(0xffDCD9D9),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(
              color: Colors.grey.withOpacity(0.8),
              width: 0.2,
            )),
        child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: GestureDetector(
                onTap: press ,
                child: Text(
                  '$keysearch',
                  style: TextStyle(fontSize: 20),
                ))),
      ),
    );
  }
}
