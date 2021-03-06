import 'package:flutter/material.dart';
import 'package:flutter_app/src/widgets/shared_widget/style.dart';

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
                "https://images.unsplash.com/photo-1560869713-7d0a29430803?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=281&q=80",
            title: "Combo chăm sóc tóc",
            description: 'Hair Salon Á Châu',
          ),
          RecomendService(
            image:
                "https://images.squarespace-cdn.com/content/v1/5c83050d65a70789cd24dfd6/1553089989287-34HV4WUFAP1XVZXXFXK2/ke17ZwdGBToddI8pDm48kHjjRFoa4e1VGucJmNyFVoh7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QHyNOqBUUEtDDsRWrJLTm1v6GcKqh6mrhfxzW2tqo74s8fbTrWVvfM-kkSObv32fsnvTszPo_vJiFcjaaeRFs/dip.jpg",
            title: "Combo cắt vs sơn gel",
            description: 'Lily\'s Nails',
          ),
          RecomendService(
            image:
                "https://images.unsplash.com/photo-1599948128020-9a44505b0d1b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80",
            title: "Trang điểm dự tiệc",
            description: 'Alecsander VanLeAn',
            //press: ,
          ),
          RecomendService(
            image:
                "https://images.unsplash.com/photo-1571290274554-6a2eaa771e5f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80",
            title: "Combo chăm sóc móng",
            description: 'Mít\'s Nails & Spa',
          ),
        ],
      ),
    );
  }
}

class RecomendService extends StatelessWidget {
  const RecomendService({
    Key key,
    this.image,
    this.title,
    this.description,
    this.press,
  }) : super(key: key);

  final String image, title, description;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          GestureDetector(
            onTap: press,
            child: Container(
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
                          text: "$description",
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
          )
        ],
      ),
    );
  }
}
