import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/apis/provider_api/simple_api.dart';
import 'package:flutter_app/src/models-new/feedback_model.dart';
import 'package:flutter_app/src/utils/api_constants.dart';

class FeedbackProvider extends ChangeNotifier {
  List<FeedbackModel> _listFeedback;
  List<FeedbackModel> get listFeedback => _listFeedback;

  void initListFeedbackByServiceId(String id) async {
    _listFeedback = await SimpleAPI.getAll<FeedbackModel>(
      EntityEndpoint.FEEDBACK,
      fromJson: (json) => FeedbackModel.fromJson(json),
      queryParameters: {
        "serviceId": id,
      },
    );
    notifyListeners();
  }
}
