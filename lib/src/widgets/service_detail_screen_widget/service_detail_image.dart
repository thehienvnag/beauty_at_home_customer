import 'package:flutter/material.dart';

class ServiceDetailImage extends StatelessWidget {
  final String path;
  const ServiceDetailImage({
    Key key,
    this.path,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200.0,
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
          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 25.0),
          child: Row(children: <Widget>[
            IconButton(
              icon: Icon(Icons.cancel, color: Colors.white,),
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
