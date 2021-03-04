import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OutlinedCard extends StatelessWidget {
  final double width;
  final EdgeInsets margin, padding;
  final List<Widget> sections;
  final ShapeBorder shapeBorder;
  final Widget divider;
  const OutlinedCard(
      {Key key,
      this.width,
      this.margin,
      this.padding,
      @required this.sections,
      this.divider,
      this.shapeBorder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      child: Card(
        elevation: 0,
        shape: this.shapeBorder ??
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: BorderSide(
                color: Colors.grey,
                width: 0.5,
              ),
            ),
        margin: this.margin,
        child: Container(
          padding: this.padding,
          child: ListView.separated(
            padding: EdgeInsets.all(0),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => sections[index],
            separatorBuilder: (context, index) =>
                this.divider ??
                const Divider(
                  height: 30,
                  thickness: 0.5,
                  indent: 3,
                  endIndent: 1,
                  color: Colors.grey,
                ),
            itemCount: sections.length,
          ),
        ),
      ),
    );
  }
}
