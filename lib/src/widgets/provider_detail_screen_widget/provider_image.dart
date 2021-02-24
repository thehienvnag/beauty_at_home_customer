import 'package:flutter/material.dart';

class ProviderImage extends StatelessWidget {
  final String path;
  const ProviderImage({
    Key key,
    this.path,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 210.0,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(bottom: 1.0),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0.0, 2.0),
                  blurRadius: 6.0
              ),
            ],
          ),
          child: Hero(
            tag: this.path,
            child: ClipRRect(
              child: Image(
                image: AssetImage(this.path),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 30.0),
          child: Row(children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back_ios_outlined),
              iconSize: 30.0,
              color: Colors.black,
              onPressed: () => Navigator.pop(context),
            )
          ],),
        ),
      ],
    );
  }
}
