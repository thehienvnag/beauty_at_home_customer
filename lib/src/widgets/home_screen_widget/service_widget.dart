import 'package:flutter/material.dart';
import 'package:flutter_app/src/view/ListSearchScreen/list_search_screen.dart';
import 'package:flutter_app/src/widgets/shared_widget/style.dart';

class Category {
  String name;
  String image;
  Category({
    this.name,
    this.image,
  });
}

final listCategories = List.from([
  Category(image: 'public/img/service_skin.png', name: 'Chăm sóc da'),
  Category(image: 'public/img/service_makeup.png', name: 'Trang điểm'),
  Category(image: 'public/img/service_spa_massage.png', name: 'Massage'),
  Category(image: 'public/img/service_nails.png', name: 'Nails'),
  Category(image: 'public/img/service_hair_cut.png', name: 'Cắt tóc'),
  Category(image: 'public/img/service_hair_color.png', name: 'Chăm sóc tóc'),
  Category(image: 'public/img/service_water_hair.png', name: 'Gội đầu'),
]);

class ServiceWidget extends StatelessWidget {
  final String image;
  final Function press;
  const ServiceWidget({
    Key key,
    this.image,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 2),
          margin: EdgeInsets.only(
            bottom: 8,
          ),
          child: Text(
            'DANH MỤC DỊCH VỤ',
            style: CustomTextStyle.headline600Text(
              Colors.black,
            ),
          ),
        ),
        Container(
          height: 90,
          width: size.width * 0.95,
          padding: EdgeInsets.only(left: 15),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: listCategories.length,
            separatorBuilder: (context, index) => SizedBox(width: 30),
            itemBuilder: (context, index) {
              Category category = listCategories[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ListSearchScreen(),
                      settings: RouteSettings(arguments: category.name),
                    ),
                  );
                },
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      margin: EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(category.image),
                        ),
                      ),
                    ),
                    Text(
                      category.name,
                      style: CustomTextStyle.subtitleText(Colors.black87),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
