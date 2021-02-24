import 'package:flutter/cupertino.dart';

class CoverImage extends StatelessWidget {
  final String path;
  const CoverImage({
    Key key,
    this.path,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Align(
        alignment: Alignment.topCenter,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: Image.asset(
            this.path,
            width: 220,
          ),
        ),
      ),
    );
  }
}
