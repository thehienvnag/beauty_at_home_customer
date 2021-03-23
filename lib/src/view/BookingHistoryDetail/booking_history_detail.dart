import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/models/cart_item.dart';
import 'package:flutter_app/src/providers/booking_provider.dart';
import 'package:flutter_app/src/utils/utils.dart';
import 'package:flutter_app/src/view/HomeScreen/home_screen.dart';
import 'package:flutter_app/src/widgets/booking_history_detail_screen_widget/beautician_history_description.dart';
import 'package:flutter_app/src/widgets/booking_history_detail_screen_widget/booking_description.dart';
import 'package:flutter_app/src/widgets/booking_history_detail_screen_widget/booking_total.dart';
import 'package:flutter_app/src/widgets/booking_summary_screen_widget/location_summary.dart';
import 'package:flutter_app/src/widgets/shared_widget/detail_screen_appbar.dart';
import 'package:flutter_app/src/widgets/shared_widget/fullwidth_card.dart';
import 'package:provider/provider.dart';

class BookingHistoryDetailScreen extends StatefulWidget {
  @override
  _BookingHistoryDetailScreenState createState() =>
      _BookingHistoryDetailScreenState();
}

class _BookingHistoryDetailScreenState
    extends State<BookingHistoryDetailScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<BookingProvider>().initBookingById('37');
    // Future(() async {
    //   await Future.delayed(Duration(seconds: 15));
    //   Navigator.of(context).push(MaterialPageRoute(
    //     builder: (context) => HomeScreen(),
    //   ));
    // }).then((value) => {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: DetailScreenAppBar(
          disabledBack: true,
          title: Consumer<BookingProvider>(
            builder: (context, value, child) {
              DateTime date = value.bookingModel?.createDate;
              return Text(
                date.toString(),
                style: TextStyle(color: Color(0xff636363), fontSize: 16),
              );
            },
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          BeauticianHistoryDescription(),
          FullWidthCard(
            marginTop: 10,
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            sections: [
              Consumer<BookingProvider>(
                builder: (context, value, child) {
                  String endAddress = value.bookingModel?.endAddress;
                  return LocationSummary(
                    address: endAddress,
                  );
                },
              ),
            ],
          ),
          Consumer<BookingProvider>(
            builder: (context, value, child) {
              return BookingDescription(
                itemList: value.bookingModel?.bookingDetails,
              );
            },
          ),
          Consumer<BookingProvider>(
            builder: (context, value, child) {
              // double totalPriceAft = (value.bookingModel?.totalFee +
              //     value.bookingModel?.transportFee);
              return BookingTotal(
                totalPriceBefore: Utils.formatPrice(
                  value.bookingModel.totalFee.toString(),
                ),
                totalPriceAfter: Utils.formatPrice(
                  value.bookingModel.totalFee.toString(),
                ),
                applicableFee: value.bookingModel?.transportFee.toString(),
                paymentMethod: 'momo',
              );
            },
          )
        ],
      ),
    );
  }
}
