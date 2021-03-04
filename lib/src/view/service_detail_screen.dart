import 'package:flutter/material.dart';
import 'package:flutter_app/src/models/provider_detail_model/service_model.dart';
import 'package:flutter_app/src/widgets/service_detail_widget.dart';
import 'package:intl/intl.dart';

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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 10.0),
        height: screenSize.height * 0.06,
        width: screenSize.width * 0.9,
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
            if (!newCart.containsKey(widget.service) && updatingQuantity > 0) {
              newCart[widget.service] = updatingQuantity;
            } else {
              if (newCart.containsKey(widget.service) && updatingQuantity == 0) {
                newCart.remove(widget.service);
              } else if (newCart.containsKey(widget.service) &&
                  newCart[widget.service] != updatingQuantity) {
                newCart.update(widget.service, (dynamic val) => updatingQuantity);
              }
            }

            Navigator.pop(context, newCart);
          },
          backgroundColor: Color(0xff28BEBA),
          label: Text(
            button(widget.service, newCart, updatingQuantity),
            style: TextStyle(color: Colors.white, letterSpacing: 3),
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ServiceDetailImage(
                path: widget.service.imageUrl,
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
                height: screenSize.height * 0.1,
                width: screenSize.width,
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
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
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
}
