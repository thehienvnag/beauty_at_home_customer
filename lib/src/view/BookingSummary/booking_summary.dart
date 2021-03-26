import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/models-new/booking_model.dart';
import 'package:flutter_app/src/providers/account_provider.dart';
import 'package:flutter_app/src/providers/booking_provider.dart';
import 'package:flutter_app/src/providers/cart_provider.dart';
import 'package:flutter_app/src/utils/firebase_helper.dart';
import 'package:flutter_app/src/utils/routes_name.dart';
import 'package:flutter_app/src/widgets/booking_summary_widget.dart';
import 'package:flutter_app/src/widgets/shared_widget.dart';
import 'package:flutter_app/src/widgets/shared_widget/style.dart';
import 'package:flutter_app/src/widgets/wait_confirm_screen_widget.dart';
import 'package:provider/provider.dart';

final Widget image_1 = CoverImage(
  path: 'public/img/cus_wait_confirm.png',
);
final Widget image_2 = CoverImage(
  path: 'public/img/cus_under_working.png',
);

final List<Widget> dynamicContents = [
  CoverImage(
    path: 'public/img/cus_wait_confirm.png',
  ),
  CoverImage(
    path: 'public/img/cus_wait_confirm.png',
  ),
  CoverImage(
    path: 'public/img/cus_under_working.png',
  ),
  CoverImage(
    path: 'public/img/cus_wait_confirm.png',
  ),
  CoverImage(
    path: 'public/img/cus_wait_confirm.png',
  ),
];

class BookingSummary extends StatefulWidget {
  final String id;
  const BookingSummary({
    Key key,
    this.id,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => _BookingSummaryState();
}

class _BookingSummaryState extends State<BookingSummary> {
  int currentStep = 0;

  @override
  void initState() {
    super.initState();
    var bookingProvider = context.read<BookingProvider>();
    bookingProvider.initBookingById(widget.id);
    FirebaseHelper.fcmInstance()
        .subscribeToTopic("booking_changed_id_" + widget.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    BookingModel model = context
        .select<BookingProvider, BookingModel>((value) => value.bookingModel);
    return model == null
        ? Scaffold(
          body: Align(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            ),
        )
        : Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: DetailScreenAppBar(
                disabledBack: true,
                title: Text(
                  'Booking Summary',
                  style: TextStyle(color: Color(0xff636363), fontSize: 18),
                ),
              ),
            ),
            body: SlidingUpView(
              minHeight: screenSize.height * 0.4,
              maxHeight: screenSize.height * 0.6,
              body: Consumer<CartProvider>(
                builder: (context, value, child) =>
                    //dynamicContents[value.progressIndex],
                Column(children:<Widget> [
                  if(value.progressIndex == 0)  image_1,
                  if(value.progressIndex == 1)  image_1,
                  if(value.progressIndex == 2)  image_2,
                  if(value.progressIndex == 3)  image_2

                ],)
              ),
              panelContents: [
                Consumer<CartProvider>(
                  builder: (context, value, child) => BookingProgress(),
                ),
                Consumer<BookingProvider>(
                  builder: (context, value, child) {
                    return BeauticianDescription(
                      image: value.bookingModel?.beautyArtistAccount?.gallery
                          ?.images?.first?.imageUrl,
                      beauticianName:
                          value.bookingModel?.beautyArtistAccount?.displayName,
                      mainService: value.bookingModel?.status,
                      phone: value.bookingModel?.beautyArtistAccount?.phone,
                    );
                  },
                ),
                Consumer<BookingProvider>(
                  builder: (context, value, child) {
                    return OutlinedCard(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                      width: screenSize.width * 0.95,
                      sections: [
                        Consumer<AccountProvider>(
                          builder: (context, value, child) => LocationSummary(
                            address: value.currentAddress,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                Consumer<BookingProvider>(
                  builder: (context, value, child) {
                    return OrderDescription(
                      title: 'Tóm tắt đơn',
                      priceBefore: '650.000đ',
                      listItem: value.bookingModel?.bookingDetails,
                    );
                  },
                ),
                OutlinedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => AlertDialog(
                        // title: Text("Bạn có chắc muốn hủy đơn?"),
                        content: Text("Bạn có muốn hủy đơn không?",
                            style: CustomTextStyle.statusText(Colors.black54)),
                        actions: [
                          FlatButton(
                            textColor: Color(0xFF6200EE),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Không'),
                          ),
                          FlatButton(
                            textColor: Color(0xFF6200EE),
                            onPressed: () async {
                              final result = await Navigator.of(context)
                                  .pushReplacementNamed(Routes.cancelReason);
                            },
                            child: Text('Đồng ý'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Text("HỦY ĐƠN"),
                )
              ],
            ),
          );
  }
}
