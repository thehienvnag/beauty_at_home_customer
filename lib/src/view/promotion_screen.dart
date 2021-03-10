import 'package:flutter/material.dart';
import 'package:flutter_app/src/models/provider_detail_model/service_model.dart';
import 'package:flutter_app/src/view/service_detail_screen.dart';
import 'package:flutter_app/src/widgets/shared_widget/style.dart';

class PromotionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(170),
        child: AppBar(
          leading: IconButton(
              icon: Container(
                padding: EdgeInsets.only(left: 5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.arrow_back_ios),
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          elevation: 0,
          backgroundColor: Colors.transparent,
          flexibleSpace: Image(
            image: NetworkImage(
                "https://img.lookme.vn/unsafe/397x0/https://minio.lookme.vn/packageservice/packageservice-sun-nails-cat-da-son-gel/sun-nails-cat-da-son-gel-lookme.vn-21030471207.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 10),
        width: screenSize.width * 0.95,
        child: FloatingActionButton.extended(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ServiceDetailScreen(
                service: srv,
                cart: Map(),
              ),
              settings: RouteSettings(arguments: "From-Promotion"),
            ));
          },
          backgroundColor: Color(0xff28BEBA),
          label: Text(
            'ÁP DỤNG NGAY',
            style: TextStyle(color: Colors.white, letterSpacing: 4),
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.only(left: 5, top: 15, bottom: 15),
                      child: Text(
                        'Sun Nails deal nail 89k',
                        style: CustomTextStyle.titleText(Colors.black),
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.ac_unit_outlined,
                          color: Colors.grey,
                        ),
                        Container(
                          child: Text(
                            '  Cắt da + sơn gel',
                            style: CustomTextStyle.subtitleText(Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.assignment_turned_in_outlined,
                          color: Colors.grey,
                        ),
                        Container(
                          child: Text(
                            '  Ưu đãi từ 04/03/2021 đến 04/04/2021',
                            style: CustomTextStyle.subtitleText(Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.wallet_giftcard_sharp,
                          color: Colors.orange,
                        ),
                        Container(
                          child: Text(
                            '  89.000 đ',
                            style: CustomTextStyle.subtitleText(Colors.orange),
                          ),
                        ),
                        Container(
                          child: Text(
                            '  145.000 đ',
                            style: CustomTextStyle.subtitleLineThroughText(
                              Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.only(left: 5, top: 10, bottom: 10),
                      child: Text(
                        'ĐIỀU KHOẢN SỬ DỤNG',
                        style: CustomTextStyle.titleText(
                          Color(0xff28BEBA),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    //margin: EdgeInsets.only(top: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          child: Icon(
                            Icons.brightness_high_outlined,
                            color: Colors.pink.shade200,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            'Voucher phải được sử dụng trước thời hạn',
                            style: CustomTextStyle.subtitleText(Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          child: Icon(
                            Icons.brightness_high_outlined,
                            color: Colors.pink.shade200,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            'Đặt lịch sớm để nhận được sự chăm sóc chu đáo nhất của thợ',
                            style: CustomTextStyle.subtitleText(Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> lstNailImages = List.from([
  'public/img/nail_1.jpg',
  'public/img/nail_2.jpg',
  'public/img/nail_3.png',
  'public/img/nail_4.png',
  'public/img/nail_5.png',
  'public/img/nail_6.png',
  'public/img/nail_7.png',
  'public/img/nail_8.jpg',
]);

final srv = Service(
  name: 'Làm sạch và sơn gel',
  description: [
    'Bước 1: làm sạch tay bằng Cool Blue',
    'Bước 2: dũa móng theo khuôn khách yêu cầu',
    'Bước 3: làm mềm da trên mặt móng với gel biểu bì',
    'Bước 4: dùng cây đẩy da đẩy nhẹ trên mặt móng và lau sạch bằng bông',
    'Bước 5: làm sạch dung dịch gel sót trên da và dùng kiềm nhặt da sót lại',
    'Bước 6: làm sạch mặt móng với dung dịch làm khô chuyên biệt',
    'Bước 7: sơn gel',
    'Bước 8: thao dưỡng khóe móng và móng bằng culticle eraser và solar oil'
  ],
  price: '200',
  estimateTime: 30,
  status: "Đang hoạt động",
  serviceImages: lstNailImages,
  category: "Nails",
  imageUrl: 'public/img/nail_2.jpg',
  isServiceCombo: false,
  note: 'Bao gồm mỹ phẩm làm đẹp và dụng cụ',
);
