import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_app/src/apis/provider_api/simple_api.dart';
import 'package:flutter_app/src/models-new/booking_model.dart';
import 'package:flutter_app/src/utils/api_constants.dart';

class BookingProvider extends ChangeNotifier {
  BookingModel _bookingModel;
  BookingModel get bookingModel => _bookingModel;
  Future<void> initBookingById(String id) async {
    final fromJson =
        (Map<String, dynamic> source) => BookingModel.fromJson(source);
    _bookingModel = await SimpleAPI.getById(
      EntityEndpoint.BOOKING,
      id,
      fromJson: fromJson,
    );
    log(_bookingModel.endAddress);
    notifyListeners();
  }
}
