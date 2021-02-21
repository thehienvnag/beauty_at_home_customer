import 'package:flutter/material.dart';
import 'package:flutter_app/src/view/blank_search.dart';
import 'package:flutter_app/src/widgets/search_screen_widget.dart';


class SearchPage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<SearchPage> {
   var _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildBar(context),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          // SizedBox(height: 30),
          // Container( // thanh search bar
          //   width: 340,
          //   height: 40,
          //   child: TextField(
          //     textInputAction: TextInputAction.search,
          //     controller: _controller,
          //     cursorColor: Colors.red,
          //     cursorHeight: 28,
          //     style: TextStyle(height: 1),
          //     onChanged: (value) {
          //       // value là giá trị fill
          //     },
          //      onTap: _buttonTapped,
          //     decoration: InputDecoration(
          //         contentPadding: EdgeInsets.symmetric(vertical: 6.0),
          //         fillColor: Colors.grey[350],
          //         filled: true,
          //         border: OutlineInputBorder(
          //             borderRadius: BorderRadius.circular(5.0),
          //             borderSide: BorderSide(
          //                 color: Colors.grey.withOpacity(0.2),
          //                 width: 0.5)),
          //         hintText: 'Tìm kiếm dịch vụ...',
          //         prefixIcon: Icon(
          //           Icons.search,
          //           size: 25.0,
          //         ),
          //         suffixIcon: IconButton(
          //           onPressed: () => _controller.clear(),
          //           icon: Icon(Icons.clear),
          //         )
          //     ),
          //   ),
          // ),
          SizedBox(height: 10),
          Text('ĐÃ XEM GẦN ĐÂY', style: TextStyle( color: Colors.black, fontSize: 22,)),
          SizedBox(height: 15),
          RecomendsServices(),
          Text('GIỚI THIỆU CHO BẠN',style: TextStyle(color: Colors.black, fontSize: 22,)),
          SizedBox(height: 15),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(
                  color: Colors.grey.withOpacity(0.2),
                  width: 0.5,
                )
            ),
            child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 110,
                          height: 130,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(5.0),
                            child: Image(
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.topLeft,
                              image: NetworkImage(
                                  "https://images.unsplash.com/photo-1571290274554-6a2eaa771e5f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80"),
                            ),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: myDetailsContainer2(),
                          ),
                        ),
                        SizedBox(width: 30,),
                      ],
                    ),
            ),
          ),SizedBox(height: 5),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(
                  color: Colors.grey.withOpacity(0.2),
                  width: 0.5,
                )
            ),
            child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 110,
                          height: 130,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(5.0),
                            child: Image(
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.topLeft,
                              image: NetworkImage(
                                  "https://images.unsplash.com/photo-1522338242992-e1a54906a8da?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80"),
                            ),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: myDetailsContainer1(),
                          ),
                        ),
                        SizedBox(width: 30,),
                      ],
                    )
            ),
          ),SizedBox(height: 5),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(
                  color: Colors.grey.withOpacity(0.2),
                  width: 0.5,
                )
            ),
            child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 110,
                          height: 130,
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(5.0),
                            child: Image(
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.topLeft,
                              image: NetworkImage(
                                  "https://images.unsplash.com/photo-1611072245308-50d572b28822?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80"),
                            ),
                           ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 1.0),
                            child: myDetailsContainer3(),
                          ),
                        ),
                        SizedBox(width: 30,),
                      ],
                    )
            ),
          ),SizedBox(height: 5),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(
                  color: Colors.grey.withOpacity(0.2),
                  width: 0.5,
                )
            ),
            child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 110,
                          height: 120,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(5.0),
                            child: Image(
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.topLeft,
                              image:
                              NetworkImage(
                                  "https://images.unsplash.com/photo-1599948128020-9a44505b0d1b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80"),
                            ),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: myDetailsContainer2(),
                          ),
                        ),
                        SizedBox(width: 30,),
                      ],
              ),
            ),
          ),SizedBox(height: 5),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(
                  color: Colors.grey.withOpacity(0.2),
                  width: 0.5,
                )
            ),
            child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 110,
                          height: 130,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(5.0),
                            child: Image(
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.topLeft,
                              image: NetworkImage(
                                  "https://images.unsplash.com/photo-1522338242992-e1a54906a8da?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80"),
                            ),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: myDetailsContainer1(),
                          ),
                        ),
                        SizedBox(width: 30,),
                      ],
              ),
            ),
          ),SizedBox(height: 5),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(
                  color: Colors.grey.withOpacity(0.2),
                  width: 0.5,
                )
            ),
            child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 110,
                          height: 130,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(5.0),
                            child: Image(
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.topLeft,
                              image: NetworkImage(
                                  "https://images.unsplash.com/photo-1571290274554-6a2eaa771e5f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80"),
                            ),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: myDetailsContainer2(),
                          ),
                        ),
                        SizedBox(width: 30,),
                      ],
              ),
            ),
          ),SizedBox(height: 5),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white54,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('Search')),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text('Account')),
        ],
      ),
    );

  }

  Future _buttonTapped() async {
     Navigator.of(context).push(new MaterialPageRoute<dynamic>(
      builder: (BuildContext context) {
        return new BlankScreen();
      },
    ));
  }

  Widget myDetailsContainer1() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
                width: 240,
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Text("Marry Trần",
                    style: TextStyle(color: Color(0xffe6020a), fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 105,
                      alignment: Alignment.topRight,
                      child: Icon( Icons.star, color: Colors.amber, size: 15.0),
                    ),
                    Container(
                        width: 25,
                        alignment: Alignment.topLeft,
                        child: Text("4.8",
                          style: TextStyle(color: Colors.black54, fontSize: 15.0),
                        )),
                  ],
                )),
          ),
        ),
        Container(
            width: 240,
            alignment: Alignment.topLeft,
            child: Text(" Trang điểm, làm tóc",
          style: TextStyle(
              color: Colors.black54, fontSize: 18.0, fontWeight: FontWeight.bold),
        )),
        Container(
             width: 240,
            child: Text(" 5km | TP Hồ Chí Minh",
              style: TextStyle(
                color: Colors.black54, fontSize: 18.0, fontWeight: FontWeight.bold),
        )),
        Container(
            width: 240,
            alignment: Alignment.topLeft,
            child: Text(" Đang hoặt động",
            style: TextStyle(
                color: Colors.lightBlueAccent, fontSize: 16.0, fontWeight: FontWeight.bold),
        )),
        Container(
            width: 240,
            alignment: Alignment.topLeft,
            child: Text(" 9:00 AM - 8:30 PM",
            style: TextStyle(color: Colors.black54,fontSize: 15.0, fontWeight: FontWeight.bold),
        )),
      ],
    );
  }

  Widget myDetailsContainer2() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              width: 240,
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  Text("Hani Nguyễn",
                    style: TextStyle(color: Color(0xffe6020a),fontSize: 20.0, fontWeight: FontWeight.bold),
                   ),
                  Container(
                    width: 87,
                    alignment: Alignment.topRight,
                    child: Icon( Icons.star, color: Colors.amber, size: 15.0),
                  ),
                  Container(
                      width: 25,
                      child: Text("4.8",
                        style: TextStyle(color: Colors.black54, fontSize: 15.0),
                      )),
                ],
              )
          ),
        ),
        Container(
            width: 240,
            child: Text(" Làm Nail, làm tóc..",
                  style: TextStyle(color: Colors.black54,fontSize: 18.0,fontWeight: FontWeight.bold),
        )),
        Container(
            width: 240,
            child: Text(" 2.3km | TP Hồ Chí Minh",
                  style: TextStyle( color: Colors.black54, fontSize: 18.0, fontWeight: FontWeight.bold),
        )),
        Container(
            width: 240,
            child: Text(" Đang hoặt động",
                  style: TextStyle( color: Colors.lightBlueAccent, fontSize: 16.0, fontWeight: FontWeight.bold),
        )),
        Container(
            width: 240,
            child: Text(" 8:00 AM - 8:30 PM",textAlign: TextAlign.left,
                style: TextStyle(color: Colors.black54, fontSize: 15.0, fontWeight: FontWeight.bold),
        )),
      ],
    );
  }

  Widget myDetailsContainer3() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              width: 240,
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  Text(" Tony Đặng",
                    style: TextStyle(color: Color(0xffe6020a),fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: 109,
                    alignment: Alignment.topRight,
                    child: Icon( Icons.star, color: Colors.amber, size: 15.0),
                  ),
                  Container(
                      width: 25,
                      child: Text("4.8",
                        style: TextStyle(color: Colors.black54, fontSize: 15.0),
                      )
                  ),
                ],
              )),
        ),
        Container(
            width: 240,
            child: Text("   Làm Nail , Massage",
          style: TextStyle(
              color: Colors.black54,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        )),
        Container(
            width: 240,
            child: Text("   5km | TP Hồ Chí Minh",
          style: TextStyle(
              color: Colors.black54,fontSize: 18.0,fontWeight: FontWeight.bold),
        )),
        Container(
            width: 240,
            child: Text("    Đang hoặt động",
          style: TextStyle(color: Colors.lightBlueAccent, fontSize: 16.0, fontWeight: FontWeight.bold),
        )),
        Container(
            width: 240,
            child: Text("    9:00 AM - 8:30 PM",
          style: TextStyle(
              color: Colors.black54, fontSize: 15.0,fontWeight: FontWeight.bold),
        )),
      ],
    );
  }


  Widget _buildBar(BuildContext context) {
    var _controller = TextEditingController();
    return new AppBar(
      title:
      Container(
        width: 340,
        height: 40,
        child: TextField(
          textInputAction: TextInputAction.search,
          controller: _controller,
          cursorColor: Colors.red,
          cursorHeight: 28,
          style: TextStyle(height: 1),
          // onChanged: (value) {
          //   // value là giá trị fill
          // },
          onTap: _buttonTapped,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 6.0),
              fillColor: Colors.grey[350],
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.2),width: 0.5)),
              hintText: 'Tìm kiếm dịch vụ...',
              prefixIcon: Icon(Icons.search, size: 25.0),
              suffixIcon: IconButton(
                onPressed: () => _controller.clear(),
                icon: Icon(Icons.clear),
              )
          ),
        ),
      ),
    );
  }

}
