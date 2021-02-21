import 'package:flutter/material.dart';

class OutlinedCard extends StatelessWidget {
  final double width;
  final EdgeInsets margin, padding;
  final List<Widget> sections;
  const OutlinedCard({
    Key key,
    this.width,
    this.margin,
    this.padding,
    this.sections,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      child: Card(
        margin: this.margin,
        child: Container(
          padding: this.padding,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: sections.length,
            itemBuilder: (context, index) => Column(
              children: [
                sections[index],
                if (index + 1 < sections.length)
                  Divider(
                    height: 35,
                    thickness: 0.7,
                    indent: 3,
                    endIndent: 3,
                    color: Colors.grey,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
