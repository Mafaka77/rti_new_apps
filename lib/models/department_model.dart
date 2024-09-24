// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DepartmentModel {
  final int id;
  final String name;
  final String created_at;
  DepartmentModel({
    required this.id,
    required this.name,
    required this.created_at,
  });

  DepartmentModel copyWith({
    int? id,
    String? name,
    String? created_at,
  }) {
    return DepartmentModel(
      id: id ?? this.id,
      name: name ?? this.name,
      created_at: created_at ?? this.created_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'created_at': created_at,
    };
  }

  factory DepartmentModel.fromMap(Map<String, dynamic> map) {
    return DepartmentModel(
      id: map['id'] as int,
      name: map['name'] as String,
      created_at: map['created_at'] as String,
    );
  }
  static List<DepartmentModel> fromJsonList(List list) {
    return list.map((e) => DepartmentModel.fromMap(e)).toList();
  }

  ///this method will prevent the override of toString
  bool userFilterByCreationDate(String filter) {
    return created_at.toString().contains(filter);
  }

  ///custom comparing function to check if two users are equal
  bool isEqual(DepartmentModel model) {
    return id == model.id;
  }

  String toJson() => json.encode(toMap());

  factory DepartmentModel.fromJson(String source) =>
      DepartmentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => ' $name';

  @override
  bool operator ==(covariant DepartmentModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.created_at == created_at;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ created_at.hashCode;
}
