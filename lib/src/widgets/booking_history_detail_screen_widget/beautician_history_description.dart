import 'package:flutter/material.dart';
import 'package:flutter_app/src/providers/booking_provider.dart';
import 'package:flutter_app/src/view/Rating/rating_screen.dart';
import 'package:flutter_app/src/widgets/shared_widget.dart';
import 'package:provider/provider.dart';

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
                Consumer<BookingProvider>(
                  builder: (context, value, child) {
                    String imageUrl = value.bookingModel?.beautyArtistAccount
                        ?.gallery?.images?.first?.imageUrl;
                    return Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(imageUrl),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.redAccent,
                      ),
                    );
                  },
                ),
                Container(
                  margin: EdgeInsets.only(left: 7),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Consumer<BookingProvider>(
                        builder: (context, value, child) => Text(
                          value.bookingModel?.beautyArtistAccount.displayName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 6),
                        child: Column(
                          children: [
                            Consumer<BookingProvider>(
                              builder: (context, value, child) {
                                return Text(
                                  'Service  •  GF-' +
                                      value.bookingModel?.id.toString(),
                                  style: TextStyle(color: Colors.black54),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
