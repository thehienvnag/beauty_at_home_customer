import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseHelper {
  static FirebaseMessaging _firebaseMessaging;
  static FlutterLocalNotificationsPlugin _flutterLocalNoti;
  static final _androidPlatformChannelSpecifics =
      new AndroidNotificationDetails(
    'channel id',
    'channel name',
    'channel desc',
    importance: Importance.max,
    priority: Priority.high,
  );
  static FirebaseMessaging fcmInstance() {
    if (_firebaseMessaging == null) {
      _firebaseMessaging = FirebaseMessaging();
    }
    return _firebaseMessaging;
  }

  static NotificationDetails platformSpecInstance() {
    return new NotificationDetails(android: _androidPlatformChannelSpecifics);
  }

  static FlutterLocalNotificationsPlugin flutterLocalNotiInstance() {
    if (_flutterLocalNoti == null) {
      _flutterLocalNoti = FlutterLocalNotificationsPlugin();
    }
    return _flutterLocalNoti;
  }
}
