import 'dart:convert';

class FaqModel {
  int? id;
  String? title;
  String? body;
  FaqModel({
    this.id,
    this.title,
    this.body,
  });

  FaqModel copyWith({
    int? id,
    String? title,
    String? body,
  }) {
    return FaqModel(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory FaqModel.fromMap(Map<String, dynamic> map) {
    return FaqModel(
      id: map['id']?.toInt(),
      title: map['title'],
      body: map['body'],
    );
  }
  static List<FaqModel> fromJsonList(List list) {
    return list.map((e) => FaqModel.fromMap(e)).toList();
  }

  String toJson() => json.encode(toMap());

  factory FaqModel.fromJson(String source) =>
      FaqModel.fromMap(json.decode(source));

  @override
  String toString() => 'FaqModel(id: $id, title: $title, body: $body)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FaqModel &&
        other.id == id &&
        other.title == title &&
        other.body == body;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ body.hashCode;
}
