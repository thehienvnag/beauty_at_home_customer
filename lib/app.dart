import 'package:flutter/material.dart';

import 'package:flutter_app/src/view/home_screen.dart';
import 'package:flutter_app/src/view/location_change_description_screen.dart';
import 'package:flutter_app/src/view/notification_screen.dart';

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
        '/': (context) => HomeScreen(),
        //'/': (context) => CheckoutScreen(),
        //'/': (context) => PaymentScreen(),
        // '/': (context) => NotificationScreen(),
        //'/': (context) => LocationChangeDescriptionScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
      },
    );
  }
}
