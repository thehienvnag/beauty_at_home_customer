import 'package:json_annotation/json_annotation.dart';
part 'address_model.g.dart';

@JsonSerializable()
class AddressModel {
  int id;
  String location;
  String locationName;
  bool isDefault;

  AddressModel({
    this.id,
    this.location,
    this.locationName,
    this.isDefault,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}
