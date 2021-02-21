import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Activity History')
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          detailHis(),
        ],
      ),
    );

  }
  Widget detailHis(){
    var date = Jiffy().yMMMMd;
    return Column(
          children: <Widget>[
            Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 10),
                        //   child: Icon(Icons.wysiwyg ,color: Colors.lightBlueAccent,size: 60,),
                        // ),
                        Image(image: AssetImage('public/img/calendar.png'),width: 70,height: 70,),
                        History(
                          saloner: 'Đồng Hữu Long',
                          numService: 10,
                          date: date,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),Container(width: 400, height: 0.5, color: Colors.black.withOpacity(0.5)),
            Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 10),
                      //   child: Icon(Icons.wysiwyg ,color: Colors.lightBlueAccent,size: 60,),
                      // ),
                      Image(image: AssetImage('public/img/calendar.png'),width: 70,height: 70,),
                      History(
                        saloner: 'Đồng Hữu Long',
                        numService: 10,
                        date: date,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),Container(width: 400, height: 0.5, color: Colors.black.withOpacity(0.5)),
            Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 10),
                      //   child: Icon(Icons.wysiwyg ,color: Colors.lightBlueAccent,size: 60,),
                      // ),
                      Image(image: AssetImage('public/img/calendar.png'),width: 70,height: 70,),
                      History(
                        saloner: 'Đồng Hữu Long',
                        numService: 10,
                        date: date,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),Container(width: 400, height: 0.5, color: Colors.black.withOpacity(0.5)),
            Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 10),
                      //   child: Icon(Icons.wysiwyg ,color: Colors.lightBlueAccent,size: 60,),
                      // ),
                      Image(image: AssetImage('public/img/calendar.png'),width: 70,height: 70,),
                      History(
                        saloner: 'Đồng Hữu Long',
                        numService: 10,
                        date: date,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),Container(width: 400, height: 0.5, color: Colors.black.withOpacity(0.5)),
            Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 10),
                      //   child: Icon(Icons.wysiwyg ,color: Colors.lightBlueAccent,size: 60,),
                      // ),
                      Image(image: AssetImage('public/img/calendar.png'),width: 70,height: 70,),
                      History(
                        saloner: 'Đồng Hữu Long',
                        numService: 10,
                        date: date,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),Container(width: 400, height: 0.5, color: Colors.black.withOpacity(0.5)),
            Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 10),
                      //   child: Icon(Icons.wysiwyg ,color: Colors.lightBlueAccent,size: 60,),
                      // ),
                      Image(image: AssetImage('public/img/calendar.png'),width: 70,height: 70,),
                      History(
                        saloner: 'Đồng Hữu Long',
                        numService: 10,
                        date: date,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),Container(width: 400, height: 0.5, color: Colors.black.withOpacity(0.5)),
            Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 10),
                      //   child: Icon(Icons.wysiwyg ,color: Colors.lightBlueAccent,size: 60,),
                      // ),
                      Image(image: AssetImage('public/img/calendar.png'),width: 70,height: 70,),
                      History(
                        saloner: 'Đồng Hữu Long',
                        numService: 10,
                        date: date,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),Container(width: 400, height: 0.5, color: Colors.black.withOpacity(0.5)),
          ],
        );
  }

}
class History extends StatelessWidget {
  const History({
    Key key,
    this.saloner,
    this.numService,
    this.date,
    this.press,
  }) : super(key: key);

  final String saloner;
  final int numService;
  final String date;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 10, bottom: 15),
      width: 320,
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(8),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 220,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "$saloner\n".toUpperCase(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black.withOpacity(0.7)
                              ),
                          ),
                          TextSpan(
                            text: "$numService dịch vụ",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 80,
                      child: Text('$date',
                        style: TextStyle(
                            fontSize: 20,
                          color: Colors.black.withOpacity(0.4),
                        ),
                        textAlign: TextAlign.left,))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
