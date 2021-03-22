import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/models/cart_item.dart';
import 'package:flutter_app/src/providers/booking_provider.dart';
import 'package:flutter_app/src/utils/routes_name.dart';
import 'package:flutter_app/src/utils/utils.dart';
import 'package:flutter_app/src/widgets/booking_summary_widget.dart';
import 'package:flutter_app/src/widgets/shared_widget.dart';
import 'package:flutter_app/src/widgets/shared_widget/style.dart';
import 'package:flutter_app/src/widgets/wait_confirm_screen_widget.dart';
import 'package:provider/provider.dart';

final List<Widget> dynamicContents = [
  CoverImage(
    path: 'public/img/cus_wait_confirm.png',
  ),
  CoverImage(
    path: 'public/img/cus_under_working.png',
  ),
];

class BookingSummary extends StatefulWidget {
  const BookingSummary({
    Key key,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => _BookingSummaryState();
}

class _BookingSummaryState extends State<BookingSummary> {
  int currentStep = 0;
  bool _isContinue = true;
  @override
  void initState() {
    super.initState();
    context.read<BookingProvider>().initBookingById('16');

    // Utils.redoTaskPerDuration(
    //     () {
    //       setState(() {
    //         currentStep++;
    //       });
    //     },
    //     10000,
    //     1,
    //     () {
    //       if (_isContinue) {
    //         Navigator.of(context).pushReplacementNamed(Routes.bookingHistory);
    //       }
    //     });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
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
        body: dynamicContents[currentStep],
        panelContents: [
          BookingProgress(
            currentStepIndex: 1,
          ),
          Consumer<BookingProvider>(
            builder: (context, value, child) {
              return BeauticianDescription(
                image: value.bookingModel?.beautyArtistAccount?.gallery?.images
                    ?.first?.imageUrl,
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
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                width: screenSize.width * 0.95,
                sections: [
                  LocationSummary(
                    address: value.bookingModel?.status,
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
