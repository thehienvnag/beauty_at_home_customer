import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/models-new/image_model.dart';
import 'package:flutter_app/src/models-new/service_model.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_app/src/utils/routes_name.dart';
import 'package:flutter_app/src/widgets/shared_widget/style.dart';

class ServiceDetailImage extends StatefulWidget {
  final List<ImageModel> lstImage;
  final Map<ServiceModel, int> cart;

  const ServiceDetailImage({Key key, this.lstImage, this.cart})
      : super(key: key);

  @override
  _ServiceDetailImageState createState() => _ServiceDetailImageState();
}

class _ServiceDetailImageState extends State<ServiceDetailImage> {
  final PageController controller = PageController();
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    /// Attach a listener which will update the state and refresh the page index
    controller.addListener(() {
      if (controller.page.round() != currentIndex) {
        setState(() {
          currentIndex = controller.page.round();
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: 230.0,
            width: MediaQuery.of(context).size.width,
            child: _sliderImage()),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.25,
              left: MediaQuery.of(context).size.width * 0.86),
          child: Text(
            '1/${widget.lstImage.length}',
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          height: MediaQuery.of(context).size.width * 0.06,
          width: MediaQuery.of(context).size.width * 0.11,
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.cancel,
                  color: Colors.white,
                ),
                iconSize: 30.0,
                color: Colors.black,
                onPressed: () => Navigator.pop(context, widget.cart),
              ),
              PopupMenuButton(
                icon: Container(
                  padding: EdgeInsets.only(left: 0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    shape: BoxShape.circle,
                  ),
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                    ),
                  ),
                ),
                elevation: 3.2,
                onSelected: (value) {
                  if (value == "Back_Home") {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      Routes.home,
                      (Route<dynamic> route) => false,
                    );
                  }
                },
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                      value: "Back_Home",
                      child: Text(
                        "Trở về trang chủ",
                        style: CustomTextStyle.statusText(Colors.black),
                      ),
                    ),
                  ];
                },
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _sliderImage() {
    return Scaffold(
      body: _imageCarousel(),
    );
  }

  Widget _imageCarousel() {
    return Carousel(
      showIndicator: false,
      autoplay: false,
      images: [
        NetworkImage(widget.lstImage[0].imageUrl),
        // AssetImage(widget.lstImage[1].imageUrl),
        // AssetImage(widget.lstImage[2].imageUrl),
        // AssetImage(widget.lstImage[3].imageUrl),
        // AssetImage(widget.lstImage[4].imageUrl),
        // AssetImage(widget.lstImage[5].imageUrl),
        // AssetImage(widget.lstImage[6].imageUrl),
        // AssetImage(widget.lstImage[7].imageUrl),
      ],
    );
  }
}
