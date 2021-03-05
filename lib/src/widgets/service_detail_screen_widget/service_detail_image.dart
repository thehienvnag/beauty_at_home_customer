import 'package:flutter/material.dart';
import 'package:flutter_app/src/models/provider_detail_model/service_model.dart';

class ServiceDetailImage extends StatelessWidget {
  final String path;
  final Map<Service, int> cart;
  const ServiceDetailImage({
    Key key,
    this.path,
    this.cart
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 215.0,
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
              onPressed: () => Navigator.pop(context, cart),
            )
          ],),
        ),
      ],
    );
  }
}
