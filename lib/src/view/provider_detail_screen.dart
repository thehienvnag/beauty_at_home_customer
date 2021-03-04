import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/models/provider_detail_model/provider_feedback_model.dart';
import 'package:flutter_app/src/models/provider_detail_model/provider_model.dart';
import 'package:flutter_app/src/models/provider_detail_model/service_model.dart';
import 'package:flutter_app/src/view/checkout_screen.dart';
import 'package:flutter_app/src/view/service_detail_screen.dart';
import 'package:flutter_app/src/widgets/provider_detail_screen_widget.dart';
import 'package:intl/intl.dart';

List<String> lstImage = List.from([
  'public/img/nail_1.jpg',
  'public/img/nail_2.jpg',
  'public/img/nail_2.jpg',
  'public/img/nail_2.jpg',
  'public/img/nail_2.jpg',
  'public/img/nail_2.jpg',
  'public/img/nail_2.jpg',
  'public/img/nail_2.jpg',
  'public/img/nail_2.jpg',
]);

List<String> _categories = [
  'Hình ảnh',
  'Dịch vụ',
  'Đánh giá',
];

List<String> lstType = ['Massage', 'Làm Móng'];

List<ProviderFeedback> lstProviderFeedback = List.from([
  ProviderFeedback(
      username: 'Hiển Huỳnh',
      rateScore: 4.5,
      imageUrl: [
        'public/img/nail_1.jpg',
        'public/img/nail_2.jpg',
        'public/img/nail_1.jpg',
        'public/img/nail_2.jpg',
        'public/img/nail_1.jpg',
        'public/img/nail_2.jpg',
        'public/img/nail_3.png',
      ],
      feedback:
          'Dịch vụ chuyên nghiệp, nhân viên có tay nghề, sẽ quay lại trong tương lai',
      userImage: 'public/img/user_image.jpg',
      commentedDate: '29-01-2021'),
  ProviderFeedback(
      username: 'Trang Cao',
      rateScore: 4.0,
      imageUrl: [
        'public/img/nail_1.jpg',
        'public/img/nail_2.jpg',
      ],
      feedback:
          'Trời mưa nóng mà bước vô Mít cái mát rượi luôn, vừa làm nail vừa uống '
          'trà sữa đã gì đâu. Bạn nhân viên vui tính, làm rất nhiệt tình và '
          'luôn hỏi ý mình khi chọn màu sơn. Sơn ra khác hợp với tay, màu '
          'sơn đều đẹp, nói chung là ưng ý.',
      userImage: 'public/img/user_image_3.jpg',
      commentedDate: '31-01-2021'),
]);
Provider provider = Provider(
    name: 'Mít Nails & Spa',
    description: 'Chăm sóc tóc và móng',
    address: '27 đường số 3, Phường Bình An, Quận 2, Thành phố Hồ Chí Minh',
    status: 'Đang hoạt động',
    rate: 4.8,
    reviews: '1,440',
    lowerPrice: '50.000đ',
    upperPrice: '500.000đ',
    openTime: '9:00 AM',
    closeTime: '8:30 PM',
    imageUrl: 'public/img/mit_nails_spa.png');

List<Service> lstService = List.from([
  Service(
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
    category: lstType[0],
    imageUrl: 'public/img/nail_1.jpg',
    isServiceCombo: false,
    note: 'Bao gồm mỹ phẩm làm đẹp và dụng cụ',
  ),
  Service(
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
    category: lstType[0],
    imageUrl: 'public/img/nail_1.jpg',
    isServiceCombo: false,
    note: 'Bao gồm mỹ phẩm làm đẹp và dụng cụ',
  ),
  Service(
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
    category: lstType[0],
    imageUrl: 'public/img/nail_1.jpg',
    isServiceCombo: false,
    note: 'Bao gồm mỹ phẩm làm đẹp và dụng cụ',
  ),
  Service(
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
    category: lstType[1],
    imageUrl: 'public/img/nail_2.jpg',
    isServiceCombo: false,
    note: 'Bao gồm mỹ phẩm làm đẹp và dụng cụ',
  ),
]);

class ProviderDetailScreen extends StatefulWidget {
  // final Map<Service, int> cart;

  // const ProviderDetailScreen({Key key, this.cart}) : super(key: key);
  //
  @override
  _ProviderDetailScreenState createState() => _ProviderDetailScreenState();
}

class _ProviderDetailScreenState extends State<ProviderDetailScreen> {
  int _selectedIndex = 0;
  Map<Service, int> newCart;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          ProviderImage(
            path: provider.imageUrl,
          ),
          ProviderDescription(
            provider: provider,
          ),
          Container(
            height: 50.0,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 5.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.grey[300], offset: Offset(0.0, 5.0)),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildCategory(0),
                _buildCategory(1),
                _buildCategory(2),
              ],
            ),
          ),
          _buildComponent(_selectedIndex),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: buildFloatingButton(newCart),
      floatingActionButton: buildFloatingButton(newCart),
    );
  }

  Widget buildFloatingButton(Map<Service, int> cart) {
    if (cart != null) {
      if (cart.isNotEmpty) {
        final screenSize = MediaQuery.of(context).size;
        return Container(
          margin: const EdgeInsets.only(bottom: 5),
          width: screenSize.width * 0.95,
          child: FloatingActionButton.extended(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CheckoutScreen(),
              ));
            },
            backgroundColor: Color(0xff28BEBA),
            label: Container(
              width: 320.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Xem giỏ hàng',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    newCart == null || newCart.isEmpty
                        ? ''
                        : '${newCart.length} dịch vụ',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    newCart == null || newCart.isEmpty
                        ? ''
                        : '${calculatePrice(newCart)}đ',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    }
    return null;
  }

  String calculatePrice(Map<Service, int> cart) {
    int total = 0;
    cart.forEach((key, value) {
      total += int.parse(key.price) * value;
    });
    return formatPrice(total.toString());
  }

  String formatPrice(String price) {
    String result = price.toString() + '000';
    var formatter = NumberFormat('###,000');
    String formatString = formatter.format(int.parse(result));
    return formatString.replaceAll(new RegExp(r','), '.');
  }

  Widget _buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: AnimatedContainer(
        height: MediaQuery.of(context).size.height,
        width: 120.0,
        duration: Duration(milliseconds: 100),
        curve: Curves.easeIn,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: _selectedIndex == index
              ? Border(
                  top: BorderSide(width: 3.0, color: Colors.cyan[400]),
                )
              : null,
        ),
        child: Text(
          _categories[index],
          style: TextStyle(
              color: _selectedIndex == index ? Color(0xFF3EBACE) : null,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget _buildImage(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        width: 100,
        child: Image(
          image: AssetImage(provider.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildPicture(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 20.0,),
        Container(
          width: 300,
          child: GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            children: List.generate(lstImage.length, (index) {
              return Center(
                child: Container(
                  // margin: EdgeInsets.only(left: ),
                  width: 100,
                  height: 100,
                  child: Image(
                    image: AssetImage(lstImage[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }),
          ),
        ),
        SizedBox(height: 20.0,)
      ],
    );
  }

  Widget _buildService(List<Service> lstService, Map<Service, int> cart) {
    return Column(
      children: <Widget>[
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: lstService.length,
          itemBuilder: (BuildContext buildContext, int index) {
            Service service = lstService[index];
            return Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(40.0, 0.0, 20.0, 5.0),
                  height: 170.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white54,
                    border: Border(bottom: BorderSide(color: Colors.grey[300])),
                    // borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(110.0, 20.0, 20.0, 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            GestureDetector(
                              child: Container(
                                width: 105.0,
                                child: Text(
                                  service.name,
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              onTap: () =>
                                  //     Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) =>
                                  //         ServiceDetailScreen(
                                  //           service: service,
                                  //           cart: cart,
                                  //         ),
                                  //   ),
                                  // ),
                                  _navigateAndDisplaySelection(
                                      context, service, newCart),
                            ),
                            SizedBox(
                              height: 65,
                            ),
                            Text(
                              '${formatPrice(service.price)}',
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                        Text(
                          service.note,
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 20.0,
                  top: 25.0,
                  bottom: 30.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image(
                      width: 115.0,
                      image: AssetImage(service.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  List<Widget> generateWidgets(Map<Service, int> cart) {
    return ["Massage", "Nail", "Haircut"]
        .map<Widget>(
          (service) => Column(
            children: [
              Text(service),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: lstService.length,
                itemBuilder: (BuildContext buildContext, int index) {
                  Service service = lstService[index];
                  return Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(40.0, 0.0, 20.0, 5.0),
                        height: 170.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white54,
                          border: Border(
                              bottom: BorderSide(color: Colors.grey[300])),
                          // borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(110.0, 20.0, 20.0, 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  GestureDetector(
                                    child: Container(
                                      width: 105.0,
                                      child: Text(
                                        service.name,
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ServiceDetailScreen(
                                          service: service,
                                          cart: cart,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 65,
                                  ),
                                  Text(
                                    '${service.price}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900),
                                  ),
                                ],
                              ),
                              Text(
                                service.note,
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20.0,
                        top: 25.0,
                        bottom: 30.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image(
                            width: 115.0,
                            image: AssetImage(service.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        )
        .toList();
  }

  Widget _buildFeedback(List<ProviderFeedback> lstFeedback) {
    return ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: lstFeedback.length,
        itemBuilder: (BuildContext context, int index) {
          ProviderFeedback proFeedback = lstFeedback[index];
          List<String> lstImage = lstFeedback[index].imageUrl;
          return Stack(
            children: <Widget>[
              Positioned(
                top: 10.0,
                left: 20.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image(
                    image: AssetImage(proFeedback.userImage),
                    width: 40.0,
                    height: 40.0,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(70.0, 5.0, 20.0, 0.0),
                    // height: 100,
                    // width: 00,
                    color: Color(0xFFC4C4C4).withOpacity(0.2),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                proFeedback.username,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 22.0,
                            ),
                            Text(
                              proFeedback.rateScore.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 12.0),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 20.0, bottom: 10.0, right: 15.0),
                          child: Text(proFeedback.feedback),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 60.0),
                    height: 100.0,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: lstImage.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.all(10.0),
                            child: Image(
                              image: AssetImage(lstImage[index]),
                              fit: BoxFit.cover,
                            ),
                          );
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 70, bottom: 20.0),
                    child: Text(
                      'Đã đăng vào ngày ${proFeedback.commentedDate}',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  )
                ],
              ),
            ],
          );
        });
  }

  Widget _buildComponent(int index) {
    switch (index) {
      case 0:
        return _buildPicture(index);
        break;
      case 1:
        return _buildService(lstService, newCart);
        break;
      case 2:
        return _buildFeedback(lstProviderFeedback);
        break;
    }
  }

  _navigateAndDisplaySelection(
      BuildContext context, Service service, Map<Service, int> newCart) async {
    final cart = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ServiceDetailScreen(
                service: service,
                cart: newCart,
              )),
    );
    this.newCart = cart;
    setState(() {
      _buildCategory(1);
    });
  }

  Widget setupAlertDialoadContainer(Service service) {
    return Container(
      height: 300.0, // Change as per your requirement
      width: 300.0, // Change as per your requirement
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: service.description.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(
              Icons.adjust,
              color: Color(0xFF3EBACE),
              size: 15.0,
            ),
            title: Transform(
                transform: Matrix4.translationValues(-26, 0, 0),
                child: Text(
                  service.description[index],
                  style: TextStyle(fontSize: 14.0),
                )),
            contentPadding: EdgeInsets.only(left: 5),
          );
        },
      ),
    );
  }
}
