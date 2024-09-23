import 'dart:convert';

class DepartmentModel {
  final int id;
  final String name;
  final DateTime created_at;
  DepartmentModel({
    required this.id,
    required this.name,
    required this.created_at,
  });

  DepartmentModel copyWith({
    int? id,
    String? name,
    DateTime? created_at,
  }) {
    return DepartmentModel(
      id: id ?? this.id,
      name: name ?? this.name,
      created_at: created_at ?? this.created_at,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'created_at': created_at.millisecondsSinceEpoch,
    };
  }

  factory DepartmentModel.fromMap(Map<String, dynamic> map) {
    return DepartmentModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      created_at: DateTime.fromMillisecondsSinceEpoch(map['created_at']),
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
      DepartmentModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'DepartmentModel(id: $id, name: $name, created_at: $created_at)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DepartmentModel &&
        other.id == id &&
        other.name == name &&
        other.created_at == created_at;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ created_at.hashCode;
}
