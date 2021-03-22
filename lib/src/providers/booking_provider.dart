import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_app/src/apis/provider_api/simple_api.dart';
import 'package:flutter_app/src/models-new/booking_model.dart';
import 'package:flutter_app/src/utils/api_constants.dart';

class BookingProvider extends ChangeNotifier {
  BookingModel _bookingModel;
  BookingModel get bookingModel => _bookingModel;
  List<BookingModel> _listBookingModel;
  List<BookingModel> get listBooking => _listBookingModel;
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

  void initBookingListByCustomerId(String id) async {
    final fromMap = (source) => BookingModel.fromJson(source);
    _listBookingModel = await SimpleAPI.getAll<BookingModel>(
      EntityEndpoint.BOOKING,
      fromJson: fromMap,
      queryParameters: {
        "customerAccountId": id,
      },
    );
    log(_listBookingModel[0].endAddress);
    notifyListeners();
  }
}
