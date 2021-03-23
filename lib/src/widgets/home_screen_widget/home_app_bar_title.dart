import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/src/providers/account_provider.dart';
import 'package:flutter_app/src/utils/utils.dart';
import 'package:flutter_app/src/widgets/shared_widget/style.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geocoder/model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

class HomeAppBarTitle extends StatefulWidget {
  const HomeAppBarTitle({
    Key key,
  }) : super(key: key);

  @override
  _HomeAppBarTitleState createState() => _HomeAppBarTitleState();
}

class _HomeAppBarTitleState extends State<HomeAppBarTitle> {
  String _currentAddress;
  @override
  void initState() {
    super.initState();
    getUserLocation();
  }

  getUserLocation() async {
    LocationData myLocation;
    Location location = new Location();
    try {
      myLocation = await location.getLocation();
      final coordinates =
          new Coordinates(myLocation.latitude, myLocation.longitude);
      var addresses =
          await Geocoder.local.findAddressesFromCoordinates(coordinates);
      var first = addresses.first;
      context
          .read<AccountProvider>()
          .setCurrentAddress(first.addressLine, coordinates);
      setState(() {
        print(first.addressLine);
        _currentAddress = first.addressLine;
      });
    } on PlatformException catch (e) {
      myLocation = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Icon(
          Icons.location_on,
          color: Color(0xff0DB5B4),
        ),
        Consumer<AccountProvider>(
          builder: (context, value, child) {
            var addresses = value.accountSignedIn?.addresses;
            if (addresses == null || addresses.isEmpty) {
              return Text(
                _currentAddress == null
                    ? "Chưa xác định vị trí"
                    : Utils.shortenString(_currentAddress, 22, false),
                style: CustomTextStyle.titleText(Colors.black),
              );
            }
            return Text(
              addresses.first.locationName,
              style: CustomTextStyle.titleText(Colors.black),
            );
          },
        ),
      ],
    );
  }
}
