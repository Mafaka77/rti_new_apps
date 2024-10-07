// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DistrictModel {
  int? id;
  String? name;
  DistrictModel({
    this.id,
    this.name,
  });

  DistrictModel copyWith({
    int? id,
    String? name,
  }) {
    return DistrictModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory DistrictModel.fromMap(Map<String, dynamic> map) {
    return DistrictModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }
  static List<DistrictModel> fromJsonList(List list) {
    return list.map((e) => DistrictModel.fromMap(e)).toList();
  }

  String toJson() => json.encode(toMap());

  factory DistrictModel.fromJson(String source) =>
      DistrictModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => '$name';
  bool isEqual(DistrictModel model) {
    return id == model.id;
  }

  @override
  bool operator ==(covariant DistrictModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
