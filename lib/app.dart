import 'package:flutter/material.dart';
import 'package:flutter_app/src/utils/routes_name.dart';

import 'package:flutter_app/src/view/home_screen.dart';
import 'package:flutter_app/src/view/login_phone_screen.dart';
import 'package:flutter_app/src/view/login_screen.dart';

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
        Routes.loginPhoneScreen: (context) => LoginPhoneScreen(),
        //'/': (context) => CheckoutScreen(),
        //'/': (context) => PaymentScreen(),
        // '/': (context) => NotificationScreen(),
        //'/': (context) => LocationChangeDescriptionScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
      },
    );
  }
}
