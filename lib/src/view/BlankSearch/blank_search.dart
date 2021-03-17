import 'package:flutter/material.dart';
import 'package:flutter_app/src/view/ListSearchScreen/list_search_screen.dart';
import 'package:flutter_app/src/widgets/shared_widget/search_text_field.dart';
import 'package:flutter_app/src/widgets/shared_widget/style.dart';

class BlankScreen extends StatefulWidget {
  @override
  _BlankScreenState createState() => _BlankScreenState();
}

List<String> listRecommend = List.from([
  "Cắt tóc",
  "Cắt tóc nam",
  "Nhuộm tóc",
  "Duỗi tóc",
  "Gội đầu",
  "Nails",
  "Massage",
  "Trang điểm",
  "Xăm lông mày",
  "Nặn mụn"
]);

List<String> listRecommendShort = List.from([
  "Cắt tóc",
  "Gội đầu",
  "Nails",
  "Massage",
  "Trang điểm",
]);

class _BlankScreenState extends State<BlankScreen> {
  @override
  Widget build(BuildContext context) {
    Future _press(String keySearch) async {
      Navigator.of(context).push(
        new MaterialPageRoute<dynamic>(
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
              child: Text(
                'Được tìm kiếm nhiều',
                style: CustomTextStyle.headerText(Colors.black87),
              ),
            ),
            SizedBox(height: 5),
            Wrap(
              children: _buildRecommends(listRecommend),
            ),
            Divider(
              color: Colors.black54,
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Bạn đã tìm kiếm',
                style: CustomTextStyle.headerText(Colors.black87),
              ),
            ),
            Wrap(
              children: _buildRecommends(listRecommendShort),
            ),
          ],
        )
        // : _listSearch(context),
        );
  }

  List<Widget> _buildRecommends(List<String> recommends) {
    return recommends
        .map<Widget>(
          (recommend) => Container(
            margin: EdgeInsets.only(right: 10),
            child: ActionChip(
              label: Text(
                recommend,
                style: CustomTextStyle.subtitleText(Colors.black87),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ListSearchScreen(),
                  settings: RouteSettings(arguments: recommend),
                ));
              },
            ),
          ),
        )
        .toList();
  }

  Widget _buildBar(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
        margin: EdgeInsets.only(top: 12, left: 10),
        height: 45,
        width: size.width * 0.90,
        color: Color(0xffF2F2F2),
        child: SearchTextField(
          isReadonly: false,
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
                onTap: press,
                child: Text(
                  '$keysearch',
                  style: TextStyle(fontSize: 20),
                ))),
      ),
    );
  }
}
