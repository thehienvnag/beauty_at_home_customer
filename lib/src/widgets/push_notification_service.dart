import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotificationService extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FireBaseMessaging();
  }
}

Future<dynamic> myBackgroundHandler(Map<String, dynamic> message) {
  return FireBaseMessaging()._showNotification(message);
}

class FireBaseMessaging extends State<PushNotificationService> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('notification'),
      ),
      body: Center(
        child: Text('button'),
      ),
    );
  }

  Future _showNotification(Map<String, dynamic> message) async {
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
      'channel id',
      'channel name',
      'channel desc',
      importance: Importance.max,
      priority: Priority.high,
    );

    var platformChannelSpecifics =
        new NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      'new message arived',
      '${message['data']['title']} for ${message['data']['price']}',
      platformChannelSpecifics,
      payload: 'Default_Sound',
    );
  }

  getTokenz() async {
    String token = await _firebaseMessaging.getToken();
    print(token);
  }

  Future selectNotification(String payload) async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  @override
  void initState() {
    var initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    var initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);
    super.initState();

    _firebaseMessaging.configure(
      onBackgroundMessage: myBackgroundHandler,
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('new message arived'),
                content: Text(
                    '${message['notification']['title']} ${message['notification']['body']}'),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Ok'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            });
      },
    );
    _firebaseMessaging.subscribeToTopic("Randomizer");

    getTokenz();
  }
}
