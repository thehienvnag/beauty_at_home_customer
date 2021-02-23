import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          // elevation: 0,
          // leadingWidth: 0,
          leading: Builder(
            builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(Icons.arrow_back_ios,color: Colors.lightBlue,),
                    onPressed: () {
                      Navigator.pushNamed(context, '/'); },);
                  },
                ),
            backgroundColor: Colors.blueAccent,
          title: Text('Activity History',style: TextStyle(color: Colors.lightBlueAccent),),
        ),
        body:
        ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SizedBox(height: 10,),
                Container(
                  height: 55,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                  ),
                  child: Container(
                    color: Colors.white.withOpacity(0.7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        _buildCategory(0),
                        _buildCategory(1),
                      ],
                    ),
                  ),

                ),
                Container(width: 400, height: 0.5, color: Colors.black.withOpacity(0.5)),
                _buildComponent(_selectedIndex),
              ],
            ),
          ],
        ),
      ),
    );
  }
  List<String> _categories = [
    'Lịch sử dùng',
    'Đơn hiện tại',
  ];

  Widget _buildCategory(int index) {
    return Container(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        child: AnimatedContainer(
          height: MediaQuery.of(context).size.height,
          width: 140,
          duration: Duration(milliseconds: 100),
          curve: Curves.easeIn,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: _selectedIndex == index
                ? Border(top: BorderSide(width: 3.0, color: Colors.cyan[400]),)
                : null,
          ),
          child:
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                _categories[index],
                style: TextStyle(
                    color: _selectedIndex == index ? Color(0xFF3EBACE) : null,
                    fontWeight: FontWeight.w400,fontSize: 18
              ),
              ),
            ),
        ),
      ),
    );
  }
  Widget _detailHis(){
    var date = Jiffy().yMMMMd;
    return Column(
          children: <Widget>[
            Column(
                    children: [
                      Container(
                        color: Colors.white,
                        child: Row(
                          children: [
                            History(
                              imgUrl: 'public/img/calendar.png',
                              saloner: 'Đồng Hữu Long',
                              numService: 10,
                              date: date,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30,child: Container(color: Colors.white),),
                    ],
              ),Container(width: 400, height: 0.5, color: Colors.black.withOpacity(0.5)),
            Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Row(
                    children: [
                      History(
                        imgUrl: 'public/img/calendar.png',
                        saloner: 'Đồng Hữu Long',
                        numService: 10,
                        date: date,
                      ),
                    ],
                  ),
                ),
                //SizedBox(height: 30,child: Container(color: Colors.white),),
              ],
            ),Container(width: 400, height: 0.5, color: Colors.black.withOpacity(0.5)),
            Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Row(
                    children: [
                      History(
                        imgUrl: 'public/img/calendar.png',
                        saloner: 'Đồng Hữu Long',
                        numService: 10,
                        date: date,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30,child: Container(color: Colors.white),),
              ],
            ),Container(width: 400, height: 0.5, color: Colors.black.withOpacity(0.5)),
            Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Row(
                    children: [
                      History(
                        imgUrl: 'public/img/calendar.png',
                        saloner: 'Đồng Hữu Long',
                        numService: 10,
                        date: date,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30,child: Container(color: Colors.white),),
              ],
            ),Container(width: 400, height: 0.5, color: Colors.black.withOpacity(0.5)),
          ],
        );
  }
  Widget _buildComponent(int index) {
    switch (index) {
      case 0:
        return _detailHis();
        break;
      case 1:
        return Text('hello');
        break;
    }
  }

}
class History extends StatelessWidget {
  const
  History({
    Key key,
    this.saloner,
    this.imgUrl,
    this.numService,
    this.date,
    this.press,
  }) : super(key: key);

  final String saloner,imgUrl;
  final int numService;
  final String date;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 10),
      width: MediaQuery.of(context).size.width*0.9,
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: press,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: <Widget>[
                  Container(
                      width:50,margin: EdgeInsets.only(right: 13),
                      child: Image.asset('$imgUrl',width: 40,height: 40,)),
                  Container(
                    width: 160,margin: EdgeInsets.only(top: 5),
                    height: 50,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "$saloner\n".toUpperCase(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.black.withOpacity(0.7)
                              ),
                          ),
                          TextSpan(
                            text: "$numService dịch vụ",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 100,
                      child: Text('$date',
                        style: TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.4),),
                        textAlign: TextAlign.left,)
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
