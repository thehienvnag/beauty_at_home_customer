import 'package:flutter/material.dart';
import 'package:flutter_app/src/models-new/provider_detail_model.dart';
import 'package:flutter_app/src/models-new/service_model.dart';
import 'package:flutter_app/src/providers/provider_detail_provider.dart';
import 'package:flutter_app/src/utils/routes_name.dart';
import 'package:flutter_app/src/view/ProviderDetail/provider_detail_screen.dart';
import 'package:flutter_app/src/view/ServiceDetailScreen/service_detail_screen.dart';
import 'package:flutter_app/src/widgets/shared_widget/fullwidth_card.dart';
import 'package:flutter_app/src/widgets/shared_widget/style.dart';
import 'package:provider/provider.dart';
import '../search_screen_widget.dart';

class Staff {
  final String image;
  final String salonOwner;
  final String titleService;
  final List<ServiceItem> listService;
  final double rate;
  final String area;
  String range;
  String status;

  Staff(
      {this.image,
      this.listService,
      this.salonOwner,
      this.titleService,
      this.rate,
      this.area,
      this.range});
}

class ListSearchServices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Consumer<ProviderDetailProvider>(
        builder: (context, value, child) {
          var listProvider = value.listProvidersSearch;
          return listProvider == null
              ? Scaffold(
                  body: Align(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  ),
                )
              : ListView.separated(
                  separatorBuilder: (context, index) => Container(
                    color: Colors.grey.withOpacity(0.25),
                    height: 8,
                  ),
                  itemCount: listProvider.length,
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var provider = listProvider[index];
                    return FullWidthCard(
                      hasDivider: false,
                      hasBorder: false,
                      sections: [
                        _buildStaff(provider, context),
                        ..._buildServices(provider?.services, size, context),
                      ],
                    );
                  },
                );
        },
      ),
    );
  }

  Widget _buildStaff(ProviderModel staff, BuildContext context) {
    String imageUrl = staff?.gallery?.images[0]?.imageUrl;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProviderDetailScreen(
            id: staff.id.toString(),
          ),
        ));
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 230,
            margin: const EdgeInsets.only(left: 15, top: 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      staff.displayName,
                      style: CustomTextStyle.titleText(Colors.black),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 2),
                      child: Row(
                        children: [
                          if (staff.rateScore != null && staff.rateScore > 0)
                            Row(
                              children: [
                                Text(
                                  staff.rateScore.toString(),
                                  style: CustomTextStyle.subtitleText(
                                      Colors.black87),
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                              ],
                            )
                          else
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 3),
                              child: Text(
                                "Thợ mới",
                                style: CustomTextStyle.subtitleText(
                                  Colors.white,
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.blue[200],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3)),
                              ),
                            )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30, top: 10, bottom: 10),
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: imageUrl == null
                    ? AssetImage("public/img/avatar.jpg")
                    : NetworkImage(staff?.gallery?.images?.first?.imageUrl),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildServices(
      List<ServiceModel> lstServices, Size size, BuildContext context) {
    return lstServices == null
        ? [SizedBox()]
        : lstServices
            .map<Widget>(
              (item) => Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 25),
                      ),
                      Container(
                        width: 250,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  item.serviceName,
                                  style: CustomTextStyle.subtitleText(
                                      Colors.black87),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black54,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    width: 18,
                                    height: 14,
                                    child: Icon(
                                      Icons.attach_money_sharp,
                                      color: Colors.black54,
                                      size: 12,
                                    ),
                                  ),
                                  Text(
                                    ' ${item.price}đ',
                                    style: CustomTextStyle.subtitleText(
                                        Colors.black54),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      item.gallery?.images?.first?.imageUrl == null
                          ? CircularProgressIndicator()
                          : Container(
                              margin: EdgeInsets.only(top: 5, left: 20),
                              width: 50,
                              height: 50,
                              child: Image(
                                image: NetworkImage(
                                  item.gallery?.images?.first?.imageUrl,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            )
            .toList();
  }
}
