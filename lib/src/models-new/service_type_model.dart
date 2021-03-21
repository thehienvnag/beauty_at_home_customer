import 'dart:convert';

class ServiceTypeModel {
  String name;

  ServiceTypeModel({
    this.name,
  });

  factory ServiceTypeModel.fromMap(Map<String, dynamic> map) {
    return new ServiceTypeModel(
      name: map['name'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'name': this.name,
    } as Map<String, dynamic>;
  }

  String toJson() => json.encode(toMap());

  factory ServiceTypeModel.fromJson(String source) =>
      ServiceTypeModel.fromMap(json.decode(source));
}