import 'package:flutter/material.dart';

class Category {
  String name;
  String image;
  Category({
    this.name,
    this.image,
  });
}

final listCategories = List.from([
  Category(image: 'public/img/service_hair_cut.png', name: 'Cắt tóc'),
  Category(image: 'public/img/service_hair_color.png', name: 'Nhuộm tóc'),
  Category(image: 'public/img/service_water_hair.png', name: 'Gội đầu'),
  Category(image: 'public/img/service_spa_massage.png', name: 'Massage'),
  Category(image: 'public/img/service_skin.png', name: 'Chăm sóc da'),
  Category(image: 'public/img/service_waxing.png', name: 'Waxing'),
  Category(image: 'public/img/service_makeup.png', name: 'Trang điểm'),
  Category(image: 'public/img/service_nails.png', name: 'Nails'),
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
    return Container(
      height: 100,
      width: size.width * 0.95,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: listCategories.length,
        separatorBuilder: (context, index) => SizedBox(width: 20),
        itemBuilder: (context, index) {
          Category category = listCategories[index];
          return Column(
            children: [
              Container(
                height: 70,
                width: 57,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(category.image),
                  ),
                ),
              ),
              Text(category.name),
            ],
          );
        },
      ),
    );
  }
}
