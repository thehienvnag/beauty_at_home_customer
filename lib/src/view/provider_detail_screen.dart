import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/models/provider_feedback_model.dart';
import 'package:flutter_app/src/models/provider_model.dart';
import 'package:flutter_app/src/models/service_model.dart';
import 'package:flutter_app/src/widgets/provider_detail_screen_widget.dart';
import 'package:flutter_app/src/widgets/shared_widget.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';

List<String> _categories = [
  'Hình ảnh',
  'Dịch vụ',
  'Đánh giá',
];

List<String> lstType = ['Massage', 'làm Móng'];

List<ProviderFeedback> lstProviderFeedback = List.from([
  ProviderFeedback(
      username: 'Hiển Huỳnh',
      rateScore: 4.5,
      imageUrl: [
        'public/img/nail_1.jpg',
        'public/img/nail_2.jpg',
        'public/img/nail_2.jpg',
        'public/img/nail_2.jpg',
        'public/img/nail_2.jpg',
        'public/img/nail_2.jpg',
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
    price: '500.000',
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
    price: '200.000',
    estimateTime: 30,
    status: "Đang hoạt động",
    category: lstType[1],
    imageUrl: 'public/img/nail_2.jpg',
    isServiceCombo: false,
    note: 'Bao gồm mỹ phẩm làm đẹp và dụng cụ',
  ),
]);

class ProviderDetailScreen extends StatefulWidget {
  @override
  _ProviderDetailScreenState createState() => _ProviderDetailScreenState();
}

class _ProviderDetailScreenState extends State<ProviderDetailScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
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
                    BoxShadow(
                        color: Colors.grey[300], offset: Offset(0.0, 5.0)),
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
        ],
      ),
      // extendBody: true,
      // bottomNavigationBar: FloatingNavbar(
      //   onTap: (int val) {
      //     //returns tab id which is user tapped
      //   },
      //   backgroundColor: Color(0xFF3EBACE),
      //   fontSize: 18.0,
      //   currentIndex: 1,
      //   items: [
      //     FloatingNavbarItem(
      //       title: 'View Basket',
      //     ),
      //     FloatingNavbarItem(title: '2 items'),
      //     FloatingNavbarItem(title: '410.000đ'),
      //   ],
      // ),
    );
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
        width: 130.0,
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
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: Image(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          image: AssetImage(provider.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildPicture(int index) {
    return Container(
      height: 250,
      width: 350,
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text('5 hình ảnh, 3 videos'),
          SizedBox(height: 10.0),
          Row(
            children: <Widget>[
              _buildImage(0),
              _buildImage(1),
              _buildImage(2),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildService(List<Service> lstService) {
    return Expanded(
      child: ListView.builder(
        itemCount: lstService.length,
        itemBuilder: (BuildContext buildContext, int index) {
          Service service = lstService[index];
          return Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
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
                              width: 150.0,
                              child: Text(
                                service.name,
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            onTap: () => showDialog(
                                context: context,
                                // builder: (BuildContext context) =>
                                //     _buildPopup(service),
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                            width: 250,
                                            child: Text(
                                              service.name,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        IconButton(
                                          icon: Icon(Icons.cancel),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          color: Color(0xFF3EBACE),
                                        ),
                                      ],
                                    ),
                                    content:
                                        setupAlertDialoadContainer(service),
                                    actions: <Widget>[
                                      FlatButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        color: Color(0xFF3EBACE),
                                        child: Text(
                                          'Thêm vào giỏ',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      // new IconButton(
                                      //   icon: Icon(Icons.x),
                                      //   onPressed: () {
                                      //     Navigator.of(context).pop();
                                      //   },
                                      //   color: Color(0xFF3EBACE),
                                      //
                                      // ),
                                    ],
                                  );
                                }),
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          Text(
                            '${service.price}',
                            style: TextStyle(
                                fontSize: 17.0, fontWeight: FontWeight.w900),
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
    );
  }

  Widget _buildFeedback(List<ProviderFeedback> lstFeedback) {
    return Expanded(
      child: ListView.builder(
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
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12.0),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20.0, bottom: 10.0, right: 15.0),
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
          }),
    );
  }

  Widget _buildComponent(int index) {
    switch (index) {
      case 0:
        return _buildPicture(index);
        break;
      case 1:
        return _buildService(lstService);
        break;
      case 2:
        return _buildFeedback(lstProviderFeedback);
        break;
    }
  }

  Widget _buildPopup(Service service) {
    return new AlertDialog(
      title: Text(service.name),
      scrollable: true,
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: service.description.length,
          //     itemBuilder: (BuildContext context, int index) {
          //       return Stack(children: <Widget>[
          //         Column(children: <Widget>[
          //           Text(service.description[index]),
          //         ],),
          //         ],
          //       );
          //     }),
          // ),
          // _buildLogoAttribution(),
        ],
      ),
      actions: <Widget>[
        CloseButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: Color(0xFF3EBACE),
        ),
        // new IconButton(
        //   icon: Icon(Icons.x),
        //   onPressed: () {
        //     Navigator.of(context).pop();
        //   },
        //   color: Color(0xFF3EBACE),
        //
        // ),
      ],
    );
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
                  style: TextStyle(fontSize: 15.0),
                )),
            contentPadding: EdgeInsets.only(left: 5),
          );
        },
      ),
    );
  }
}
