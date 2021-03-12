import 'package:flutter/material.dart';

const String fontFamily = "Montserrat";

abstract class BaseTextStyle extends TextStyle {
  final Color color;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final double fontSize;
  BaseTextStyle({
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.fontSize,
  }) : super(
          color: color,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          fontSize: fontSize,
          fontFamily: fontFamily,
        );
}

class TextStyleThin {}
