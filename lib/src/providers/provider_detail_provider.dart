import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/models-new/feedback_model.dart';
import 'package:flutter_app/src/models-new/provider_detail_model.dart';
import 'package:flutter_app/src/models-new/service_model.dart';

ProviderModel fake = ProviderModel(
  name: 'Marry Trần Nails & Hails',
  description: 'Chăm sóc tóc và móng',
  address:
      'Đường Lê Văn Việt, phường Tăng Nhơn Phú A, quận 9 thành phố Hồ Chí Minh',
  status: 'Đang hoạt động',
  rate: 4.8,
  reviews: '1440',
  lowerPrice: '50.000đ',
  upperPrice: '500.000đ',
  openTime: '9:00 AM',
  closeTime: '8:30 PM',
  imageUrl:
      'https://cdn.sudospaces.com/website/topz.vn/home/topz/public_html/2020/01/q-makeup-academy-378010.jpg',
  feedbacks: List.from([
    FeedbackModel(
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
    FeedbackModel(
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
  ]),
  services: List.from([
    ServiceModel(
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
      category: 'Massage',
      imageUrl:
          "https://meta.vn/Data/image/2020/12/04/massage-mat-co-tac-dung-gi-3.png",
      serviceImages: List.from([
        'public/img/massage_1.png',
        'public/img/massage_2.jpg',
        'public/img/massage_3.jpg',
        'public/img/massage_4.jpg',
        'public/img/massage_5.jpg',
        'public/img/massage_6.jpg',
        'public/img/massage_7.png',
        'public/img/massage_8.jpg',
      ]),
      isServiceCombo: false,
      note: 'Bao gồm mỹ phẩm làm đẹp và dụng cụ',
    ),
    ServiceModel(
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
      category: 'Làm Móng',
      imageUrl:
          "https://cuahanglamdep.com/images/detailed/3/noi-mi-3d-tai-meli-spa-1.jpg",
      serviceImages: List.from([
        'public/img/nail_1.jpg',
        'public/img/nail_2.jpg',
        'public/img/nail_3.png',
        'public/img/nail_4.png',
        'public/img/nail_5.png',
        'public/img/nail_6.png',
        'public/img/nail_7.png',
        'public/img/nail_8.jpg',
      ]),
      isServiceCombo: false,
      note: 'Bao gồm mỹ phẩm làm đẹp và dụng cụ',
    ),
    ServiceModel(
      name: 'Tóc xoăn tự nhiên',
      description: [
        'Bước 1: làm sạch tay bằng Cool Blue',
        'Bước 2: dũa móng theo khuôn khách yêu cầu',
        'Bước 3: làm mềm da trên mặt móng với gel biểu bì',
        'Bước 4: dùng cây đẩy da đẩy nhẹ trên mặt móng và lau sạch bằng bông',
      ],
      price: '500',
      estimateTime: 30,
      status: "Đang hoạt động",
      category: 'Làm tóc',
      imageUrl:
          'https://i.pinimg.com/originals/96/9e/22/969e22a9ffc82d8d6915044f504e8604.png',
      serviceImages: List.from([
        'public/img/massage_1.png',
        'public/img/massage_2.jpg',
        'public/img/massage_3.jpg',
        'public/img/massage_4.jpg',
        'public/img/massage_5.jpg',
        'public/img/massage_6.jpg',
        'public/img/massage_7.png',
        'public/img/massage_8.jpg',
      ]),
      isServiceCombo: false,
      note: 'Bao gồm mỹ phẩm làm đẹp và dụng cụ',
    ),
    ServiceModel(
      name: 'Trang điểm tự nhiên',
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
      category: "Làm móng",
      imageUrl:
          'https://mathoadaphan.com/wp-content/uploads/2021/02/c%C3%A1c-b%C6%B0%E1%BB%9Bc-trang-%C4%91i%E1%BB%83m-c%C6%A1-b%E1%BA%A3n.jpg',
      serviceImages: List.from([
        'public/img/nail_1.jpg',
        'public/img/nail_2.jpg',
        'public/img/nail_3.png',
        'public/img/nail_4.png',
        'public/img/nail_5.png',
        'public/img/nail_6.png',
        'public/img/nail_7.png',
        'public/img/nail_8.jpg',
      ]),
      isServiceCombo: false,
      note: 'Bao gồm mỹ phẩm làm đẹp và dụng cụ',
    ),
  ]),
);

class ProviderDetailProvider extends ChangeNotifier {
  ProviderModel _provider;
  ServiceModel _currentService;
  ProviderModel get provider => _provider;
  List<ServiceModel> get services => _provider.services;
  ServiceModel get currentService => _currentService;
  List<FeedbackModel> get feedbacks => _provider.feedbacks;
  ServiceModel getService(index) => _provider.services[index];

  void initProvider() {
    _provider = fake;
  }

  void setCurrentService(ServiceModel serviceModel) {
    _currentService = serviceModel;
    notifyListeners();
  }
}
