import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/models-new/cart_model.dart';
import 'package:flutter_app/src/models-new/service_model.dart';
import 'package:flutter_app/src/providers/account_provider.dart';
import 'package:flutter_app/src/providers/cart_provider.dart';
import 'package:flutter_app/src/providers/provider_detail_provider.dart';
import 'package:flutter_app/src/utils/routes_name.dart';
import 'package:flutter_app/src/utils/utils.dart';
import 'package:flutter_app/src/widgets/provider_detail_screen_widget.dart';
import 'package:flutter_app/src/widgets/shared_widget/style.dart';
import 'package:provider/provider.dart';

List<String> _categories = [
  'Hình ảnh',
  'DANH MỤC DỊCH VỤ',
  'Đánh giá',
];

class ProviderDetailScreen extends StatefulWidget {
  final Map<ServiceModel, int> cart;
  final String id;

  const ProviderDetailScreen({Key key, this.cart, this.id}) : super(key: key);

  //
  @override
  _ProviderDetailScreenState createState() => _ProviderDetailScreenState();
}

class _ProviderDetailScreenState extends State<ProviderDetailScreen> {
  int _selectedIndex = 1;
  Map<ServiceModel, int> newCart;

  // Future<ProviderModel> provider;
  // Future<List<ProviderModel>> listProvider;
  String error = '';

  @override
  void initState() {
    super.initState();
    if (widget.cart != null) {
      newCart = widget.cart;
    }
    var provider = context.read<ProviderDetailProvider>();
    if (provider.provider == null ||
        widget.id != null && widget.id != provider.provider.id.toString()) {
      provider.initProvider(widget.id);
    }

    // listProvider = ProviderAPI().getAllProvider((callback) => error = callback);
    // provider = ProviderAPI()
    //     .getProviderById((callback) => {error = callback}, widget.id);
    // var providerDetailProvider = context.read<ProviderDetailProvider>();
    // providerDetailProvider.initProvider();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProviderDetailProvider>(
        builder: (context, value, child) => value.provider == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Scaffold(
                body: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    ProviderImage(
                      path: value.provider.gallery.images[0].imageUrl,
                      // 'https://cdn.sudospaces.com/website/topz.vn/home/topz/public_html/2020/01/q-makeup-academy-378010.jpg',
                      cart: newCart,
                    ),
                    ProviderDescription(
                      provider: value.provider,
                    ),
                    Container(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey[300],
                              offset: Offset(0.0, 5.0)),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          _buildCategory(1),

                          // _buildCategory(2),
                        ],
                      ),
                    ),
                    value.services != null && value.services.isNotEmpty
                        ? _buildService(
                            value.services,
                            newCart,
                          )
                        : Container(
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: Center(
                              child: Text(
                                'Hiện tại không có dịch vụ khả dụng',
                                style: CustomTextStyle.subtitleText(
                                    Colors.black54),
                              ),
                            ),
                          ),
                    _checkCart(newCart),
                  ],
                ),

                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
                // floatingActionButton: buildFloatingButton(newCart),
                floatingActionButton: Consumer<CartProvider>(
                  builder: (context, value, child) => value.cart != null
                      ? buildFloatingButton(value.cart.services)
                      : Container(),
                ),
              ),
      ),
    );
  }

  Widget buildFloatingButton(
    Map<ServiceModel, int> cart,
  ) {
    if (cart != null) {
      if (cart.isNotEmpty) {
        final screenSize = MediaQuery.of(context).size;
        return Container(
          margin: const EdgeInsets.only(bottom: 5),
          width: screenSize.width * 0.95,
          child: FloatingActionButton.extended(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
            onPressed: () {
              var cartProvider = context.read<CartProvider>();
              var accountProvider = context.read<AccountProvider>();
              var providerProvider = context.read<ProviderDetailProvider>();

              CartModel cartModel = CartModel(
                providerName: providerProvider.provider.displayName,
                providerImage:
                    providerProvider.provider.gallery.images.first.imageUrl,
                customerAccountId:
                    accountProvider.accountSignedIn?.uid.toString(),
                beautyArtistAccountId: providerProvider.provider.id.toString(),
                services: cart,
              );

              cartProvider.setCurrentCart(cartModel);

              Navigator.of(context).pushNamed(Routes.checkout);
            },
            backgroundColor: Color(0xff28BEBA),
            label: Container(
              width: 320.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Đơn của bạn',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    newCart == null || newCart.isEmpty
                        ? ''
                        : '${_calculateTotal(cart)} dịch vụ',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    newCart == null || newCart.isEmpty
                        ? ''
                        : '${Utils.formatPrice(_calculatePrice(newCart))}',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    }
    return Container();
  }

  Widget _checkCart(Map<ServiceModel, int> cart) {
    if (cart == null) {
      return Container();
    } else if (cart != null && cart.isNotEmpty) {
      return SizedBox(
        height: 40.0,
      );
    }
    return Container();
  }

  String _calculatePrice(Map<ServiceModel, int> cart) {
    double total = 0;
    cart.forEach((key, value) {
      total += key.price * value;
    });
    // return formatPrice(total.toString());
    return total.toString();
  }

  String _calculateTotal(Map<ServiceModel, int> cart) {
    int total = 0;
    cart.forEach((key, value) {
      total += value;
    });
    return total.toString();
  }

  // String formatPrice(String price) {
  //   String result = price.toString();
  //   var formatter = NumberFormat('###,000');
  //   String formatString = formatter.format(int.parse(result));
  //   return formatString.replaceAll(new RegExp(r','), '.');
  // }

  Widget _buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: AnimatedContainer(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width * 0.9,
        duration: Duration(milliseconds: 200),
        curve: Curves.bounceIn,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            // border: _selectedIndex == index
            //     ? Border(
            //         top: BorderSide(width: 3.0, color: Colors.cyan[400]),
            //       )
            //     : null,
            ),
        child: Text(
          _categories[index],
          style: TextStyle(
              fontFamily: 'Montserrat',
              color: _selectedIndex == index ? Colors.black : null,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.0),
        ),
      ),
    );
  }

  // Widget _buildImage(int index) {
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: Container(
  //       height: 100,
  //       width: 100,
  //       child: Image(
  //         image: AssetImage(provider.imageUrl),
  //         fit: BoxFit.cover,
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildPicture(int index) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //     children: <Widget>[
  //       SizedBox(
  //         height: 20.0,
  //       ),
  //       Container(
  //         width: 350,
  //         child: GridView.count(
  //           shrinkWrap: true,
  //           physics: NeverScrollableScrollPhysics(),
  //           crossAxisCount: 3,
  //           // mainAxisSpacing: 10.0,
  //           // crossAxisSpacing: 10.0,
  //           children: List.generate(lstImage.length, (index) {
  //             return Center(
  //               child: Container(
  //                 // margin: EdgeInsets.only(left: ),
  //                 width: 110,
  //                 height: 110,
  //                 child: ClipRRect(
  //                   borderRadius: BorderRadius.circular(10.0),
  //                   child: Image(
  //                     image: AssetImage(lstImage[index]),
  //                     fit: BoxFit.cover,
  //                   ),
  //                 ),
  //               ),
  //             );
  //           }),
  //         ),
  //       ),
  //       SizedBox(
  //         height: 20.0,
  //       )
  //     ],
  //   );
  // }

  Widget _buildService(
      List<ServiceModel> lstService, Map<ServiceModel, int> cart) {
    return Consumer<ProviderDetailProvider>(
      builder: (context, value, child) => Column(
        children: <Widget>[
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: value.services.length,
            itemBuilder: (BuildContext buildContext, int index) {
              ServiceModel service = value.services[index];
              return GestureDetector(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 0.0),
                        height: 150.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white54,
                          border: Border(
                              bottom: BorderSide(color: Colors.grey[300])),
                          // borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(110.0, 18.0, 0.0, 0.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: 115.0,
                                    child: Text(
                                      service.serviceName,
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Text(
                                    Utils.formatPrice(service.price.toString()),
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10.0),
                                child: Text(
                                  service.summary,
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20.0,
                        top: 15.0,
                        bottom: 15.0,
                        child: Hero(
                          tag: service.gallery.images[0].imageUrl,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Image(
                              width: 115.0,
                              image: NetworkImage(
                                  service.gallery.images[0].imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  onTap: () => {
                        _navigateAndDisplaySelection(context, service, newCart),
                      });
            },
          ),
        ],
      ),
    );
  }

  // List<Widget> generateWidgets(Map<ServiceModel, int> cart) {
  //   return ["Massage", "Nail", "Haircut"]
  //       .map<Widget>(
  //         (service) => Column(
  //           children: [
  //             Text(service),
  //             ListView.builder(
  //               shrinkWrap: true,
  //               physics: NeverScrollableScrollPhysics(),
  //               itemCount: lstService.length,
  //               itemBuilder: (BuildContext buildContext, int index) {
  //                 ServiceModel service = lstService[index];
  //                 return Stack(
  //                   children: <Widget>[
  //                     Container(
  //                       margin: EdgeInsets.fromLTRB(40.0, 0.0, 20.0, 5.0),
  //                       height: 170.0,
  //                       width: double.infinity,
  //                       decoration: BoxDecoration(
  //                         color: Colors.white54,
  //                         border: Border(
  //                             bottom: BorderSide(color: Colors.grey[300])),
  //                         // borderRadius: BorderRadius.circular(5.0),
  //                       ),
  //                       child: Padding(
  //                         padding: EdgeInsets.fromLTRB(110.0, 20.0, 20.0, 20.0),
  //                         child: Column(
  //                           mainAxisAlignment: MainAxisAlignment.center,
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           children: <Widget>[
  //                             Row(
  //                               mainAxisAlignment:
  //                                   MainAxisAlignment.spaceBetween,
  //                               crossAxisAlignment: CrossAxisAlignment.start,
  //                               children: <Widget>[
  //                                 GestureDetector(
  //                                   child: Container(
  //                                     width: 105.0,
  //                                     child: Text(
  //                                       service.name,
  //                                       style: TextStyle(
  //                                           fontSize: 15.0,
  //                                           fontWeight: FontWeight.w600),
  //                                     ),
  //                                   ),
  //                                   onTap: () => Navigator.push(
  //                                     context,
  //                                     MaterialPageRoute(
  //                                       builder: (context) =>
  //                                           ServiceDetailScreen(
  //                                         service: service,
  //                                         cart: cart,
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ),
  //                                 SizedBox(
  //                                   height: 65,
  //                                 ),
  //                                 Text(
  //                                   '${service.price}',
  //                                   style:
  //                                       TextStyle(fontWeight: FontWeight.w900),
  //                                 ),
  //                               ],
  //                             ),
  //                             Text(
  //                               service.note,
  //                               style: TextStyle(color: Colors.grey),
  //                             ),
  //                             SizedBox(
  //                               height: 10.0,
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                     ),
  //                     Positioned(
  //                       left: 20.0,
  //                       top: 25.0,
  //                       bottom: 30.0,
  //                       child: ClipRRect(
  //                         borderRadius: BorderRadius.circular(5.0),
  //                         child: Image(
  //                           width: 115.0,
  //                           image: AssetImage(service.imageUrl),
  //                           fit: BoxFit.cover,
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 );
  //               },
  //             ),
  //           ],
  //         ),
  //       )
  //       .toList();
  // }

  // Widget _buildFeedback(List<FeedbackModel> lstFeedback) {
  //   return ListView.builder(
  //       shrinkWrap: true,
  //       physics: BouncingScrollPhysics(),
  //       itemCount: lstFeedback.length,
  //       itemBuilder: (BuildContext context, int index) {
  //         FeedbackModel proFeedback = lstFeedback[index];
  //         List<String> lstImage = lstFeedback[index].imageUrl;
  //         return Stack(
  //           children: <Widget>[
  //             Positioned(
  //               top: 15.0,
  //               left: 20.0,
  //               child: ClipRRect(
  //                 borderRadius: BorderRadius.circular(60),
  //                 child: Image(
  //                   image: AssetImage(proFeedback.userImage),
  //                   width: 40.0,
  //                   height: 40.0,
  //                 ),
  //               ),
  //             ),
  //             Column(
  //               crossAxisAlignment: CrossAxisAlignment.stretch,
  //               children: <Widget>[
  //                 Container(
  //                   margin: EdgeInsets.fromLTRB(70.0, 15.0, 20.0, 0.0),
  //                   // height: 100,
  //                   // width: 00,
  //                   color: Color(0xFFC4C4C4).withOpacity(0.2),
  //                   child: Column(
  //                     children: <Widget>[
  //                       Row(
  //                         children: <Widget>[
  //                           Padding(
  //                             padding: EdgeInsets.all(8.0),
  //                             child: Text(
  //                               proFeedback.username,
  //                               style: TextStyle(
  //                                   fontWeight: FontWeight.bold,
  //                                   fontSize: 15.0),
  //                             ),
  //                           ),
  //                           Icon(
  //                             Icons.star,
  //                             color: Colors.yellow,
  //                             size: 22.0,
  //                           ),
  //                           Text(
  //                             proFeedback.rateScore.toString(),
  //                             style: TextStyle(
  //                                 fontWeight: FontWeight.w700, fontSize: 12.0),
  //                           ),
  //                         ],
  //                       ),
  //                       Padding(
  //                         padding: EdgeInsets.only(
  //                             left: 20.0, bottom: 10.0, right: 15.0),
  //                         child: Text(proFeedback.feedback),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //                 Container(
  //                   padding: EdgeInsets.only(left: 60.0),
  //                   height: 100.0,
  //                   child: ListView.builder(
  //                       shrinkWrap: true,
  //                       scrollDirection: Axis.horizontal,
  //                       itemCount: lstImage.length,
  //                       itemBuilder: (BuildContext context, int index) {
  //                         return Container(
  //                           margin: EdgeInsets.all(10.0),
  //                           child: Image(
  //                             image: AssetImage(lstImage[index]),
  //                             fit: BoxFit.cover,
  //                           ),
  //                         );
  //                       }),
  //                 ),
  //                 Padding(
  //                   padding: EdgeInsets.only(left: 70, bottom: 20.0),
  //                   child: Text(
  //                     'Đã đăng vào ngày ${proFeedback.commentedDate}',
  //                     style: TextStyle(fontSize: 12, color: Colors.grey),
  //                   ),
  //                 )
  //               ],
  //             ),
  //           ],
  //         );
  //       });
  // }

  // Widget _buildComponent(int index) {
  //   switch (index) {
  //     // case 0:
  //     //   return _buildPicture(index);
  //     //   break;
  //     case 1:
  //       return _buildService(lstService, newCart);
  //       break;
  //     // case 2:
  //     //   return _buildFeedback(lstProviderFeedback);
  //     //   break;
  //   }
  // }

  _navigateAndDisplaySelection(
    BuildContext context,
    service,
    Map<ServiceModel, int> newCart,
  ) async {
    var provider = context.read<ProviderDetailProvider>();
    provider.setCurrentService(service);
    var cartProvider = context.read<CartProvider>();
    cartProvider.setCurrentCart(CartModel(services: newCart));
    final cart = await Navigator.pushNamed(context, Routes.serviceDetail);
    this.newCart = cart;
    setState(() {
      _buildCategory(1);
    });
  }

  Widget setupAlertDialoadContainer(ServiceModel service) {
    return Container(
      height: 300.0, // Change as per your requirement
      width: 300.0, // Change as per your requirement
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: service.description.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(
              Icons.adjust,
              color: Color(0xFF3EBACE),
              size: 15.0,
            ),
            title: Transform(
                transform: Matrix4.translationValues(-26, 0, 0),
                child: Text(
                  service.description[index],
                  style: TextStyle(fontSize: 14.0),
                )),
            contentPadding: EdgeInsets.only(left: 5),
          );
        },
      ),
    );
  }
}
