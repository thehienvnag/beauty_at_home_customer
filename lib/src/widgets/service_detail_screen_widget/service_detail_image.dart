import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/models-new/service_model.dart';
import 'package:carousel_pro/carousel_pro.dart';

class ServiceDetailImage extends StatefulWidget {
  final List<String> lstImage;
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
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.cancel,
                  color: Colors.white,
                ),
                iconSize: 30.0,
                color: Colors.black,
                onPressed: () => Navigator.pop(context, widget.cart),
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
        AssetImage(widget.lstImage[0]),
        AssetImage(widget.lstImage[1]),
        AssetImage(widget.lstImage[2]),
        AssetImage(widget.lstImage[3]),
        AssetImage(widget.lstImage[4]),
        AssetImage(widget.lstImage[5]),
        AssetImage(widget.lstImage[6]),
        AssetImage(widget.lstImage[7]),
      ],
    );
  }
}
