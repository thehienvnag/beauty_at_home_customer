import 'dart:convert';

class ApiListModel<T> {
  List<T> contents;
  int total;
  ApiListModel({
    this.total,
    this.contents
  });

  Map<String, dynamic> toMap() {
    return {
      'contents': contents,
      'total': total,
    };
  }

  factory ApiListModel.fromMap(Map<String, dynamic> map) {
    return ApiListModel(
      total: map['total'],
      contents: map['contents'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiListModel.fromJson(String source) =>
      ApiListModel.fromMap(json.decode(source));

}