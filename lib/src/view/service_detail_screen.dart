import 'package:flutter/material.dart';
import 'package:flutter_app/src/models/provider_detail_model/service_model.dart';
import 'package:flutter_app/src/view/provider_detail_screen.dart';
import 'package:flutter_app/src/widgets/service_detail_widget.dart';

class ServiceDetailScreen extends StatelessWidget {
  const ServiceDetailScreen({Key key, this.service}) : super(key: key);

  final Service service;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 10.0),
        height: screenSize.height * 0.06,
        width: screenSize.width * 0.9,
        child: FloatingActionButton.extended(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProviderDetailScreen(),
            ));
          },
          backgroundColor: Color(0xff28BEBA),
          label: Text(
            'THÊM VÀO GIỎ HÀNG',
            style: TextStyle(color: Colors.white, letterSpacing: 3),
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ServiceDetailImage(
                path: service.imageUrl,
              ),
              ServiceDetailDescription(
                name: service.name,
                note: service.note,
                price: service.price,
              ),
              ServiceDetailStepDescription(description: service.description,),
              ServiceDetailQuantityUpdating(),
            ],
          ),
        ),
      ),
    );
  }
}
