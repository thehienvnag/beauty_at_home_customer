import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app.dart';
import 'package:flutter_app/src/providers/account_provider.dart';
import 'package:flutter_app/src/providers/booking_provider.dart';
import 'package:flutter_app/src/providers/cart_provider.dart';
import 'package:flutter_app/src/providers/feedback_provider.dart';
import 'package:flutter_app/src/providers/provider_detail_provider.dart';
import 'package:flutter_app/src/providers/service_provider.dart';
import 'package:flutter_app/src/providers/voucher_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AccountProvider()),
        ChangeNotifierProvider(create: (context) => VoucherProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => ProviderDetailProvider()),
        ChangeNotifierProvider(create: (context) => ServiceProvider()),
        ChangeNotifierProvider(create: (context) => BookingProvider()),
        ChangeNotifierProvider(create: (context) => FeedbackProvider()),
      ],
      child: App(),
    ),
  );
}
