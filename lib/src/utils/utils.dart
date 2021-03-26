import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_app/src/models-new/feedback_model.dart';
import 'package:flutter_app/src/models-new/service_model.dart';
import 'package:geolocator/geolocator.dart';
import "package:intl/intl.dart";
import 'package:image_picker/image_picker.dart';

class Utils {
  static String formatDate(DateTime date) {
    final f = new DateFormat('dd-MM-yyyy');
    return f.format(date);
  }

  static final Geolocator geolocator = Geolocator()
    ..forceAndroidLocationManager;

  static Future<dynamic> loadJsonListAsset<T>({
    String assetsPath,
    Function(Map<String, dynamic>) fromMap,
  }) async {
    String json = await rootBundle.loadString("public/json/" + assetsPath);
    List list = jsonDecode(json);
    return list.map<T>((e) => fromMap(e)).toList();
  }

  static Future<dynamic> loadJsonAsset({
    String assetsPath,
    Function(Map<String, dynamic>) fromJson,
  }) {
    return rootBundle
        .loadString("public/json/" + assetsPath)
        .then((jsonStr) => jsonDecode(jsonStr))
        .then((value) => fromJson(value));
  }

  static Future sleep(int seconds, Function callback) async {
    await Future.delayed(
      Duration(seconds: seconds),
    );
    callback.call();
  }

  // static void redoTaskPerDuration(
  //   Function task,
  //   int miliesSecond,
  //   int count,
  //   Function afterTask,
  // ) async {
  //   while (count-- > 0) {
  //     await sleep(miliesSecond);
  //     task.call();
  //   }
  //   await sleep(miliesSecond);
  //   afterTask.call();
  // }

  static shortenString(String str, int length, [bool withComa = true]) {
    if (str.length > length) {
      if (str.contains(" ")) {
        if (str.substring(0, length + 1).contains(" ")) {
          return str.substring(
                  0, str.substring(0, length + 1).lastIndexOf(" ")) +
              (withComa ? "..." : "");
        } else {
          return str.substring(0, str.indexOf(" ")) + (withComa ? "..." : "");
        }
      }
    }
    return str;
  }

  static Future<Position> getCurrentLocation() {
    try {
      return geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );
    } catch (e) {
      print(e);
    }
  }

  static Future<String> getAddressFromLatLng(Position currentPosition) async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          currentPosition.latitude, currentPosition.longitude);
      Placemark place = p[0];
      return place.subThoroughfare;
    } catch (e) {
      print(e);
    }
  }

  static Widget getStatus(String status) {
    if (status == "ACTIVE" || status == 'Active') {
      return Text(
        "Đang hoạt động",
        style: TextStyle(
            fontFamily: 'Montserrat',
            // fontSize: 10.0,
            fontWeight: FontWeight.w500,
            color: Color(0xFF0DB5B4)),
      );
    } else if (status == "INACTIVE" ||  status == 'Inactive') {
      return Text(
        "Không hoạt động",
        style: TextStyle(
            fontFamily: 'Montserrat',
            // fontSize: 10.0,
            fontWeight: FontWeight.w500,
            color: Colors.redAccent),
      );
    }
    return null;
  }

  static String formatPrice(String review) {
    String result = review.toString();
    var formatter = NumberFormat('###,000');
    String formatString = formatter.format(double.parse(result));
    return formatString.replaceAll(new RegExp(r','), '.') + "đ";
  }

  String formatString(String doublePrice) {
    // String result = price.toString() + '000';
    String price = doublePrice.replaceAll(new RegExp(r'.0'), "");
    var formatter = NumberFormat('###,000');
    String formatString = formatter.format(int.parse(price));
    return formatString.replaceAll(new RegExp(r','), '.') + "đ";
  }

  static String calculatePrice(Map<ServiceModel, int> cart) {
    double total = 0;
    cart.forEach((key, value) {
      total += key.price * value;
    });
    // return formatPrice(total.toString());
    return total.toString();
  }

  static Future<File> pickImage() async {
    PickedFile pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    return File(pickedFile.path);
  }

  static double calculateRate(List<FeedbackModel> lstFeedback) {
    if (lstFeedback != null ?? lstFeedback.isNotEmpty) {
      double total = 0;
      for (int i = 0; i < lstFeedback.length; i++) {
        total += lstFeedback[i].rateScore;
      }
      return total / lstFeedback.length;
    }
    return 0;
  }
}
