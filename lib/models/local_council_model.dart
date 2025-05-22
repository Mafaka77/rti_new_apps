import 'dart:convert';

class LocalCouncilModel {
  int? id;
  String? name;
  String? district;
  LocalCouncilModel({
    this.id,
    this.name,
    this.district,
  });

  LocalCouncilModel copyWith({
    int? id,
    String? name,
    String? district,
  }) {
    return LocalCouncilModel(
      id: id ?? this.id,
      name: name ?? this.name,
      district: district ?? this.district,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'district': district,
    };
  }

  factory LocalCouncilModel.fromMap(Map<String, dynamic> map) {
    return LocalCouncilModel(
      id: map['id']?.toInt(),
      name: map['name'].toString(),
      district: map['district'],
    );
  }
  static List<LocalCouncilModel> fromJsonList(List list) {
    return list.map((e) => LocalCouncilModel.fromMap(e)).toList();
  }

  bool isEqual(LocalCouncilModel model) {
    return id == model.id;
  }

  String toJson() => json.encode(toMap());

  factory LocalCouncilModel.fromJson(String source) =>
      LocalCouncilModel.fromMap(json.decode(source));

  @override
  String toString() => '$name';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LocalCouncilModel &&
        other.id == id &&
        other.name == name &&
        other.district == district;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ district.hashCode;
}
