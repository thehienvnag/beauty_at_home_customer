import 'package:flutter/material.dart';
import 'package:flutter_app/src/widgets/shared_widget/outlined_card.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class RatingScreen extends StatefulWidget {
  @override
  _Rating_Screen createState() => _Rating_Screen();
}

class _Rating_Screen  extends State<RatingScreen> {
  double rating = 0.0;
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
                            image: AssetImage('public/img/review.png',),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: 350,
                      child: Center(
                          child: Text('Đánh giá dịch vụ bạn được cung cấp',
                            style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),textAlign: TextAlign.center, ))),
                  Container(
                    width: 300,
                      child: Center(
                          child: Text('Bạn trải nghiệm dịch vụ của Uốn/Duỗi /Nhuộm cao cấp AP như thế nào?',
                            style: TextStyle(fontSize: 16),maxLines: 2,textAlign: TextAlign.center,))),
                  OutlinedCard(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    width: 360,
                    sections: [
                      SmoothStarRating(
                        starCount: 5,
                        color: Colors.yellowAccent,
                        borderColor: Colors.grey,
                        allowHalfRating: false,
                        spacing: 6,
                        size: 45,
                        rating: rating,
                        isReadOnly: false,
                        onRated: (value){
                            setState((){
                              rating = value;
                              print("rating is : $rating");
                            });
                        },
                      ),
                      Row(
                        children: [
                          Container(width: 250 ,child: Text('Total paid',style: TextStyle(fontSize: 17),),alignment: Alignment.topLeft),
                          Container(child: Text('84.000 đ',style: TextStyle(fontSize: 17),),alignment: Alignment.topRight,)
                        ],
                      ),
                      _buildMultipleTextField(),
                      Padding(
                        padding: EdgeInsets.only(bottom: 40),
                        child: Container(
                          width: 350,
                          child: RaisedButton(
                            textColor: Color(0xff28BEBA) , //oxff
                            child: Text('Gửi Đánh Giá',style: TextStyle(fontSize: 18),),
                            color: Colors.white,
                            shape: Border.all(color: Color(0xff28BEBA),width: 1),
                            onPressed: () {
                              //Navigator.pushNamed(context, '/blank');
                            },
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

Widget _buildMultipleTextField() {
  return TextField(
    textInputAction: TextInputAction.done,
    decoration: InputDecoration(
      labelText: 'Phản ánh về dịch vụ/Thợ (nếu có)*',
      border: OutlineInputBorder(),
    ),
    maxLines: 6,
  );
}
