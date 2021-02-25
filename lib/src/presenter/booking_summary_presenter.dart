import 'dart:developer';

import 'package:flutter_app/src/models/base_model.dart';
import 'package:flutter_app/src/models/booking_summary_model.dart';
import 'package:flutter_app/src/presenter/base_presenter.dart';
import 'package:flutter_app/src/utils/utils.dart';
import 'package:flutter_app/src/view/interfaces/base_view.dart';
import 'package:flutter_app/src/view/interfaces/booking_summary_view.dart';

mixin IBookingSummaryPresenter implements IBasePresenter {
  void changeCurrentScreenState(int newStep);
  void testChangeCurrentScreenStateFrequently();
}

class BookingSummaryPresenter implements IBookingSummaryPresenter {
  BookingSummaryModel _model;
  IBookingSummaryView _view;

  @override
  void changeCurrentScreenState(int newStep) {
    if (newStep < 2) {
      _model.currentStepIndex = newStep;
      _view.refreshModel(_model);

      log('RefreshModel: ');
    }
  }

  @override
  void testChangeCurrentScreenStateFrequently() {
    Utils.redoTaskPerDuration(
      () => changeCurrentScreenState(++_model.currentStepIndex),
      5000,
      2,
      () => _view.navigateBookingHistory(),
    );
  }

  @override
  void initModel(IBaseModel model) {
    _model = model;
  }

  @override
  void initView(IBaseView view) {
    _view = view;
  }
}
