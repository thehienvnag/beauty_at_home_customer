import 'dart:convert';

class ApiModel<T> {
  T content;
  ApiModel({
    this.content
  });

  Map<String, dynamic> toMap() {
    return {
      'content': content,
    };
  }

  factory ApiModel.fromMap(Map<String, dynamic> map) {
    return ApiModel(
      content: map['content'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiModel.fromJson(String source) =>
      ApiModel.fromMap(json.decode(source));

}