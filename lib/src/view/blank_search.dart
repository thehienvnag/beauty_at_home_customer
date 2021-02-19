import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/view/list_search_screen.dart';

class BlankScreen extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<BlankScreen> {
  var _controller = TextEditingController();
  int flag = 0;
  bool isSearching = false;
  String searchKey;
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: _buildBar(context),
        body:
        // !isSearching ?
        ListView(
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
            //       if(value.contains('mong')){
            //         setState(() {
            //           isSearching = true;
            //         });
            //       }else if(value.contains('nail')){
            //         setState(() {
            //           isSearching = true;
            //         });
            //       }
            //     },
            //     // onSubmitted: ,
            //      // onTap: _buttonTapped,
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Được tìm kiếm nhiều', style: TextStyle( color: Colors.black, fontSize: 27,fontStyle: FontStyle.italic)),
            ),SizedBox(height: 5),
            Container(
              width: 240,
              child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color:Colors.grey[350],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(
                              color: Colors.grey.withOpacity(0.8),
                              width: 0.2 ,
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Nail Thái',style: TextStyle(fontSize: 20),),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color:Colors.grey[350],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(
                              color: Colors.grey.withOpacity(0.8),
                              width: 0.2 ,
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Nail hạt dẻ',style: TextStyle(fontSize: 20),),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color:Colors.grey[350],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(
                              color: Colors.grey.withOpacity(0.8),
                              width: 0.2 ,
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Trang điểm',style: TextStyle(fontSize: 20),),
                        ),
                      ),
                    ),
                  ]
              ),

            ),
            Container(
              width: 240,
              child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color:Colors.grey[350],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(
                              color: Colors.grey.withOpacity(0.8),
                              width: 0.2 ,
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Làm tóc',style: TextStyle(fontSize: 20),),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color:Colors.grey[350],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(
                              color: Colors.grey.withOpacity(0.8),
                              width: 0.2 ,
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Nối mi',style: TextStyle(fontSize: 20)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color:Colors.grey[350],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(
                              color: Colors.grey.withOpacity(0.8),
                              width: 0.2 ,
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Salon tinh dầu',style: TextStyle(fontSize: 20)),
                        ),
                      ),
                    ),
                  ]
              ),
            ),
            Container(
              width: 240,
              child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color:Colors.grey[350],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(
                              color: Colors.grey.withOpacity(0.8),
                              width: 0.2 ,
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Trang điểm tiệc',style: TextStyle(fontSize: 20),),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color:Colors.grey[350],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(
                              color: Colors.grey.withOpacity(0.8),
                              width: 0.2 ,
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Uốn tóc cong',style: TextStyle(fontSize: 20)),
                        ),
                      ),
                    ),
                  ]
              ),
            ),SizedBox(height: 20),
            Container(width: 240, height: 2, color: Colors.black),SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Lịch sử tìm kiếm của bạn',style: TextStyle(color: Colors.black, fontSize: 27, fontStyle: FontStyle.italic)),
            ),SizedBox(height: 10),
            Container(
              width: 240,
              child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color:Colors.grey[350],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(
                              color: Colors.grey.withOpacity(0.8),
                              width: 0.2 ,
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('trang diem',style: TextStyle(fontSize: 20),),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color:Colors.grey[350],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(
                              color: Colors.grey.withOpacity(0.8),
                              width: 0.2 ,
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('son mong',style: TextStyle(fontSize: 20),),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color:Colors.grey[350],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(
                              color: Colors.grey.withOpacity(0.8),
                              width: 0.2 ,
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('dam lung',style: TextStyle(fontSize: 20),),
                        ),
                      ),
                    ),
                  ]
              ),

            ),
            Container(
              width: 240,
              child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color:Colors.grey[350],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(
                              color: Colors.grey.withOpacity(0.8),
                              width: 0.2 ,
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('son mong tay dep',style: TextStyle(fontSize: 20),),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color:Colors.grey[350],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(
                              color: Colors.grey.withOpacity(0.8),
                              width: 0.2 ,
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('lam toc quan 9',style: TextStyle(fontSize: 20)),
                        ),
                      ),
                    ),
                  ]
              ),
            ),
          ],
        )
        // : _listSearch(context),
      );
  }

  void _selectItem(String value, BuildContext context){
    Navigator.of(context).pop({'selection':value});
  }

  Widget _buildBar(BuildContext context) {
    var _controller = TextEditingController();
    return new AppBar(
      title: Container(
        width: 340,
        height: 40,
        child: TextField(
          textInputAction: TextInputAction.search,
          controller: _controller,
          cursorColor: Colors.red,
          cursorHeight: 20, style: TextStyle(height: 1, ),
          onSubmitted: (value) {
            if(value.isNotEmpty) {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ListSearchScreen(),));
            }
          },
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 6.0),
              fillColor: Colors.grey[350],
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.2),
                      width: 0.5)),
              hintText: 'Tìm kiếm dịch vụ...',
              prefixIcon: Icon(
                Icons.search,
                size: 25.0,
              ),
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