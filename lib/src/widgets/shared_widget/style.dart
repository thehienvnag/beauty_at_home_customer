import 'package:flutter/material.dart';

const LargeTextSize = 24.0;
const MediumTextSize = 20.0;
const SmallMediumTextSize = 18.0;
const BodyTextSize = 16.0;
const TextSizeDefault = 14.0;
const SmallTextSize = 12.0;

const String FontNameDefault = 'Montserrat';

final headerTextStyle = (Color color) => TextStyle(
      fontFamily: FontNameDefault,
      fontWeight: FontWeight.w600,
      fontSize: MediumTextSize,
      color: color,
    );

final appBarTextStyle = (Color color) => TextStyle(
      fontFamily: FontNameDefault,
      fontWeight: FontWeight.w600,
      fontSize: MediumTextSize,
      color: Colors.black,
    );

final headlineTextStyle = (Color color) => TextStyle(
      fontFamily: FontNameDefault,
      fontWeight: FontWeight.w700,
      fontSize: LargeTextSize,
      color: color,
    );

final headline600TextStyle = (Color color) => TextStyle(
      fontFamily: FontNameDefault,
      fontWeight: FontWeight.w600,
      fontSize: SmallMediumTextSize,
      color: color,
      letterSpacing: 1.5,
    );

final titleTextStyle = (Color color) => TextStyle(
      fontFamily: FontNameDefault,
      fontWeight: FontWeight.w500,
      fontSize: BodyTextSize,
      color: color,
    );

final subtitleTextStyle = (Color color) => TextStyle(
      fontFamily: FontNameDefault,
      fontWeight: FontWeight.w500,
      fontSize: SmallTextSize,
      color: color,
    );

final subtitleTextLineThroughStyle = (Color color) => TextStyle(
    fontFamily: FontNameDefault,
    fontWeight: FontWeight.w500,
    fontSize: SmallTextSize,
    color: color,
    decoration: TextDecoration.lineThrough);

final body1TextStyle = (Color color) => TextStyle(
      fontFamily: FontNameDefault,
      fontWeight: FontWeight.w300,
      fontSize: BodyTextSize,
      color: color,
    );

final statusTextStyle = (Color color) => TextStyle(
      fontFamily: FontNameDefault,
      fontWeight: FontWeight.w500,
      fontSize: TextSizeDefault,
      color: color,
    );

final buttonTextStyle = (Color color) => TextStyle(
      fontFamily: FontNameDefault,
      fontWeight: FontWeight.w500,
      fontSize: MediumTextSize,
      color: color,
    );

class CustomTextStyle {
  static TextStyle headerText(Color color) => headerTextStyle(color);
  static TextStyle appBarText(Color color) => appBarTextStyle(color);
  static TextStyle headlineText(Color color) => headlineTextStyle(color);
  static TextStyle headline600Text(Color color) => headline600TextStyle(color);
  static TextStyle titleText(Color color) => titleTextStyle(color);
  static TextStyle subtitleText(Color color) => subtitleTextStyle(color);
  static TextStyle body1Text(Color color) => body1TextStyle(color);
  static TextStyle statusText(Color color) => statusTextStyle(color);
  static TextStyle buttonText(Color color) => buttonTextStyle(color);
  static TextStyle subtitleLineThroughText(Color color) =>
      subtitleTextLineThroughStyle(color);
}
