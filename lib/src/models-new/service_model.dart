import 'dart:convert';

class ServiceModel {
  String name;
  List<String> description;
  String price;
  int estimateTime;
  String status;
  String category;
  String imageUrl;
  List<String> serviceImages;
  bool isServiceCombo;
  String note;

  ServiceModel({
    this.name,
    this.description,
    this.price,
    this.estimateTime,
    this.status,
    this.category,
    this.imageUrl,
    this.serviceImages,
    this.isServiceCombo,
    this.note,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'estimateTime': estimateTime,
      'status': status,
      'category': category,
      'imageUrl': imageUrl,
      'serviceImages': serviceImages,
      'isServiceCombo': isServiceCombo,
      'note': note,
    };
  }

  factory ServiceModel.fromMap(Map<String, dynamic> map) {
    return ServiceModel(
      name: map['name'],
      description: List<String>.from(map['description']),
      price: map['price'],
      estimateTime: map['estimateTime'],
      status: map['status'],
      category: map['category'],
      imageUrl: map['imageUrl'],
      serviceImages: List<String>.from(map['serviceImages']),
      isServiceCombo: map['isServiceCombo'],
      note: map['note'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceModel.fromJson(String source) =>
      ServiceModel.fromMap(json.decode(source));
}
