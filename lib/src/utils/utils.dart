import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

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

  static shortenString(String str, int length) {
    if (str.length > length) {
      if (str.contains(" ")) {
        if (str.substring(0, length + 1).contains(" ")) {
          return str.substring(
                  0, str.substring(0, length + 1).lastIndexOf(" ")) +
              "...";
        } else {
          return str.substring(0, str.indexOf(" ")) + "...";
        }
      }
    }
    return str;
  }
}
