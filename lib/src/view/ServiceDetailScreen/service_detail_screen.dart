import 'package:flutter/material.dart';
import 'package:flutter_app/src/models-new/cart_model.dart';
import 'package:flutter_app/src/models-new/feedback_model.dart';
import 'package:flutter_app/src/models-new/service_model.dart';
import 'package:flutter_app/src/providers/cart_provider.dart';
import 'package:flutter_app/src/providers/provider_detail_provider.dart';
import 'package:flutter_app/src/providers/service_provider.dart';
import 'package:flutter_app/src/view/ProviderDetail/provider_detail_screen.dart';
import 'package:flutter_app/src/widgets/service_detail_widget.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

List<FeedbackModel> lstProviderFeedback = List.from([
  FeedbackModel(
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
  FeedbackModel(
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
  final String id;
  const ServiceDetailScreen({
    Key key,
    this.id,
  }) : super(key: key);

  @override
  _ServiceDetailScreenState createState() => _ServiceDetailScreenState();
}

class _ServiceDetailScreenState extends State<ServiceDetailScreen> {
  int updatingQuantity = 1;
  bool isFromPromotion = false;
  @override
  void initState() {
    super.initState();
    context.read<ServiceProvider>().initServiceById("46");
    // context.read<ServiceProvider>().initServiceList();

    var provider = context.read<ProviderDetailProvider>();
    // provider.setCurrentService(provider.services[0]);
    var cartProvider = context.read<CartProvider>();
    if (cartProvider.cart != null &&
        cartProvider.cart.services != null &&
        cartProvider.cart.services.containsKey(provider.currentService)) {
      updatingQuantity = cartProvider.cart.services[provider.currentService];
    } else {
      updatingQuantity = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    isFromPromotion =
        ModalRoute.of(context).settings.arguments == "From-Promotion";
    final screenSize = MediaQuery.of(context).size;
    var service = context.select<ProviderDetailProvider, ServiceModel>(
      (value) => value.currentService,
    );
    var newCart = context.select<CartProvider, Map<ServiceModel, int>>(
      (value) => value.cart.services,
    );
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
                  String fromScreen = ModalRoute.of(context).settings.arguments;
                  if (newCart == null) {
                    newCart = new Map();
                  }
                  if (!newCart.containsKey(service) && updatingQuantity > 0) {
                    newCart[service] = updatingQuantity;
                  } else {
                    if (newCart.containsKey(service) && updatingQuantity == 0) {
                      newCart.remove(service);
                    } else if (newCart.containsKey(service) &&
                        newCart[service] != updatingQuantity) {
                      newCart.update(
                          service, (dynamic val) => updatingQuantity);
                    }
                  }
                  var cartProvider = context.read<CartProvider>();
                  cartProvider.setCurrentCart(CartModel(services: newCart));

                  if (fromScreen == "From-Promotion" ||
                      fromScreen == "From-Popular-Service") {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProviderDetailScreen(cart: newCart),
                    ));
                  } else {
                    if (fromScreen == "From-Checkout" && newCart.isEmpty) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            ProviderDetailScreen(cart: newCart),
                      ));
                    } else {
                      Navigator.pop(context, newCart);
                    }
                  }
                },
                backgroundColor:
                    setButtonColor(service, newCart, updatingQuantity),
                label: Text(
                  button(service, newCart, updatingQuantity),
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
      //       if (!newCart.containsKey(service) && updatingQuantity > 0) {
      //         newCart[service] = updatingQuantity;
      //       } else {
      //         if (newCart.containsKey(service) && updatingQuantity == 0) {
      //           newCart.remove(service);
      //         } else if (newCart.containsKey(service) &&
      //             newCart[service] != updatingQuantity) {
      //           newCart.update(service, (dynamic val) => updatingQuantity);
      //         }
      //       }
      //
      //       Navigator.pop(context, newCart);
      //     },
      //     backgroundColor: setButtonColor(service, widget.cart, updatingQuantity),
      //     label: Text(
      //       button(service, newCart, updatingQuantity),
      //       style: TextStyle(color: Colors.white, letterSpacing: 3),
      //     ),
      //   ),
      // ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Consumer<ServiceProvider>(
            builder: (context, value, child) => value.service == null
                ? SizedBox()
                : Column(
                    children: <Widget>[
                      ServiceDetailImage(
                        lstImage: value.service.gallery.images,
                        cart: newCart,
                      ),
                      ServiceDetailDescription(
                        name: value.service.serviceName,
                        note: service.summary,
                        price: value.service.price.toString(),
                        isFromPromotion: isFromPromotion,
                      ),
                      ServiceDetailStepDescription(
                        description: value.service.description.split("/r/n"),
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
                      Consumer<ProviderDetailProvider>(
                        builder: (context, value, child) =>
                            _buildFeedback(List.from([
                          FeedbackModel(
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
                          FeedbackModel(
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
                        ])),
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
      ),
    );
  }

  String formatPrice(String price) {
    String result = price.toString() + '000';
    var formatter = NumberFormat('###,000');
    String formatString = formatter.format(int.parse(result));
    return formatString.replaceAll(new RegExp(r','), '.');
  }

  String button(
      ServiceModel service, Map<ServiceModel, int> cart, int quantity) {
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

  Color setButtonColor(
      ServiceModel service, Map<ServiceModel, int> cart, int quantity) {
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

  Widget _buildFeedback(List<FeedbackModel> lstFeedback) {
    return ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: lstFeedback.length,
        itemBuilder: (BuildContext context, int index) {
          FeedbackModel proFeedback = lstFeedback[index];
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
