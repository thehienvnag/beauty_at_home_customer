import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/apis/provider_api/simple_api.dart';
import 'package:flutter_app/src/models-new/feedback_model.dart';
import 'package:flutter_app/src/models-new/provider_detail_model.dart';
import 'package:flutter_app/src/models-new/service_model.dart';
import 'package:flutter_app/src/utils/api_constants.dart';

// ProviderModel fake = ProviderModel(
//   displayName: 'Marry Trần Nails & Hails',
//   description: 'Chăm sóc tóc và móng',
//   // address:
//   //     'Đường Lê Văn Việt, phường Tăng Nhơn Phú A, quận 9 thành phố Hồ Chí Minh',
//   status: 'Đang hoạt động',
//   rate: 4.8,
//   reviews: '1440',
//   lowerPrice: '50.000đ',
//   upperPrice: '500.000đ',
//   // openTime: '9:00 AM',
//   // closeTime: '8:30 PM',
//   // imageUrl:
//   //     'https://cdn.sudospaces.com/website/topz.vn/home/topz/public_html/2020/01/q-makeup-academy-378010.jpg',
//   services: List.from([
//     ServiceModel(
//       serviceName: '90 phút Massage body toàn thân',
//       // description: [
//       //   'Bước 1: làm sạch tay bằng Cool Blue',
//       //   'Bước 2: dũa móng theo khuôn khách yêu cầu',
//       //   'Bước 3: làm mềm da trên mặt móng với gel biểu bì',
//       //   'Bước 4: dùng cây đẩy da đẩy nhẹ trên mặt móng và lau sạch bằng bông',
//       // ],
//       price: '500',
//       estimateTime: 30,
//       status: "Đang hoạt động",
//     serviceType: 'Massage',
//     imageUrl:
//         "https://meta.vn/Data/image/2020/12/04/massage-mat-co-tac-dung-gi-3.png",
//     serviceImages: List.from([
//       'public/img/massage_1.png',
//       'public/img/massage_2.jpg',
//       'public/img/massage_3.jpg',
//       'public/img/massage_4.jpg',
//       'public/img/massage_5.jpg',
//       'public/img/massage_6.jpg',
//       'public/img/massage_7.png',
//       'public/img/massage_8.jpg',
//     ]),
//     isServiceCombo: false,
//     summary: 'Bao gồm mỹ phẩm làm đẹp và dụng cụ',
//   ),
//   ServiceModel(
//     name: 'Làm sạch và sơn gel',
//     // description: [
//     //   'Bước 1: làm sạch tay bằng Cool Blue',
//     //   'Bước 2: dũa móng theo khuôn khách yêu cầu',
//     //   'Bước 3: làm mềm da trên mặt móng với gel biểu bì',
//     //   'Bước 4: dùng cây đẩy da đẩy nhẹ trên mặt móng và lau sạch bằng bông',
//     //   'Bước 5: làm sạch dung dịch gel sót trên da và dùng kiềm nhặt da sót lại',
//     //   'Bước 6: làm sạch mặt móng với dung dịch làm khô chuyên biệt',
//     //   'Bước 7: sơn gel',
//     //   'Bước 8: thao dưỡng khóe móng và móng bằng culticle eraser và solar oil'
//     // ],
//     price: '200',
//     estimateTime: 30,
//     status: "Đang hoạt động",
//     category: 'Làm Móng',
//     imageUrl:
//         "https://cuahanglamdep.com/images/detailed/3/noi-mi-3d-tai-meli-spa-1.jpg",
//     serviceImages: List.from([
//       'public/img/nail_1.jpg',
//       'public/img/nail_2.jpg',
//       'public/img/nail_3.png',
//       'public/img/nail_4.png',
//       'public/img/nail_5.png',
//       'public/img/nail_6.png',
//       'public/img/nail_7.png',
//       'public/img/nail_8.jpg',
//     ]),
//     isServiceCombo: false,
//     summary: 'Bao gồm mỹ phẩm làm đẹp và dụng cụ',
//   ),
//   ServiceModel(
//     name: 'Tóc xoăn tự nhiên',
//   //   description: [
//   //     'Bước 1: làm sạch tay bằng Cool Blue',
//   //     'Bước 2: dũa móng theo khuôn khách yêu cầu',
//   //     'Bước 3: làm mềm da trên mặt móng với gel biểu bì',
//   //     'Bước 4: dùng cây đẩy da đẩy nhẹ trên mặt móng và lau sạch bằng bông',
//   //   ],
//     price: '500',
//     estimateTime: 30,
//     status: "Đang hoạt động",
//     category: 'Làm tóc',
//     imageUrl:
//         'https://i.pinimg.com/originals/96/9e/22/969e22a9ffc82d8d6915044f504e8604.png',
//     serviceImages: List.from([
//       'public/img/massage_1.png',
//       'public/img/massage_2.jpg',
//       'public/img/massage_3.jpg',
//       'public/img/massage_4.jpg',
//       'public/img/massage_5.jpg',
//       'public/img/massage_6.jpg',
//       'public/img/massage_7.png',
//       'public/img/massage_8.jpg',
//     ]),
//     isServiceCombo: false,
//     summary: 'Bao gồm mỹ phẩm làm đẹp và dụng cụ',
//   ),
//   ServiceModel(
//     name: 'Trang điểm tự nhiên',
//     // description: [
//     //   'Bước 1: làm sạch tay bằng Cool Blue',
//     //   'Bước 2: dũa móng theo khuôn khách yêu cầu',
//     //   'Bước 3: làm mềm da trên mặt móng với gel biểu bì',
//     //   'Bước 4: dùng cây đẩy da đẩy nhẹ trên mặt móng và lau sạch bằng bông',
//     //   'Bước 5: làm sạch dung dịch gel sót trên da và dùng kiềm nhặt da sót lại',
//     //   'Bước 6: làm sạch mặt móng với dung dịch làm khô chuyên biệt',
//     //   'Bước 7: sơn gel',
//     //   'Bước 8: thao dưỡng khóe móng và móng bằng culticle eraser và solar oil'
//     // ],
//     price: '200',
//     estimateTime: 30,
//     status: "Đang hoạt động",
//     category: "Làm móng",
//     imageUrl:
//         'https://mathoadaphan.com/wp-content/uploads/2021/02/c%C3%A1c-b%C6%B0%E1%BB%9Bc-trang-%C4%91i%E1%BB%83m-c%C6%A1-b%E1%BA%A3n.jpg',
//     serviceImages: List.from([
//       'public/img/nail_1.jpg',
//       'public/img/nail_2.jpg',
//       'public/img/nail_3.png',
//       'public/img/nail_4.png',
//       'public/img/nail_5.png',
//       'public/img/nail_6.png',
//       'public/img/nail_7.png',
//       'public/img/nail_8.jpg',
//     ]),
//     isServiceCombo: false,
//     summary: 'Bao gồm mỹ phẩm làm đẹp và dụng cụ',
//   ),
// ]),
// );

class ProviderDetailProvider extends ChangeNotifier {
  ProviderModel _provider;
  ServiceModel _currentService;
  List<ServiceModel> _services;

  List<ProviderModel> _listProviderHome;
  List<ProviderModel> get listProviderHome => _listProviderHome;

  ProviderModel get provider => _provider;

  List<ServiceModel> get services => _services;

  ServiceModel get currentService => _currentService;

  // List<FeedbackModel> get feedbacks => _provider.feedbacks;

  ServiceModel getService(index) => _provider.services[index];

  void initProvider(String id) async {
    final fromJson = (source) => ProviderModel.fromJson(source);
    final fromServiceJson = (source) => ServiceModel.fromJson(source);
    // _provider = fake;
    _provider = await SimpleAPI.getById(ProviderAPIConstant.PROVIDER, id,
        fromJson: fromJson);
    _services = await SimpleAPI.getAll<ServiceModel>(ServiceAPIConstant.SERVICE,
        queryParameters: {"AccountId": id}, fromJson: fromServiceJson);
    if (_services != null && _services.isNotEmpty) {
      double lowerPrice = 999999;
      double upperPrice = 0;
      _services.forEach((element) {
        if (element.price > upperPrice) {
          upperPrice = element.price;
        }
        if (element.price < lowerPrice) {
          lowerPrice = element.price;
        }
        _provider.lowerPrice = lowerPrice.toString();
        _provider.upperPrice = upperPrice.toString();
      });
    }
    notifyListeners();
  }

  void setCurrentService(ServiceModel serviceModel) {
    _currentService = serviceModel;
    notifyListeners();
  }

  void initProviderListHome() async {
    final fromJson = (source) => ProviderModel.fromJson(source);
    _listProviderHome = await SimpleAPI.getAll<ProviderModel>(
      ProviderAPIConstant.PROVIDER,
      fromJson: fromJson,
      queryParameters: {"isBeautyArtist": "true"},
    );
    log(_listProviderHome[0].displayName);
    notifyListeners();
  }
}
