import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/src/widgets/search_service_screen_widget/list_search_service.dart';
import 'package:flutter_app/src/widgets/shared_widget/search_text_field.dart';
import 'package:flutter_app/src/widgets/shared_widget/style.dart';

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
      body: Column(
        children: [
          Row(
            children: [
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(right: 10),
                child: Text(
                  '   Bộ lọc',
                  style: CustomTextStyle.titleText(Colors.black87),
                ),
              ),
              ActionChip(
                label: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${keySearch}',
                      style: CustomTextStyle.subtitleText(Colors.black87),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Icon(
                        Icons.close,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          Container(
              margin: EdgeInsets.only(top: 10, bottom: 5),
              alignment: Alignment.topLeft,
              child: Text(
                '    #Tìm thấy 15 dịch vụ',
                style: CustomTextStyle.subtitleText(Colors.black87),
              )),
          ListSearchServices(),
        ],
      ),
    );
  }
}

Widget _buildBar(BuildContext context) {
  final String keySearch = ModalRoute.of(context).settings.arguments;
  Size size = MediaQuery.of(context).size;
  return new AppBar(
    backgroundColor: Colors.white,
    leading: IconButton(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
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
      width: size.width * 0.92,
      color: Color(0xffF2F2F2),
      child: SearchTextField(
        isReadonly: false,
        initialValue: keySearch,
      ),
    ),
  );
}