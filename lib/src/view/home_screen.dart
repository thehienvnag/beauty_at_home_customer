import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              child: Text('To CusWait screen'),
              onPressed: () {
                // Navigate to the second screen using a named route.
                Navigator.pushNamed(context, '/second');
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              child: Text('To Search screen'),
              onPressed: () {
                // Navigate to the second screen using a named route.
                Navigator.pushNamed(context, '/search');
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              child: Text('To Login screen'),
              onPressed: () {
                // Navigate to the second screen using a named route.
                Navigator.pushNamed(context, '/login');
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              child: Text('To Blank screen'),
              onPressed: () {
                // Navigate to the second screen using a named route.
                Navigator.pushNamed(context, '/blank');
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              child: Text('To Rate screen'),
              onPressed: () {
                // Navigate to the second screen using a named route.
                Navigator.pushNamed(context, '/rate');
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              child: Text('To History screen'),
              onPressed: () {
                // Navigate to the second screen using a named route.
                Navigator.pushNamed(context, '/history');
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('To Home screen'),
          onPressed: () {
            // Navigate to the second screen using a named route.
            Navigator.pushNamedAndRemoveUntil(context, "/", (r) => false);
          },
        ),
      ),
    );
  }
}
