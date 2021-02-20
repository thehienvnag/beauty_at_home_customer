import 'package:flutter/material.dart';
import 'package:flutter_app/src/view/booking_summary_screen.dart';
import 'package:flutter_app/src/view/home_screen.dart';

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
        '/a': (context) => HomeScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/': (context) => BookingSummaryScreen(),
      },
    );
  }
}
