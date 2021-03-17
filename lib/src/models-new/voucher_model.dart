import 'dart:convert';

class VoucherModel {
  String image;
  String title;
  String description;
  String priceBefore;
  String priceAfter;
  VoucherModel({
    this.image,
    this.title,
    this.description,
    this.priceBefore,
    this.priceAfter,
  });

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'title': title,
      'description': description,
      'priceBefore': priceBefore,
      'priceAfter': priceAfter,
    };
  }

  factory VoucherModel.fromMap(Map<String, dynamic> map) {
    return VoucherModel(
      image: map['image'],
      title: map['title'],
      description: map['description'],
      priceBefore: map['priceBefore'],
      priceAfter: map['priceAfter'],
    );
  }

  String toJson() => json.encode(toMap());

  factory VoucherModel.fromJson(String source) =>
      VoucherModel.fromMap(json.decode(source));
}
