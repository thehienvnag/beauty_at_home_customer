import 'package:flutter/material.dart';
import 'package:flutter_app/src/view/checkout_screen.dart';
import 'package:flutter_app/src/view/home_screen.dart';
import 'package:flutter_app/src/view/payment_screen.dart';
import 'package:flutter_app/src/view/wait_confirm_screen.dart';

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
        '/': (context) => CheckoutScreen(),
        //'/': (context) => PaymentScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
      },
    );
  }
}
