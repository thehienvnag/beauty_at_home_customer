import 'package:flutter/material.dart';
import 'package:flutter_app/src/utils/routes_name.dart';
import 'package:flutter_app/src/view/BookingHistoryDetail/booking_history_detail.dart';
import 'package:flutter_app/src/view/BookingSummary/booking_summary.dart';
import 'package:flutter_app/src/view/CancelReason/cancel_reason.dart';
import 'package:flutter_app/src/view/Checkout/checkout_screen.dart';
import 'package:flutter_app/src/view/HomeScreen/home_screen.dart';
import 'package:flutter_app/src/view/Login/login_phone_screen.dart';
import 'package:flutter_app/src/view/Login/login_screen.dart';
import 'package:flutter_app/src/view/Promotion/promotion_screen.dart';
import 'package:flutter_app/src/view/ProviderDetail/provider_detail_screen.dart';
import 'package:flutter_app/src/view/ServiceDetailScreen/service_detail_screen.dart';

class App extends StatelessWidget {
  const App({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter app",
      home: LoginScreen(),
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        Routes.home: (context) => HomeScreen(),
        Routes.loginPhone: (context) => LoginPhoneScreen(),
        Routes.promotionDetail: (context) => PromotionScreen(),
        Routes.historyDetail: (context) => BookingHistoryDetailScreen(),
        Routes.checkout: (context) => CheckoutScreen(),
        Routes.serviceDetail: (context) => ServiceDetailScreen(),
        Routes.bookingSummary: (context) => BookingSummary(),
        Routes.bookingHistory: (context) => BookingHistoryDetailScreen(),
        Routes.provider: (context) => ProviderDetailScreen(),
        Routes.cancelReason: (context) => CancelReason()
      },
    );
  }
}
