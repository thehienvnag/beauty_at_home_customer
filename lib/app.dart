import 'package:flutter/material.dart';
import 'package:flutter_app/src/presenter/booking_summary_presenter.dart';
import 'package:flutter_app/src/view/booking_summary.dart';

import 'package:flutter_app/src/view/home_screen.dart';
import 'package:flutter_app/src/view/login_screen.dart';
import 'package:flutter_app/src/view/provider_confirm_screen.dart';
import 'package:flutter_app/src/widgets/push_notification_service.dart';

class App extends StatelessWidget {
  const App({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter app",
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        //'/': (context) => HomeScreen(),
        //'/': (context) => CheckoutScreen(),
        //'/': (context) => PaymentScreen(),
        // '/': (context) => NotificationScreen(),
        //'/': (context) => LocationChangeDescriptionScreen(),
        '/': (context) => PushNotificationService(),
        // When navigating to the "/second" route, build the SecondScreen widget.
      },
    );
  }
}
