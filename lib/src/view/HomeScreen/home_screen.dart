import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/providers/account_provider.dart';
import 'package:flutter_app/src/providers/booking_provider.dart';
import 'package:flutter_app/src/providers/cart_provider.dart';
import 'package:flutter_app/src/providers/provider_detail_provider.dart';
import 'package:flutter_app/src/providers/service_provider.dart';
import 'package:flutter_app/src/utils/firebase_helper.dart';
import 'package:flutter_app/src/utils/widgets_utils.dart';
import 'package:flutter_app/src/view/BookingHistoryDetail/booking_history_detail.dart';
import 'package:flutter_app/src/view/LocationChangeDescription/location_change_description_screen.dart';
import 'package:flutter_app/src/view/ProfileScreen/profile_screen.dart';
import 'package:flutter_app/src/widgets/home_screen_widget.dart';
import 'package:flutter_app/src/widgets/shared_widget/search_text_field.dart';
import 'package:flutter_app/src/widgets/shared_widget/style.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

Future<dynamic> myBackgroundHandler(Map<String, dynamic> message) {
  return HomeScreenState()._showNotification(message);
}

class HomeScreenState extends State<HomeScreen> {
  FlutterLocalNotificationsPlugin notiPlugin =
      FirebaseHelper.flutterLocalNotiInstance();

  final FirebaseMessaging _firebaseMessaging = FirebaseHelper.fcmInstance();

  Future _showNotification(Map<String, dynamic> message) async {
    await notiPlugin.show(
      0,
      'new message arived',
      '${message['data']['title']} for ${message['data']['price']}',
      FirebaseHelper.platformSpecInstance(),
      payload: 'Default_Sound',
    );
  }

  getTokenz() async {
    String token = await _firebaseMessaging.getToken();
    print(token);
  }

  Future selectNotification(String payload) async {
    await notiPlugin.cancelAll();
  }

  void initPushNotification() {
    var initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    var initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    notiPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);

    super.initState();
    _firebaseMessaging.configure(
      onBackgroundMessage: myBackgroundHandler,
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        String notiType = message['data']['notiType'];
        int index = -1;
        if (notiType == "booking_changed") {
          String status = message['data']['bookingStatus'];
          Map<String, dynamic> statuses = {
            "Mới": 0,
            "Xác nhận": 1,
            "Đang trên đường": 2,
            "Đang làm": 3,
            "Hoàn thành": 4,
            "Đã hủy": 5
          };
          index = statuses[status];
          if(index == 0 ) context.read<CartProvider>().setProgressIndex(0);
          if(index == 1 ) context.read<CartProvider>().setProgressIndex(1);
          if(index == 2 ) context.read<CartProvider>().setProgressIndex(2);
          if(index == 3 ) context.read<CartProvider>().setProgressIndex(3);

          if (index == 5) {
            context.read<CartProvider>().setProgressIndex(0);
            Navigator.of(context).pop();
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    // title: Column(
                    //   children: [
                    //     ClipRRect(
                    //       child: Text(message['notification']['title']),
                    //       borderRadius: BorderRadius.all(Radius.circular(4)),
                    //     ),
                    //   ],
                    // ),
                    content: Column(mainAxisSize: MainAxisSize.min, children: [
                      Text(
                        'Đơn của bạn đã bị hủy bởi thợ',
                        style: CustomTextStyle.statusText(Colors.black),
                      ),
                      Text(
                        'Xin vui lòng đặt lại sau',
                        style: CustomTextStyle.subtitleText(Colors.black54),
                      ),
                    ]),
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
          }
          if (index == 4) {
            var id = context.read<BookingProvider>().bookingModel.id;
            context.read<CartProvider>().setCurrentCart(null);
            context.read<CartProvider>().setProgressIndex(0);
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => BookingHistoryDetailScreen(
                  id: id.toString(),
                  hardCode: true,
                ),
              ),
            );
          }

        }
        if (index != 4 && notiType == "booking_changed") {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Column(mainAxisSize: MainAxisSize.min, children: [
                    Text(
                      message['notification']['title'] + '\n',
                      style: CustomTextStyle.statusText(Colors.black),
                    ),
                    Text(
                      '${message['notification']['body']}',
                      style: CustomTextStyle.subtitleText(Colors.black54),
                    ),
                  ]),
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
        }
      },
    );
    _firebaseMessaging.subscribeToTopic("Randomizer");
  }

  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    initPushNotification();
    var providerDetail = context.read<ProviderDetailProvider>();
    var serviceProvider = context.read<ServiceProvider>();

    serviceProvider.initServiceListHome();
    providerDetail.initProviderListHome();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          elevation: 0.7,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          actions: [
            Container(
              width: screenSize.width * 0.95,
              padding: EdgeInsets.only(right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              LocationChangeDescriptionScreen(),
                        ),
                      );
                    },
                    child: HomeAppBarTitle(),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ProfileScreen(),
                      ));
                    },
                    child: Container(
                      child: Consumer<AccountProvider>(
                        builder: (context, value, child) {
                          var gallery = value.accountSignedIn?.gallery;
                          if (gallery == null || gallery.images.isEmpty) {
                            return CircleAvatar(
                              backgroundImage:
                                  AssetImage('public/img/images.png'),
                              radius: 17,
                            );
                          }
                          return CircleAvatar(
                            backgroundImage: NetworkImage(
                              gallery.images.first.imageUrl,
                            ),
                            radius: 17,
                          );
                        },
                      ),
                      margin: EdgeInsets.only(right: 10),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),
              SearchTextField(
                isReadonly: true,
              ),
              // Align(
              //   alignment: Alignment.bottomLeft,
              //   child: Container(
              //     padding: EdgeInsets.only(top: 15, left: 10),
              //     child: Text(
              //       'ƯU ĐÃI',
              // style: CustomTextStyle.headline600Text(
              //   Colors.orange,
              // ),
              //     ),
              //   ),
              // ),
              SlideService(),
              // ViewsPromotion(),
              ServiceWidget(),
              BeauticianWidget()
            ],
          ),
        ),
      ),
      bottomNavigationBar: WidgetUtils.appBottomNavigationBar(0),
    );
  }
}
