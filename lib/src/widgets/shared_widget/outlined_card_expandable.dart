import 'package:flutter/material.dart';

class OutlinedCardExpandable extends StatelessWidget {
  final List<Widget> children;
  final Widget title;
  const OutlinedCardExpandable({
    Key key,
    this.children,
    this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width * 0.95,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
        child: Theme(
          data: ThemeData().copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            initiallyExpanded: true,
            title: this.title,
            children: [
              const Divider(
                thickness: 0.3,
                indent: 18,
                endIndent: 18,
                color: Colors.black,
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 30,
                  right: 10,
                  bottom: 10,
                ),
              ),
              ...this.children
            ],
          ),
        ),
      ),
    );
  }
}
