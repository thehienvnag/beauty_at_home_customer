import 'package:flutter/material.dart';
import 'package:flutter_app/src/models/base_model.dart';
import 'package:flutter_app/src/models/booking_summary_model.dart';
import 'package:flutter_app/src/models/cart_item.dart';
import 'package:flutter_app/src/presenter/booking_summary_presenter.dart';
import 'package:flutter_app/src/view/booking_history_detail.dart';
import 'package:flutter_app/src/view/interfaces/booking_summary_view.dart';
import 'package:flutter_app/src/widgets/booking_summary_widget.dart';
import 'package:flutter_app/src/widgets/shared_widget.dart';
import 'package:flutter_app/src/widgets/wait_confirm_screen_widget.dart';

final List<Widget> dynamicContents = [
  CoverImage(
    path: 'public/img/cus_wait_confirm.png',
  ),
  CoverImage(
    path: 'public/img/cus_under_working.png',
  ),
];

class BookingSummary extends StatefulWidget {
  final IBookingSummaryPresenter presenter;
  const BookingSummary({
    Key key,
    this.presenter,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => _BookingSummaryState();
}

class _BookingSummaryState extends State<BookingSummary>
    implements IBookingSummaryView {
  BookingSummaryModel _model;

  @override
  void initState() {
    super.initState();
    //initial
    _model = BookingSummaryModel(
      currentStepIndex: 0,
    );

    this.widget.presenter.initModel(_model);
    this.widget.presenter.initView(this);

    Future(() {
      Future.delayed(Duration(seconds: 5));
    }).then(
      (value) => this.widget.presenter.testChangeCurrentScreenStateFrequently(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: DetailScreenAppBar(
          disabledBack: true,
          title: Text(
            'Booking Summary',
            style: TextStyle(color: Color(0xff636363), fontSize: 18),
          ),
        ),
      ),
      body: SlidingUpView(
        minHeight: screenSize.height * 0.4,
        maxHeight: screenSize.height * 0.6,
        body: dynamicContents[_model?.currentStepIndex],
        panelContents: [
          BookingProgress(
            currentStepIndex: 1,
          ),
          BeauticianDescription(
            image: 'public/img/beautician_test.png',
            beauticianName: 'Marry Trần',
            mainService: 'Trang điểm - Làm tóc',
            phone: '0918076861',
          ),
          OutlinedCard(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
            width: screenSize.width * 0.95,
            sections: [
              LocationSummary(
                address: '5/3 đường số 9',
              ),
            ],
          ),
          OrderDescription(
            title: 'Makeup Hoàng Gia',
            priceAfter: '458.000đ',
            priceBefore: '650.000đ',
            listItem: listItem,
          ),
        ],
      ),
    );
  }

  @override
  void refreshModel(IBaseModel model) {
    setState(() {
      _model = model;
    });
  }

  @override
  void navigateBookingHistory() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => BookingHistoryDetailScreen(),
    ));
  }
}

List<CartItem> listItem = List.from(
  <CartItem>[
    CartItem(
      content: '90 phút massage body toàn thân',
      quantity: 2,
    ),
    CartItem(
      content: 'Sơn móng Hoa Hướng Dương',
      quantity: 1,
    ),
    CartItem(
      content: 'Sơn móng Hoa Hướng Dương',
      quantity: 1,
    ),
  ],
);
