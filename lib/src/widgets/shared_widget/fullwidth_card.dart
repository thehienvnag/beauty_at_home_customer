import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_app/src/widgets/shared_widget.dart';

class FullWidthCard extends StatelessWidget {
  final List<Widget> sections;
  final EdgeInsets padding;
  final double marginTop, marginBottom;
  final bool hasBorder;
  final bool hasDivider;

  const FullWidthCard({
    Key key,
    this.sections,
    this.padding,
    this.marginTop,
    this.marginBottom,
    this.hasBorder = true,
    this.hasDivider = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size;
    return OutlinedCard(
      padding: padding,
      margin: EdgeInsets.only(
        top: marginTop ?? 0,
        bottom: marginBottom ?? 0,
        left: 0,
        right: 0,
      ),
      width: screenWidth.width,
      sections: this.sections,
      divider: hasDivider
          ? const Divider(
              height: 0,
              thickness: 0.5,
              color: Colors.black26,
            )
          : Divider(
              thickness: 0,
            ),
      shapeBorder: hasBorder
          ? RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.grey.withOpacity(0.5),
                width: 0.5,
              ),
            )
          : RoundedRectangleBorder(
              side: BorderSide.none,
            ),
    );
  }
}
