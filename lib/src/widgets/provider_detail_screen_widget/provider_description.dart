import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/models-new/provider_detail_model.dart';
import 'package:flutter_app/src/providers/provider_detail_provider.dart';
import 'package:flutter_app/src/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProviderDescription extends StatelessWidget {
  final ProviderModel provider;

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
          )
        ],
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
                  provider.displayName,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                // Text(
                //   "provider.description",
                //   style: TextStyle(
                //     fontFamily: 'Montserrat',
                //     fontSize: 14.0,
                //     fontWeight: FontWeight.w500,
                //   ),
                // ),
                Text(
                  provider.addresses.isNotEmpty
                      ? provider.addresses[0].location
                      : "Chưa cập nhật địa chỉ",
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 13.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600]),
                ),
                provider.services != null && provider.services.isNotEmpty
                    ? Text(
                        'Giá dao động: ' +
                            Utils.formatPrice(provider.lowerPrice) +
                            ' - ' +
                            Utils.formatPrice(provider.upperPrice),
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            // fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[600]),
                      )
                    : Text('Thợ chưa cập nhật dịch vụ',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            // fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[600])),
                // Row(
                //   children: <Widget>[
                Utils.getStatus(provider.status),
                // Text(
                //   ' - ' + provider.openTime + ' - ' + provider.closeTime,
                //   style: TextStyle(
                //       fontFamily: 'Montserrat',
                //       fontSize: 10.0,
                //       fontWeight: FontWeight.w500,
                //       color: Colors.grey[600]),
                // ),
                // ],
                // ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            right: 12,
            child: Container(
              height: 75.0,
              width: 65.0,
              decoration: BoxDecoration(
                color: Color(0xFF0DB5B4),
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(color: Colors.white, width: 2.0),
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
                        child: Icon(
                          Icons.stars,
                          color: Colors.white,
                          size: 22.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0, top: 8.0),
                        child: Text(
                          provider.rateScore.toStringAsFixed(1),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 35.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          provider.totalFeedback.toString(),
                          style: TextStyle(
                              fontSize: 11.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Reviews',
                          style: TextStyle(
                              fontSize: 11.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

// String formatPrice(String review) {
//   String result = review.toString();
//   var formatter = NumberFormat('###,000');
//   String formatString = formatter.format(int.parse(result));
//   return formatString;
// }
}
