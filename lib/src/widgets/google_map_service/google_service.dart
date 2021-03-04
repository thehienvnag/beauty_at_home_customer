import 'package:url_launcher/url_launcher.dart';

class MapUtils{
  MapUtils._();
  static Future<void> openMap(double latitude, double longitude) async{
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }
}

class MapUtils2{
  MapUtils2._();
  static Future<void> openMap(String location) async{
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$location';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }
}
class MapUtils3{
  MapUtils3._();
  static Future<void> openMap(double latiCurrent, double longiC, String location) async{
    String googleUrl = 'https://www.google.com/maps/dir/${latiCurrent},${longiC}/${location}';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }
}
class MapUtils4{
  MapUtils4._();
  static Future<void> openMap(String currentLocation, String location) async{
    String googleUrl = 'https://www.google.com/maps/dir/${currentLocation}/${location}';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }
}