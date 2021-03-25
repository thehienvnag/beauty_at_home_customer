import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/view/BlankSearch/blank_search.dart';
import 'package:flutter_app/src/view/ListSearchScreen/list_search_screen.dart';
import 'package:flutter_app/src/view/ListSearchScreen/list_search_screen_no_found.dart';
import 'package:flutter_app/src/widgets/shared_widget/style.dart';

class SearchTextField extends StatelessWidget {
  final bool isReadonly;
  final String initialValue;

  const SearchTextField({Key key, this.isReadonly, this.initialValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: 42,
      width: screenSize.width * 0.93,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(3),
      ),
      child: TextFormField(
        readOnly: isReadonly,
        onFieldSubmitted: (value) {
          // if (value.length > 3) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => ListSearchScreen(
                searchQuery: value,
              ),
              settings: RouteSettings(arguments: value),
            ),
          );
          // } else {
          //   Navigator.of(context).push(MaterialPageRoute(
          //       builder: (context) => ListSearchScreenNotFound(),
          //       settings: RouteSettings(arguments: value)));
          // }
        },
        onTap: () {
          if (isReadonly) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BlankScreen(),
            ));
          }
        },
        cursorColor: Colors.black,
        cursorHeight: 22,
        cursorWidth: 1,
        initialValue: initialValue ?? initialValue,
        decoration: new InputDecoration(
          prefixIcon: Icon(Icons.search_rounded, color: Color(0xff0DB5B4)),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding:
              EdgeInsets.only(left: 15, bottom: 17, top: 11, right: 15),
          hintText: 'Tìm kiếm dịch vụ...',
          hintStyle: CustomTextStyle.subtitleText(Colors.grey),
          labelStyle: CustomTextStyle.subtitleText(Colors.black),
        ),
      ),
    );
  }
}
