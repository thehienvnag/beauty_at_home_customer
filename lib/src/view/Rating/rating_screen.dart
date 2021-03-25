import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/src/apis/provider_api/simple_api.dart';
import 'package:flutter_app/src/models-new/booking_detail_model.dart';
import 'package:flutter_app/src/utils/utils.dart';
import 'package:flutter_app/src/view/HomeScreen/home_screen.dart';
import 'package:flutter_app/src/widgets/shared_widget/outlined_card.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class RatingScreen extends StatefulWidget {
  final BookingDetailModel model;

  const RatingScreen({Key key, this.model}) : super(key: key);

  @override
  _RatingScreen createState() => _RatingScreen();
}

class _RatingScreen extends State<RatingScreen> {
  double rating = 0.0;
  File _file;
  String feedbackContent;

  void pickImage() async {
    PickedFile pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      _file = File(pickedFile.path);
      //url = _file.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
              margin: EdgeInsets.symmetric(vertical: 40),
              child: Column(
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(
                              'public/img/review.png',
                            ),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      margin: EdgeInsets.only(bottom: 5.0),
                      child: Center(
                          child: Text(
                        'Đánh giá dịch vụ bạn được cung cấp',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ))),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Center(
                          child: Text(
                        'Bạn trải nghiệm dịch vụ ' +
                            widget.model.serviceName +
                            ' như thế nào?',
                        style:
                            TextStyle(fontFamily: 'Montserrat', fontSize: 16),
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ))),
                  OutlinedCard(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    width: 360,
                    sections: [
                      Center(
                        child: SmoothStarRating(
                          starCount: 5,
                          color: Colors.yellowAccent,
                          borderColor: Colors.grey,
                          allowHalfRating: false,
                          spacing: 6,
                          size: 45,
                          rating: rating,
                          isReadOnly: false,
                          onRated: (value) {
                            setState(() {
                              rating = value;
                              print("rating is : $rating");
                            });
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Text(
                                'Giá dịch vụ',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400),
                              ),
                              alignment: Alignment.topLeft),
                          Container(
                            child: Text(
                              Utils.formatPrice((widget.model.quantity *
                                      widget.model.servicePrice)
                                  .toString()),
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                            alignment: Alignment.topRight,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Text(
                                'Thêm hình ảnh',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400),
                              ),
                              alignment: Alignment.topLeft),
                          Stack(
                            children: [
                              Container(
                                height: 100.0,
                                width: MediaQuery.of(context).size.width * 0.52,
                                // margin: EdgeInsets.only(bottom: 1.0),
                                // padding: EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(
                                    border: Border.all(width: 0.5)),
                                child: Container(
                                  child: _file == null
                                      ? GestureDetector(
                                          onTap: pickImage,
                                          child: Container(
                                            margin: EdgeInsets.only(top: 50),
                                            width: 50,
                                            // child: Image.asset(
                                            //   'public/img/Image.png',
                                            //   width: 50,
                                            //   fit: BoxFit.fitHeight,
                                            // ),
                                          ),
                                        )
                                      : ClipRRect(
                                          child: Image.file(_file,
                                              fit: BoxFit.cover)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 65.0, vertical: 20.0),
                                child: Container(
                                  // height: 170.0,
                                  alignment: Alignment.bottomRight,
                                  child: Card(
                                    color: Colors.grey.shade100,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(30.0),
                                      ),
                                    ),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.black.withOpacity(0.6),
                                      ),
                                      iconSize: 25.0,
                                      color: Colors.black,
                                      //onPressed: getImage,
                                      onPressed: pickImage,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      TextField(
                        textInputAction: TextInputAction.done,
                        onChanged: (value) {
                          setState(() {
                            feedbackContent = value;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'Phản ánh về dịch vụ/Thợ (nếu có)*',
                          border: OutlineInputBorder(),
                        ),
                        maxLines: 5,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Container(
                          width: 350,
                          child: Column(
                            children: <Widget>[
                              RaisedButton(
                                textColor: Color(0xff28BEBA),
                                //oxff
                                child: Text(
                                  'GỬI ĐÁNH GIÁ',
                                  style: TextStyle(fontSize: 18),
                                ),
                                color: Colors.white,
                                shape: Border.all(
                                    color: Color(0xff28BEBA), width: 2),
                                onPressed: () {
                                  // Navigator.of(context).push(
                                  //   MaterialPageRoute(
                                  //     builder: (context) => HomeScreen(),
                                  //   ),
                                  // );
                                  SimpleAPI.postFeedback("feedbacks",
                                      rateScore: rating.toString(),
                                      bookingDetailId:
                                          widget.model.id.toString(),
                                      feedbackContent: feedbackContent,
                                      path: _file.path.toString());
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => HomeScreen(),
                                    ),
                                  );
                                },
                              ),
                              RaisedButton(
                                textColor: Colors.white,
                                //oxff
                                child: Text(
                                  'QUAY VỀ TRANG CHỦ',
                                  style: TextStyle(fontSize: 18),
                                ),
                                color: Color(0xff28BEBA),
                                shape:
                                    Border.all(color: Colors.white70, width: 2),
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => HomeScreen(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

//
// Widget _buildMultipleTextField() {
//   return TextField(
//     textInputAction: TextInputAction.done,
//     onChanged: (value) {
//
//     },
//     decoration: InputDecoration(
//       labelText: 'Phản ánh về dịch vụ/Thợ (nếu có)*',
//       border: OutlineInputBorder(),
//     ),
//     maxLines: 5,
//   );
// }
