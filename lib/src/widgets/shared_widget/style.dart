import 'package:flutter/material.dart';

const LargeTextSize = 24.0;
const MediumTextSize = 20.0;
const BodyTextSize = 16.0;
const TextSizeDefault = 14.0;
const SmallTextSize = 12.0;

const String FontNameDefault = 'Montserrat';

const HeaderTextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w600,
  fontSize: MediumTextSize,
  color: Colors.black,
);

const AppBarTextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w600,
  fontSize: MediumTextSize,
  color: Colors.black,
);

const HeadlineTextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w700,
  fontSize: LargeTextSize,
  color: Colors.black,
);

const TitleTextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w500,
  fontSize: BodyTextSize,
  color: Colors.black,
);

const SubtitleTextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w500,
  fontSize: SmallTextSize,
  color: Color(0xFF757575),
);

const Body1TextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w300,
  fontSize: BodyTextSize,
  color: Colors.black,
);

const StatusTextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w500,
  fontSize: TextSizeDefault,
  color: Color(0xFF0DB5B4),
);

const ButtonTextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w500,
  fontSize: MediumTextSize,
  color: Colors.white,
);

class CustomTextStyle {
  static TextStyle _text900(Color color) => TextStyle(
    fontFamily: FontNameDefault,
    fontWeight: FontWeight.w300,
    fontSize: 27.0,
    color: color,
  );
}