import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: 47,
      width: screenSize.width * 0.95,
      color: Colors.white,
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 3),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          prefixIcon: Icon(Icons.search),
          hintText: 'Tìm kiếm dịch vụ...',
        ),
      ),
    );
  }
}
