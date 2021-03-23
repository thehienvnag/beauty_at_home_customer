import 'package:flutter/material.dart';
import 'package:flutter_app/src/models-new/voucher_model.dart';
import 'package:flutter_app/src/models-new/service_model.dart';
import 'package:flutter_app/src/providers/service_provider.dart';
import 'package:flutter_app/src/providers/voucher_provider.dart';
import 'package:flutter_app/src/utils/routes_name.dart';
import 'package:flutter_app/src/utils/utils.dart';
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
    return Container(
      height: 228,
      child: Align(
        alignment: Alignment.topLeft,
        child: Consumer<ServiceProvider>(builder: (context, value, child) {
          if (value.listServiceHome == null) {
            return Text("Loading");
          }
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: value.listServiceHome.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var item = value.listServiceHome[index];
                return RecomendService(
                  image: item.gallery.images.first.imageUrl,
                  title: Utils.shortenString(item.serviceName, 20),
                  description: item.account.displayName,
                  rateScore: item.rateScore.toString(),
                  noOfRate: item.totalFeedback.toInt().toString(),
                  id: item.id?.toString(),
                );
              });
        }),
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
    // name: '90 phút Massage body toàn thân',
    // description: [
    //   'Bước 1: làm sạch tay bằng Cool Blue',
    //   'Bước 2: dũa móng theo khuôn khách yêu cầu',
    //   'Bước 3: làm mềm da trên mặt móng với gel biểu bì',
    //   'Bước 4: dùng cây đẩy da đẩy nhẹ trên mặt móng và lau sạch bằng bông',
    // ],
    // price: '500',
    // estimateTime: 30,
    // status: "Đang hoạt động",
    // // category: lstType[0],
    // imageUrl: 'public/img/massage_3.jpg',
    // serviceImages: lstMassageImage,
    // isServiceCombo: false,
    // summary: 'Bao gồm mỹ phẩm làm đẹp và dụng cụ',
    );

class RecomendService extends StatelessWidget {
  const RecomendService({
    Key key,
    this.id,
    this.image,
    this.title,
    this.description,
    this.press,
    this.rateScore,
    this.noOfRate,
  }) : super(key: key);

  final String image, title, description, rateScore, noOfRate, id;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ServiceDetailScreen(
            id: id,
          ),
          settings: RouteSettings(arguments: "From-Popular-Service"),
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
                        if (noOfRate != "0")
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
                          )
                        else
                          WidgetSpan(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 3),
                              child: Text(
                                "Dịch vụ mới",
                                style: CustomTextStyle.subtitleText(
                                  Colors.white,
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.blue[200],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3)),
                              ),
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
