import 'package:flutter/material.dart';
import 'package:flutter_app/src/models/booking_summary_model.dart';
import 'package:flutter_app/src/presenter/booking_summary_presenter.dart';
import 'package:flutter_app/src/view/booking_summary.dart';
import 'package:flutter_app/src/view/home.dart';

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
        '/': (context) => BookingSummary(
              presenter: BookingSummaryPresenter(),
            ),
      },
    );
  }
}
