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
            description: 'Thu Mai',
            priceAfter: '89.000 đ',
            priceBefore: '145.000 đ',
          ),
          PromotionService(
            image:
                "https://www.lookme.vn/blog/wp-content/uploads/2019/11/goi-dau-thao-duoc-spa-2.jpg",
            title: "Gội thảo mộc 169k",
            description: 'Hà Anh',
            priceAfter: '169.000 đ',
            priceBefore: '250.000 đ',
          ),
          PromotionService(
            image:
                "https://i.pinimg.com/236x/be/a1/8a/bea18a7bbd6d192be2691fee72d2fc6f.jpg",
            title: "Sơn + làm sạch CND 179k",
            description: 'Ly Ly Nguyễn',
            priceAfter: '179.000 đ',
            priceBefore: '270.000 đ',
            //press: ,
          ),
          PromotionService(
            image:
                "https://image.thanhnien.vn/660/uploaded/dieutrang.qc/2017_11_17/mh2/1_tsbz.jpg",
            title: "Massage body 199k",
            description: 'Thu Thảo',
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
            description: 'Marry Trần',
            rateScore: '4.8',
            noOfRate: '153',
          ),
          RecomendService(
            image:
                "https://mathoadaphan.com/wp-content/uploads/2021/02/c%C3%A1c-b%C6%B0%E1%BB%9Bc-trang-%C4%91i%E1%BB%83m-c%C6%A1-b%E1%BA%A3n.jpg",
            title: "Trang điểm tự nhiên",
            description: 'Hà Nguyễn',
            rateScore: '4.8',
            noOfRate: '114',
            //press: ,
          ),
          RecomendService(
            image:
                "https://cuahanglamdep.com/images/detailed/3/noi-mi-3d-tai-meli-spa-1.jpg",
            title: "Nối mi",
            description: 'Mai Anh',
            rateScore: '4.8',
            noOfRate: '95',
          ),
        ],
      ),
    );
  }
}

List<String> lstMassageImage = List.from([
  'public/img/massage_1.png',
  'public/img/massage_2.jpg',
  'public/img/massage_3.jpg',
  'public/img/massage_4.jpg',
  'public/img/massage_5.jpg',
  'public/img/massage_6.jpg',
  'public/img/massage_7.png',
  'public/img/massage_8.jpg',
]);
final srv = Service(
  name: '90 phút Massage body toàn thân',
  description: [
    'Bước 1: làm sạch tay bằng Cool Blue',
    'Bước 2: dũa móng theo khuôn khách yêu cầu',
    'Bước 3: làm mềm da trên mặt móng với gel biểu bì',
    'Bước 4: dùng cây đẩy da đẩy nhẹ trên mặt móng và lau sạch bằng bông',
  ],
  price: '500',
  estimateTime: 30,
  status: "Đang hoạt động",
  // category: lstType[0],
  imageUrl: 'public/img/massage_3.jpg',
  serviceImages: lstMassageImage,
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
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => ServiceDetailScreen(
                    service: srv,
                    cart: Map(),
                  ),
              settings: RouteSettings(arguments: "From-Popular-Service")),
        );
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
