import 'package:flutter/material.dart';
import 'package:steps_indicator/steps_indicator.dart';

import 'package:flutter_app/src/widgets/shared_widget.dart';

class BookingProgress extends StatelessWidget {
  final int currentStepIndex;
  const BookingProgress({
    Key key,
    this.currentStepIndex,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return OutlinedCardExpandable(
      title: buildProgressTitle(),
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 10, left: 20),
          child: Row(
            children: [
              StepsIndicator(
                isHorizontal: false,
                selectedStep: this.currentStepIndex,
                doneStepSize: 6,
                unselectedStepSize: 6,
                selectedStepSize: 10,
                nbSteps: 3,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Confirmed',
                          style: TextStyle(color: Colors.grey),
                        ),
                        // Text(
                        //   'Thợ đang đã xác nhận đơn của bạn',
                        //   style: TextStyle(
                        //     fontWeight: FontWeight.normal,
                        //     fontSize: 13,
                        //   ),
                        // )
                      ],
                    ),
                    Container(height: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (currentStepIndex == 1)
                          Text(
                            'On the way',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        if (currentStepIndex != 1)
                          Text(
                            'On the way',
                            style: TextStyle(color: Colors.black54),
                          ),
                        if (currentStepIndex == 1)
                          Text(
                            'Thợ đang chuẩn bị và trên đường tới',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 13,
                            ),
                          ),
                      ],
                    ),
                    Container(height: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (currentStepIndex == 2)
                          Text(
                            'Working',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        if (currentStepIndex != 2)
                          Text(
                            'Working',
                            style: TextStyle(color: Colors.black54),
                          ),
                        if (currentStepIndex == 2)
                          Text(
                            'Thợ đang chuẩn bị và trên đường tới',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 13,
                            ),
                          )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildProgressTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Thời gian bắt đầu dịch vụ',
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
        Text(
          '8:30 AM',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
