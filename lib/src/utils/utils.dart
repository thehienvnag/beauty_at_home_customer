import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import "package:intl/intl.dart";

class Utils {
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

  static Future sleep(int miliesSecond) {
    return Future.delayed(
      Duration(milliseconds: miliesSecond),
    );
  }

  static void redoTaskPerDuration(
    Function task,
    int miliesSecond,
    int count,
    Function afterTask,
  ) async {
    while (count-- > 0) {
      await sleep(miliesSecond);
      task.call();
    }
    await sleep(miliesSecond);
    afterTask.call();
  }

  static Widget getStatus(String status) {
    if (status == "ACTIVE") {
      return Text(
        "Đang hoạt động",
        style: TextStyle(
            fontFamily: 'Montserrat',
            // fontSize: 10.0,
            fontWeight: FontWeight.w500,
            color: Color(0xFF0DB5B4)),
      );
    } else if (status == "INACTIVE") {
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
}
