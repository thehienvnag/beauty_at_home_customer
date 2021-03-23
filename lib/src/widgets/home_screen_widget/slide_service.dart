import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/widgets/search_screen_widget.dart';
import 'package:flutter_app/src/widgets/shared_widget/style.dart';

class SlideService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'DỊCH VỤ NỔI BẬT',
                style: CustomTextStyle.headline600Text(
                  Colors.orange,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: ViewsServices(),
            ),
          ],
        ),
      ),
    );
  }
}

class Service extends StatelessWidget {
  final String image;
  final Function press;
  const Service({
    Key key,
    this.image,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(right: 13),
        width: size.width * 0.8,
        height: 150,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 0.5,
          ),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(image),
          ),
        ),
      ),
    );
  }
}
