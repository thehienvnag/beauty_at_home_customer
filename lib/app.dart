import 'package:flutter/material.dart';
import 'package:flutter_app/src/utils/routes_name.dart';
import 'package:flutter_app/src/view/booking_history_detail.dart';
import 'package:flutter_app/src/view/booking_summary.dart';
import 'package:flutter_app/src/view/checkout_screen.dart';

import 'package:flutter_app/src/view/home_screen.dart';
import 'package:flutter_app/src/view/login_phone_screen.dart';
import 'package:flutter_app/src/view/login_screen.dart';
import 'package:flutter_app/src/view/promotion_screen.dart';
import 'package:flutter_app/src/view/provider_detail_screen.dart';
import 'package:flutter_app/src/view/service_detail_screen.dart';

class App extends StatelessWidget {
  const App({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter app",
      home: ProviderDetailScreen(),
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        Routes.home: (context) => HomeScreen(),
        Routes.loginPhone: (context) => LoginPhoneScreen(),
        Routes.promotionDetail: (context) => PromotionScreen(),
        Routes.historyDetail: (context) => BookingHistoryDetailScreen(),
        Routes.checkout: (context) => CheckoutScreen(),
        Routes.serviceDetail: (context) => ServiceDetailScreen(),
        Routes.bookingSummary: (context) => BookingHistoryDetailScreen(),
        Routes.bookingHistory: (context) => BookingHistoryDetailScreen(),
      },
    );
  }
}
