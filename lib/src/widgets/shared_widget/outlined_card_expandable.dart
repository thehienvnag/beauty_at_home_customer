import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:steps_indicator/steps_indicator.dart';

class OutlinedCardExpandable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screenSize.width * 0.95,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(
            color: Colors.grey.withOpacity(0.5),
            width: 0.5,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child: ListTileTheme(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            child: ExpansionTile(
              title: Container(
                padding: EdgeInsets.only(top: 5),
                child: Column(
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
                ),
              ),
              children: [
                const Divider(
                  thickness: 0.3,
                  indent: 18,
                  endIndent: 18,
                  color: Colors.black,
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 30,
                    right: 10,
                    bottom: 10,
                  ),
                  child: Row(
                    children: [
                      StepsIndicator(
                        isHorizontal: false,
                        selectedStep: 1,
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
                            Text(
                              'Confirmed',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Container(height: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'On the way',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Thợ đang chuẩn bị và trên đường tới',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 13,
                                  ),
                                )
                              ],
                            ),
                            Container(height: 12),
                            Text(
                              'Working',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
