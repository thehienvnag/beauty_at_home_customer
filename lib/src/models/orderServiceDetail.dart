import 'cart_item.dart';

class ServiceCusDetail {
  String cusName;
  String cusID;
  String address;
  String status;
  String note;
  String time;
  String timeMove;
  String totalBill;
  String payment;
  List<CartItem> listItem;

  ServiceCusDetail({
    this.cusName,
    this.cusID,
    this.address,
    this.status,
    this.note,
    this.time,
    this.timeMove,
    this.totalBill,
    this.payment,
    this.listItem,
  });
}