import 'dart:convert';

class AddressModel {
  String id;
  String location;
  String locationName;
  bool isDefault;

  AddressModel({
    this.id,
    this.location,
    this.locationName,
    this.isDefault,
  });

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return new AddressModel(
      id: map['id'].toString(),
      location: map['location'],
      locationName: map['locationName'],
      isDefault: map['isDefault'],
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'location': this.location,
      'locationName': this.locationName,
      'isDefault': this.isDefault,
    } as Map<String, dynamic>;
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(json.decode(source));

}