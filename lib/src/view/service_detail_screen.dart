import 'package:flutter/material.dart';
import 'package:flutter_app/src/models/provider_detail_model/provider_feedback_model.dart';
import 'package:flutter_app/src/models/provider_detail_model/service_model.dart';
import 'package:flutter_app/src/view/provider_detail_screen.dart';
import 'package:flutter_app/src/widgets/service_detail_widget.dart';
import 'package:intl/intl.dart';

List<ProviderFeedback> lstProviderFeedback = List.from([
  ProviderFeedback(
      username: 'Hiển Huỳnh',
      rateScore: 4.5,
      imageUrl: [
        'public/img/nail_1.jpg',
        'public/img/nail_2.jpg',
        'public/img/nail_1.jpg',
        'public/img/nail_2.jpg',
        'public/img/nail_1.jpg',
        'public/img/nail_2.jpg',
        'public/img/nail_3.png',
      ],
      feedback:
          'Dịch vụ chuyên nghiệp, nhân viên có tay nghề, sẽ quay lại trong tương lai',
      userImage: 'public/img/user_image.jpg',
      commentedDate: '29-01-2021'),
  ProviderFeedback(
      username: 'Trang Cao',
      rateScore: 4.0,
      imageUrl: [
        'public/img/nail_1.jpg',
        'public/img/nail_2.jpg',
      ],
      feedback:
          'Trời mưa nóng mà bước vô Mít cái mát rượi luôn, vừa làm nail vừa uống '
          'trà sữa đã gì đâu. Bạn nhân viên vui tính, làm rất nhiệt tình và '
          'luôn hỏi ý mình khi chọn màu sơn. Sơn ra khác hợp với tay, màu '
          'sơn đều đẹp, nói chung là ưng ý.',
      userImage: 'public/img/user_image_3.jpg',
      commentedDate: '31-01-2021'),
]);

class ServiceDetailScreen extends StatefulWidget {
  final Service service;
  final Map<Service, int> cart;

  const ServiceDetailScreen({Key key, this.service, this.cart})
      : super(key: key);

  @override
  _ServiceDetailScreenState createState() => _ServiceDetailScreenState();
}

class _ServiceDetailScreenState extends State<ServiceDetailScreen> {
  int updatingQuantity = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.cart != null && widget.cart.containsKey(widget.service)) {
      updatingQuantity = widget.cart[widget.service];
    } else {
      updatingQuantity = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    Map<Service, int> newCart = widget.cart;
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        // color: Colors.blue,
        child: Row(
          children: <Widget>[
            Container(
              height: screenSize.height * 0.1,
              width: screenSize.width * 0.4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 45.0 * 0.9,
                    width: 45.0 * 0.9,
                    margin: EdgeInsets.only(right: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                      boxShadow: [
                        BoxShadow(color: Colors.grey),
                      ],
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.remove,
                        color: Color(0xff28BEBA),
                      ),
                      onPressed: () {
                        setState(
                          () {
                            if (updatingQuantity > 0) {
                              updatingQuantity--;
                            }
                          },
                        );
                      },
                    ),
                  ),
                  Container(
                      child: Text(
                    updatingQuantity.toString(),
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                  )),
                  Container(
                    height: 45.0 * 0.9,
                    width: 45.0 * 0.9,
                    margin: EdgeInsets.only(left: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                      boxShadow: [
                        BoxShadow(color: Colors.grey),
                      ],
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Color(0xff28BEBA),
                      ),
                      onPressed: () {
                        setState(() {
                          if (updatingQuantity < 10) {
                            updatingQuantity++;
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10.0),
              height: screenSize.height * 0.057,
              width: screenSize.width * 0.55,
              child: FloatingActionButton.extended(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                onPressed: () {
                  if (newCart == null) {
                    newCart = new Map();
                  }
                  if (!newCart.containsKey(widget.service) &&
                      updatingQuantity > 0) {
                    newCart[widget.service] = updatingQuantity;
                  } else {
                    if (newCart.containsKey(widget.service) &&
                        updatingQuantity == 0) {
                      newCart.remove(widget.service);
                    } else if (newCart.containsKey(widget.service) &&
                        newCart[widget.service] != updatingQuantity) {
                      newCart.update(
                          widget.service, (dynamic val) => updatingQuantity);
                    }
                  }
                  String fromScreen = ModalRoute.of(context).settings.arguments;
                  if (fromScreen == "From-Promotion" ||
                      fromScreen == "From-Popular-Service") {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProviderDetailScreen(cart: newCart),
                    ));
                  } else {
                    Navigator.pop(context, newCart);
                  }
                },
                backgroundColor: setButtonColor(
                    widget.service, widget.cart, updatingQuantity),
                label: Text(
                  button(widget.service, newCart, updatingQuantity),
                  style: TextStyle(
                      fontSize: 10.0, color: Colors.white, letterSpacing: 3),
                ),
              ),
            ),
          ],
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: Container(
      //   margin: EdgeInsets.only(bottom: 10.0),
      //   height: screenSize.height * 0.06,
      //   width: screenSize.width * 0.9,
      //   child: FloatingActionButton.extended(
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.all(
      //         Radius.circular(5.0),
      //       ),
      //     ),
      //     onPressed: () {
      //       if (newCart == null) {
      //         newCart = new Map();
      //       }
      //       if (!newCart.containsKey(widget.service) && updatingQuantity > 0) {
      //         newCart[widget.service] = updatingQuantity;
      //       } else {
      //         if (newCart.containsKey(widget.service) && updatingQuantity == 0) {
      //           newCart.remove(widget.service);
      //         } else if (newCart.containsKey(widget.service) &&
      //             newCart[widget.service] != updatingQuantity) {
      //           newCart.update(widget.service, (dynamic val) => updatingQuantity);
      //         }
      //       }
      //
      //       Navigator.pop(context, newCart);
      //     },
      //     backgroundColor: setButtonColor(widget.service, widget.cart, updatingQuantity),
      //     label: Text(
      //       button(widget.service, newCart, updatingQuantity),
      //       style: TextStyle(color: Colors.white, letterSpacing: 3),
      //     ),
      //   ),
      // ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              ServiceDetailImage(
                lstImage: widget.service.serviceImages,
                cart: newCart,
              ),
              ServiceDetailDescription(
                name: widget.service.name,
                note: widget.service.note,
                price: formatPrice(widget.service.price),
              ),
              ServiceDetailStepDescription(
                description: widget.service.description,
              ),
              Container(
                height: 30.0,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 5.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  // border: Border(bottom: BorderSide(width: 1.0))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // _buildCategory(0),
                    _buildCategory(),
                    Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Text(
                        'Xem tất cả >',
                        style: TextStyle(color: Color(0xff28BEBA)),
                      ),
                    )
                  ],
                ),
              ),
              _buildStar(),
              Container(
                child: _buildFeedback(lstProviderFeedback),
              ),
              // Container(
              //   height: screenSize.height * 0.1,
              //   width: screenSize.width,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: <Widget>[
              //       Container(
              //         height: 45.0 * 0.9,
              //         width: 45.0 * 0.9,
              //         margin: EdgeInsets.only(right: 10.0),
              //         decoration: BoxDecoration(
              //           color: Colors.white,
              //           borderRadius: BorderRadius.circular(5.0),
              //           boxShadow: [
              //             BoxShadow(color: Colors.grey),
              //           ],
              //         ),
              //         child: IconButton(
              //           icon: Icon(
              //             Icons.remove,
              //             color: Color(0xff28BEBA),
              //           ),
              //           onPressed: () {
              //             setState(
              //               () {
              //                 if (updatingQuantity > 0) {
              //                   updatingQuantity--;
              //                 }
              //               },
              //             );
              //           },
              //         ),
              //       ),
              //       Container(
              //           child: Text(
              //         updatingQuantity.toString(),
              //         style: TextStyle(
              //             fontSize: 15.0, fontWeight: FontWeight.bold),
              //       )),
              //       Container(
              //         height: 45.0 * 0.9,
              //         width: 45.0 * 0.9,
              //         margin: EdgeInsets.only(left: 10.0),
              //         decoration: BoxDecoration(
              //           color: Colors.white,
              //           borderRadius: BorderRadius.circular(5.0),
              //           boxShadow: [
              //             BoxShadow(color: Colors.grey),
              //           ],
              //         ),
              //         child: IconButton(
              //           icon: Icon(
              //             Icons.add,
              //             color: Color(0xff28BEBA),
              //           ),
              //           onPressed: () {
              //             setState(() {
              //               if (updatingQuantity < 10) {
              //                 updatingQuantity++;
              //               }
              //             });
              //           },
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(height: 30.0,)
            ],
          ),
        ),
      ),
    );
  }

  String formatPrice(String price) {
    String result = price.toString() + '000';
    var formatter = NumberFormat('###,000');
    String formatString = formatter.format(int.parse(result));
    return formatString.replaceAll(new RegExp(r','), '.');
  }

  String button(Service service, Map<Service, int> cart, int quantity) {
    if (cart != null) {
      if (cart.containsKey(service) && quantity == 0) {
        return 'XÓA DỊCH VỤ';
      } else if (cart.containsKey(service) && cart[service] != quantity) {
        return 'CẬP NHẬT GIỎ HÀNG';
      } else if (cart.containsKey(service) && cart[service] == quantity) {
        return 'QUAY LẠI CHỌN DỊCH VỤ';
      } else if (!cart.containsKey(service) && quantity == 0) {
        return 'QUAY LẠI CHỌN DỊCH VỤ';
      } else if (!cart.containsKey(service) && quantity > 0) {
        return 'THÊM VÀO GIỎ HÀNG';
      }
    } else if (cart == null && quantity == 0) {
      return 'QUAY LẠI CHỌN DỊCH VỤ';
    }
    return 'THÊM VÀO GIỎ HÀNG';
  }

  Color setButtonColor(Service service, Map<Service, int> cart, int quantity) {
    if (cart != null) {
      if (cart.containsKey(service) && quantity == 0) {
        return Colors.redAccent;
      } else if (cart.containsKey(service) && cart[service] != quantity) {
        return Color(0xff28BEBA);
      } else if (cart.containsKey(service) && cart[service] == quantity) {
        return Colors.grey;
      } else if (!cart.containsKey(service) && quantity == 0) {
        return Colors.grey;
      } else if (!cart.containsKey(service) && quantity > 0) {
        return Color(0xff28BEBA);
      }
    } else if (cart == null && quantity == 0) {
      return Colors.grey;
    }
    return Color(0xff28BEBA);
  }

  Widget _buildFeedback(List<ProviderFeedback> lstFeedback) {
    return ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: lstFeedback.length,
        itemBuilder: (BuildContext context, int index) {
          ProviderFeedback proFeedback = lstFeedback[index];
          List<String> lstImage = lstFeedback[index].imageUrl;
          return Stack(
            children: <Widget>[
              Positioned(
                left: 20.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image(
                    image: AssetImage(proFeedback.userImage),
                    width: 40.0,
                    height: 40.0,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(70.0, 0.0, 20.0, 0.0),
                    // height: 100,
                    // width: 00,
                    color: Color(0xFFC4C4C4).withOpacity(0.2),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                proFeedback.username,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 22.0,
                            ),
                            Text(
                              proFeedback.rateScore.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 12.0),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 20.0, bottom: 10.0, right: 15.0),
                          child: Text(proFeedback.feedback),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 60.0),
                    height: 100.0,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: lstImage.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.all(10.0),
                            child: Image(
                              image: AssetImage(lstImage[index]),
                              fit: BoxFit.cover,
                            ),
                          );
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 70, bottom: 20.0),
                    child: Text(
                      'Đã đăng vào ngày ${proFeedback.commentedDate}',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                  Divider(
                    thickness: 1,
                  ),
                ],
              ),
            ],
          );
        });
  }

  Widget _buildCategory() {
    return AnimatedContainer(
      padding: EdgeInsets.only(left: 10.0),
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width * 0.5,
      duration: Duration(milliseconds: 200),
      curve: Curves.bounceIn,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          // border: _selectedIndex == index
          //     ? Border(
          //         top: BorderSide(width: 3.0, color: Colors.cyan[400]),
          //       )
          //     : null,
          ),
      child: Text(
        'ĐÁNH GIÁ DỊCH VỤ',
        style: TextStyle(
            fontFamily: 'Montserrat',
            // color: _selectedIndex == index ? Color(0xFF3EBACE) : null,
            fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget _buildStar() {
    return Container(
      padding: EdgeInsets.only(left: 15.0, bottom: 5.0),
      // color: Colors.white,
      child: Row(
        children: <Widget>[
          Icon(
            Icons.star,
            color: Colors.yellow,
            size: 18.0,
          ),
          Icon(
            Icons.star,
            color: Colors.yellow,
            size: 18.0,
          ),
          Icon(
            Icons.star,
            color: Colors.yellow,
            size: 18.0,
          ),
          Icon(
            Icons.star,
            color: Colors.yellow,
            size: 18.0,
          ),
          Icon(
            Icons.star,
            color: Colors.yellow,
            size: 18.0,
          ),
          SizedBox(
            width: 5.0,
          ),
          Text(
            '5/5',
          ),
          SizedBox(
            width: 5.0,
          ),
          Text('(50 đánh giá)'),
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Colors.grey[300]))),
    );
  }
}
