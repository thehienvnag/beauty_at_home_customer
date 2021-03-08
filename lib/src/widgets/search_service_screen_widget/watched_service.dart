import 'package:flutter/material.dart';
import 'package:flutter_app/src/models/provider_detail_model/service_model.dart';
import 'package:flutter_app/src/view/promotion_screen.dart';
import 'package:flutter_app/src/view/service_detail_screen.dart';
import 'package:flutter_app/src/widgets/shared_widget/style.dart';

class ViewsPromotion extends StatelessWidget {
  const ViewsPromotion({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          PromotionService(
            image:
                "https://img.lookme.vn/unsafe/397x0/https://minio.lookme.vn/packageservice/packageservice-sun-nails-cat-da-son-gel/sun-nails-cat-da-son-gel-lookme.vn-21030471207.jpeg",
            title: "Sun Nails deal nail 89k",
            description: 'Sun Nails',
            priceAfter: '89.000 đ',
            priceBefore: '145.000 đ',
          ),
          PromotionService(
            image:
                "https://img.lookme.vn/unsafe/397x0/https://minio.lookme.vn/packageservice/packageservice-an-herbal-salon-goi-thao-moc-chuyen-sau/an-herbal-salon-goi-thao-moc-chuyen-sau-lookme.vn-21030282052.jpeg",
            title: "Gội thảo mộc 169k",
            description: 'AN Herbal Salon',
            priceAfter: '169.000 đ',
            priceBefore: '250.000 đ',
          ),
          PromotionService(
            image:
                "https://img.lookme.vn/unsafe/397x0/https://minio.lookme.vn/packageservice/packageservice-an-herbal-salon-combo-son-gel-lam-mong-kho-cnd/an-herbal-salon-combo-son-gel-lam-mong-kho-cnd-lookme.vn-21030282019.jpeg",
            title: "Sơn + làm sạch CND 179k",
            description: 'AN Herbal Salon',
            priceAfter: '179.000 đ',
            priceBefore: '270.000 đ',
            //press: ,
          ),
          PromotionService(
            image:
                "https://img.lookme.vn/unsafe/397x0/https://minio.lookme.vn/packageservice/packageservice-may-may-spa-massage-body/may-may-spa-massage-body-lookme.vn-21030181357.jpeg",
            title: "Massage body 199k",
            description: 'Mây Mây Spa',
            priceAfter: '199.000 đ',
            priceBefore: '280.000 đ',
          ),
        ],
      ),
    );
  }
}

class ViewsServices extends StatelessWidget {
  const ViewsServices({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          RecomendService(
            image:
                "https://i.pinimg.com/originals/79/61/22/7961221b8062889c1969187e3ee80590.jpg",
            title: "Nail đơn giản cá tính",
            description: 'Nail Minh Châu',
            rateScore: '4.8',
            noOfRate: '246',
          ),
          RecomendService(
            image:
                "https://i.pinimg.com/originals/96/9e/22/969e22a9ffc82d8d6915044f504e8604.png",
            title: "Tóc xoăn tự nhiên",
            description: 'LENS HAIR SALON',
            rateScore: '4.8',
            noOfRate: '153',
          ),
          RecomendService(
            image:
                "https://mathoadaphan.com/wp-content/uploads/2021/02/c%C3%A1c-b%C6%B0%E1%BB%9Bc-trang-%C4%91i%E1%BB%83m-c%C6%A1-b%E1%BA%A3n.jpg",
            title: "Trang điểm tự nhiên",
            description: 'Đại Hàn Makeup Artist',
            rateScore: '4.8',
            noOfRate: '114',
            //press: ,
          ),
          RecomendService(
            image:
                "https://cuahanglamdep.com/images/detailed/3/noi-mi-3d-tai-meli-spa-1.jpg",
            title: "Nối mi",
            description: 'Nối mi Mít',
            rateScore: '4.8',
            noOfRate: '95',
          ),
        ],
      ),
    );
  }
}

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
  category: "Nails",
  imageUrl: 'public/img/nail_2.jpg',
  isServiceCombo: false,
  note: 'Bao gồm mỹ phẩm làm đẹp và dụng cụ',
);

class RecomendService extends StatelessWidget {
  const RecomendService({
    Key key,
    this.image,
    this.title,
    this.description,
    this.press,
    this.rateScore,
    this.noOfRate,
  }) : super(key: key);

  final String image, title, description, rateScore, noOfRate;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ServiceDetailScreen(
            service: srv,
          ),
        ));
      },
      child: Container(
        margin: EdgeInsets.only(left: 6, top: 10, bottom: 15, right: 6),
        width: 190,
        child: Column(
          children: <Widget>[
            Image.network(
              image,
              height: 130,
              width: 190,
              fit: BoxFit.cover,
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Colors.grey.withOpacity(0.1),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "$title\n".toUpperCase(),
                          style: CustomTextStyle.subtitleText(Colors.black),
                        ),
                        TextSpan(
                          text: "$description\n",
                          style: CustomTextStyle.subtitleText(
                            Colors.black.withOpacity(0.5),
                          ),
                        ),
                        WidgetSpan(
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Color(0xffFFCC00),
                              ),
                              Text(
                                "$rateScore",
                                style: CustomTextStyle.subtitleText(
                                  Colors.black.withOpacity(0.5),
                                ),
                              ),
                              Text(
                                "  ($noOfRate - đánh giá)",
                                style: CustomTextStyle.subtitleText(
                                  Colors.black.withOpacity(0.5),
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
            )
          ],
        ),
      ),
    );
  }
}

class PromotionService extends StatelessWidget {
  const PromotionService({
    Key key,
    this.image,
    this.title,
    this.description,
    this.priceAfter,
    this.priceBefore,
    this.press,
  }) : super(key: key);

  final String image, title, description, priceAfter, priceBefore;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PromotionScreen(),
        ));
      },
      child: Container(
        margin: EdgeInsets.only(left: 6, top: 10, bottom: 15, right: 6),
        width: 190,
        child: Column(
          children: <Widget>[
            Image.network(
              image,
              height: 130,
              width: 190,
              fit: BoxFit.cover,
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Colors.grey.withOpacity(0.1),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "$title\n".toUpperCase(),
                          style: CustomTextStyle.subtitleText(Colors.black),
                        ),
                        TextSpan(
                          text: "$description\n",
                          style: CustomTextStyle.subtitleText(
                            Colors.black.withOpacity(0.5),
                          ),
                        ),
                        TextSpan(
                          text: "$priceAfter\n",
                          style: CustomTextStyle.subtitleText(
                            Colors.orange.withOpacity(0.5),
                          ),
                        ),
                        TextSpan(
                          text: "$priceBefore",
                          style: CustomTextStyle.subtitleLineThroughText(
                            Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
