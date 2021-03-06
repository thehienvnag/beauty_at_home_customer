import 'package:flutter/material.dart';
import 'package:flutter_app/src/widgets/shared_widget/style.dart';

class HomeAppBarTitle extends StatelessWidget {
  const HomeAppBarTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Icon(
          Icons.location_on,
          color: Color(0xff0DB5B4),
        ),
        Text(
          ' 5/3 đường số 9',
          style: CustomTextStyle.titleText(Colors.black),
        ),
      ],
    );
  }
}
