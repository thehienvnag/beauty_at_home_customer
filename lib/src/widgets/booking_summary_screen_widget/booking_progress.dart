import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/src/providers/cart_provider.dart';
import 'package:flutter_app/src/widgets/shared_widget/style.dart';
import 'package:provider/provider.dart';
import 'package:steps_indicator/steps_indicator.dart';

import 'package:flutter_app/src/widgets/shared_widget.dart';

class BookingStatus {
  int index;
  String status;
  String summary;
  bool isEnabled;
  BookingStatus({
    this.index,
    this.status,
    this.summary,
    this.isEnabled,
  });
}

List<BookingStatus> listStatus = List.from([
  BookingStatus(
    index: 0,
    status: "Chưa xác nhận",
    summary: "Chờ thợ xác nhận đơn của bạn",
    isEnabled: true,
  ),
  BookingStatus(
    index: 1,
    status: "Đã xác nhận",
    summary: "Thợ đã chấp nhận đơn của bạn",
    isEnabled: false,
  ),
  BookingStatus(
    index: 2,
    status: "Đang trên đường",
    summary: "Chờ thợ xác nhận đơn của bạn",
    isEnabled: false,
  ),
  BookingStatus(
    index: 3,
    status: "Đang làm",
    summary: "Chờ thợ xác nhận đơn của bạn",
    isEnabled: false,
  ),
]);

class BookingProgress extends StatelessWidget {
  const BookingProgress({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int currentStepIndex =
        context.select<CartProvider, int>((value) => value.progressIndex);
    print('curent: ' + currentStepIndex.toString());
    return OutlinedCardExpandable(
      title: buildProgressTitle(listStatus[currentStepIndex].status),
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 10, left: 20),
          child: Row(
            children: [
              StepsIndicator(
                isHorizontal: false,
                selectedStep: currentStepIndex,
                doneStepSize: 6,
                unselectedStepSize: 6,
                selectedStepSize: 10,
                nbSteps: 4,
                lineLength: 30,
                doneStepColor: Color(0xff50B644),
                doneLineColor: Color(0xff50B644),
                undoneLineColor: Color(0xff50B644),
                selectedStepColorOut: Color(0xff50B644),
                selectedStepColorIn: Color(0xff50B644),
                unselectedStepColorIn: Color(0xff50B644),
                unselectedStepColorOut: Color(0xff50B644),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                height: 125,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: listStatus.map((e) {
                    e.isEnabled = currentStepIndex == e.index;
                    log(e.index.toString());
                    log(currentStepIndex.toString());
                    return _buildProgress(e);
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProgress(BookingStatus status) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (status.isEnabled)
            Text(
              status.status,
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          else
            Text(
              status.status,
              style: CustomTextStyle.subtitleText(Colors.grey),
            ),
          if (status.isEnabled)
            Text(
              status.summary,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 13,
              ),
            ),
        ],
      ),
    );
  }

  Widget buildProgressTitle(String title) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(right: 10),
          child: SizedBox(
            height: 18,
            width: 18,
            child: CircularProgressIndicator(),
          ),
        ),
        Text(
          title.toUpperCase(),
          style: CustomTextStyle.subtitleText(Colors.blueAccent),
        ),
      ],
    );
  }
}
