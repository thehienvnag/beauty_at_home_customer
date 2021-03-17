import 'package:flutter/material.dart';
import 'package:flutter_app/src/view/rating_screen.dart';
import 'package:flutter_app/src/widgets/shared_widget.dart';

class BeauticianHistoryDescription extends StatelessWidget {
  const BeauticianHistoryDescription({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FullWidthCard(
      marginTop: 10,
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      sections: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('public/img/beautician_test.png'),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.redAccent,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 7),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Marry Trần',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 6),
                        child: Column(
                          children: [
                            Text(
                              'Service  •  GF-276',
                              style: TextStyle(color: Colors.black54),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            TextButton(
              child: Text(
                'Đánh giá',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => RatingScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
