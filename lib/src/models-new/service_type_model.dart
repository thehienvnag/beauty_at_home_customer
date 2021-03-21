import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
part 'service_type_model.g.dart';

@JsonSerializable()
class ServiceTypeModel {
  String name;

  ServiceTypeModel({
    this.name,
  });
  factory ServiceTypeModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceTypeModelToJson(this);
}
