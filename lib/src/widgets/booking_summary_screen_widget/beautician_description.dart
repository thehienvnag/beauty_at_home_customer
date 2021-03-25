import 'package:flutter/material.dart';
import 'package:flutter_app/src/widgets/shared_widget.dart';

class BeauticianDescription extends StatelessWidget {
  final String image, beauticianName, mainService, phone;
  const BeauticianDescription({
    Key key,
    this.mainService,
    this.image,
    this.beauticianName,
    this.phone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return OutlinedCard(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
      width: screenSize.width * 0.95,
      sections: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.network(
                  this.image,
                  width: 45,
                ),
                Container(
                  margin: EdgeInsets.only(left: 7),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        this.beauticianName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            IconButton(
              icon: Icon(
                Icons.phone,
                color: Colors.black54,
              ),
              onPressed: () {},
            ),
          ],
        )
      ],
    );
  }
}
