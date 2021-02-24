import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/models/provider_detail_model/provider_model.dart';

class ProviderDescription extends StatelessWidget {
  final Provider provider;
  const ProviderDescription({
    Key key,
    this.provider,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300],
            offset: Offset(0.0, 5.0),
          )],
      ),
      child: Stack(
        children: <Widget>[
          Container(
            height: 180.0,
            width: 275.0,
            padding: EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  provider.name,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 26.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  provider.description,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  provider.address,
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600]
                  ),
                ),
                Text(
                  'Giá dao động: ' + provider.lowerPrice + ' - ' + provider.upperPrice,
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600]
                  ),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Đang hoạt động',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF0DB5B4)
                      ),
                    ),
                    Text(
                      ' - ' + provider.openTime + ' - ' + provider.closeTime,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[600]
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 20,
            right: 10,
            child: Container(
              height: 95.0,
              width: 80.0,
              decoration: BoxDecoration(
                color: Color(0xFF0DB5B4),
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(
                    color: Colors.white,
                    width: 2.0
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0.0, 5.0),
                    blurRadius: 5.0,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Icon(Icons.stars, color: Colors.white, size: 35.0,),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0,top: 8.0),
                        child: Text(provider.rate.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                        ),
                      ),
                    ],),
                  Container(
                    height: 42.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(provider.reviews,
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),),
                        Text('Reviews',
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),),
                      ],
                    ),),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
