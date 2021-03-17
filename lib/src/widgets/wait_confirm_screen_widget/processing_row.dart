import 'package:flutter/material.dart';

class ProcessingRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          child: Row(
            children: [
              Container(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text('Đang xử lý...'),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Hủy đơn',
            style: TextStyle(
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}
