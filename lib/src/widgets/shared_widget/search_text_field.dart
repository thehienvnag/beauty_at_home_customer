import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: 42,
      width: screenSize.width * 0.93,
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 3),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: Colors.white,
              style: BorderStyle.solid,
            ),
          ),
          prefixIcon: Icon(Icons.search),
          hintText: 'Tìm kiếm dịch vụ...',
          hintStyle: TextStyle(
            color: Colors.grey.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
