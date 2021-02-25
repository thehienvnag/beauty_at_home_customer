import 'base_model.dart';

class BookingSummaryModel implements IBaseModel {
  int currentStepIndex;
  String currentState;

  BookingSummaryModel({
    this.currentStepIndex,
    this.currentState,
  });
}
