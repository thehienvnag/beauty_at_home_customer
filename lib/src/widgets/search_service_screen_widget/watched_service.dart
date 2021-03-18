import 'package:flutter/material.dart';
import 'package:flutter_app/src/models-new/voucher_model.dart';
import 'package:flutter_app/src/models-new/service_model.dart';
import 'package:flutter_app/src/providers/voucher_provider.dart';
import 'package:flutter_app/src/utils/routes_name.dart';
import 'package:flutter_app/src/view/Promotion/promotion_screen.dart';
import 'package:flutter_app/src/view/ServiceDetailScreen/service_detail_screen.dart';
import 'package:flutter_app/src/widgets/shared_widget/style.dart';
import 'package:provider/provider.dart';

class ViewsPromotion extends StatefulWidget {
  const ViewsPromotion({
    Key key,
  }) : super(key: key);

  @override
  _ViewsPromotionState createState() => _ViewsPromotionState();
}

class _ViewsPromotionState extends State<ViewsPromotion> {
  @override
  void initState() {
    super.initState();
    var voucherProvider = context.read<VoucherProvider>();
    voucherProvider.initData();
  }

  @override
  Widget build(BuildContext context) {
    var listVoucher = context.select<VoucherProvider, List<VoucherModel>>(
      (value) => value.listVoucher,
    );
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: listVoucher != null
            ? listVoucher
                .map(
                  (item) => PromotionService(
                    model: item,
                  ),
                )
                .toList()
            : [],
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
            description: 'Marry Trần',
            rateScore: '4.8',
            noOfRate: '246',
          ),
          RecomendService(
            image:
                "https://i.pinimg.com/originals/96/9e/22/969e22a9ffc82d8d6915044f504e8604.png",
            title: "Tóc xoăn tự nhiên",
            description: 'Hani Nguyễn',
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
final srv = ServiceModel(
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
  summary: 'Bao gồm mỹ phẩm làm đẹp và dụng cụ',
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
        Navigator.of(context).pushNamed(Routes.serviceDetail);
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
                        WidgetSpan(
                          child: Container(
                              margin: EdgeInsets.only(right: 5.0),
                              child: Icon(
                                Icons.account_circle,
                                color: Colors.black38,
                                size: 18,
                              )),
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
                                size: 20.0,
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
    this.model,
  }) : super(key: key);

  final VoucherModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        var voucherProvider = context.read<VoucherProvider>();
        voucherProvider.setCurrentVoucher(model);
        Navigator.of(context).pushNamed(Routes.promotionDetail);
      },
      child: Container(
        margin: EdgeInsets.only(left: 6, top: 10, bottom: 15, right: 6),
        width: 190,
        child: Column(
          children: <Widget>[
            Image.network(
              model.image,
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
                          text: "${model.title}\n".toUpperCase(),
                          style: CustomTextStyle.subtitleText(Colors.black),
                        ),
                        WidgetSpan(
                          child: Container(
                              margin: EdgeInsets.only(right: 3.0),
                              child: Icon(
                                Icons.account_circle,
                                color: Colors.black38,
                                size: 18,
                              )),
                        ),
                        TextSpan(
                          text: "${model.description}\n",
                          style: CustomTextStyle.subtitleText(
                            Colors.black.withOpacity(0.5),
                          ),
                        ),
                        TextSpan(
                          text: "${model.priceAfter}\n",
                          style: CustomTextStyle.subtitleText(
                            Colors.orange.withOpacity(0.5),
                          ),
                        ),
                        TextSpan(
                          text: "${model.priceBefore}",
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
