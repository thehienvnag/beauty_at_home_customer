import 'package:flutter_app/src/models/service_model.dart';

class Staff {
  final String image;
  final String salonOwner;
  final String titleService;
  final List<ServiceItem> listService;
  final double rate;
  final String area;
  final String timeLine;
  String range;
  String status;

  Staff({
    this.image,
    this.listService,
    this.salonOwner,
    this.titleService,
    this.rate,
    this.area,
    this.timeLine,
  });
}
