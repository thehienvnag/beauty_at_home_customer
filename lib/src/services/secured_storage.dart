import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// Create storage
final storage = new FlutterSecureStorage();

class AppStorageService {
  static Future<String> readData(String key) async {
    return await storage.read(key: key);
  }

  static Future<Map<String, String>> readAllData() async {
    return await storage.readAll();
  }

  static void writeData(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  static void writeDataMap(Map<String, String> dataMap) async {
    List<Future> futures = [];
    dataMap.forEach((key, value) {
      futures.add(storage.write(key: key, value: value));
    });
    await Future.wait(futures);
  }

  static void deleteData(String key) async {
    await storage.delete(key: key);
  }

  static void deleteAllData() async {
    await storage.deleteAll();
  }
}
