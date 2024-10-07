// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:rti_new_apps/models/department_model.dart';
import 'package:rti_new_apps/models/local_council_model.dart';

class MyRtiModel {
  int? id;
  String? citizen_question;
  int? citizen_question_department;
  String? aspio_in;
  String? aspio_answer;
  String? spio_in;
  String? spio_answer;
  String? first_appeal_daa_in;
  String? first_appeal_daa_answer;
  String? second_appeal_cic_in;
  String? second_appeal_cic_answer;
  String? created_at;
  DepartmentModel? departmentModel;
  LocalCouncilModel? local_council;
  MyRtiModel({
    this.id,
    this.citizen_question,
    this.citizen_question_department,
    this.aspio_in,
    this.aspio_answer,
    this.spio_in,
    this.spio_answer,
    this.first_appeal_daa_in,
    this.first_appeal_daa_answer,
    this.second_appeal_cic_in,
    this.second_appeal_cic_answer,
    this.created_at,
    this.departmentModel,
    this.local_council,
  });

  MyRtiModel copyWith({
    int? id,
    String? citizen_question,
    int? citizen_question_department,
    String? aspio_in,
    String? aspio_answer,
    String? spio_in,
    String? spio_answer,
    String? first_appeal_daa_in,
    String? first_appeal_daa_answer,
    String? second_appeal_cic_in,
    String? second_appeal_cic_answer,
    String? created_at,
    DepartmentModel? departmentModel,
    LocalCouncilModel? local_council,
  }) {
    return MyRtiModel(
      id: id ?? this.id,
      citizen_question: citizen_question ?? this.citizen_question,
      citizen_question_department:
          citizen_question_department ?? this.citizen_question_department,
      aspio_in: aspio_in ?? this.aspio_in,
      aspio_answer: aspio_answer ?? this.aspio_answer,
      spio_in: spio_in ?? this.spio_in,
      spio_answer: spio_answer ?? this.spio_answer,
      first_appeal_daa_in: first_appeal_daa_in ?? this.first_appeal_daa_in,
      first_appeal_daa_answer:
          first_appeal_daa_answer ?? this.first_appeal_daa_answer,
      second_appeal_cic_in: second_appeal_cic_in ?? this.second_appeal_cic_in,
      second_appeal_cic_answer:
          second_appeal_cic_answer ?? this.second_appeal_cic_answer,
      created_at: created_at ?? this.created_at,
      departmentModel: departmentModel ?? this.departmentModel,
      local_council: local_council ?? this.local_council,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'citizen_question': citizen_question,
      'citizen_question_department': citizen_question_department,
      'aspio_in': aspio_in,
      'aspio_answer': aspio_answer,
      'spio_in': spio_in,
      'spio_answer': spio_answer,
      'first_appeal_daa_in': first_appeal_daa_in,
      'first_appeal_daa_answer': first_appeal_daa_answer,
      'second_appeal_cic_in': second_appeal_cic_in,
      'second_appeal_cic_answer': second_appeal_cic_answer,
      'created_at': created_at,
      'departmentModel': departmentModel?.toMap(),
      'local_council': local_council?.toMap(),
    };
  }

  factory MyRtiModel.fromMap(Map<String, dynamic> map) {
    return MyRtiModel(
      id: map['id'] != null ? map['id'] as int : null,
      citizen_question: map['citizen_question'] != null
          ? map['citizen_question'] as String
          : null,
      citizen_question_department: map['citizen_question_department'] != null
          ? map['citizen_question_department'] as int
          : null,
      aspio_in: map['aspio_in'] != null ? map['aspio_in'] as String : null,
      aspio_answer:
          map['aspio_answer'] != null ? map['aspio_answer'] as String : null,
      spio_in: map['spio_in'] != null ? map['spio_in'] as String : null,
      spio_answer:
          map['spio_answer'] != null ? map['spio_answer'] as String : null,
      first_appeal_daa_in: map['first_appeal_daa_in'] != null
          ? map['first_appeal_daa_in'] as String
          : null,
      first_appeal_daa_answer: map['first_appeal_daa_answer'] != null
          ? map['first_appeal_daa_answer'] as String
          : null,
      second_appeal_cic_in: map['second_appeal_cic_in'] != null
          ? map['second_appeal_cic_in'] as String
          : null,
      second_appeal_cic_answer: map['second_appeal_cic_answer'] != null
          ? map['second_appeal_cic_answer'] as String
          : null,
      created_at:
          map['created_at'] != null ? map['created_at'] as String : null,
      departmentModel: map['department'] != null
          ? DepartmentModel.fromMap(map['department'] as Map<String, dynamic>)
          : null,
      local_council: map['local_council'] != null
          ? LocalCouncilModel.fromMap(
              map['local_council'] as Map<String, dynamic>)
          : null,
    );
  }
  static List<MyRtiModel> fromJsonList(List list) {
    return list.map((e) => MyRtiModel.fromMap(e)).toList();
  }

  String toJson() => json.encode(toMap());

  factory MyRtiModel.fromJson(String source) =>
      MyRtiModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MyRtiModel(id: $id, citizen_question: $citizen_question, citizen_question_department: $citizen_question_department, aspio_in: $aspio_in, aspio_answer: $aspio_answer, spio_in: $spio_in, spio_answer: $spio_answer, first_appeal_daa_in: $first_appeal_daa_in, first_appeal_daa_answer: $first_appeal_daa_answer, second_appeal_cic_in: $second_appeal_cic_in, second_appeal_cic_answer: $second_appeal_cic_answer, created_at: $created_at, departmentModel: $departmentModel, local_council: $local_council)';
  }

  @override
  bool operator ==(covariant MyRtiModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.citizen_question == citizen_question &&
        other.citizen_question_department == citizen_question_department &&
        other.aspio_in == aspio_in &&
        other.aspio_answer == aspio_answer &&
        other.spio_in == spio_in &&
        other.spio_answer == spio_answer &&
        other.first_appeal_daa_in == first_appeal_daa_in &&
        other.first_appeal_daa_answer == first_appeal_daa_answer &&
        other.second_appeal_cic_in == second_appeal_cic_in &&
        other.second_appeal_cic_answer == second_appeal_cic_answer &&
        other.created_at == created_at &&
        other.departmentModel == departmentModel &&
        other.local_council == local_council;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        citizen_question.hashCode ^
        citizen_question_department.hashCode ^
        aspio_in.hashCode ^
        aspio_answer.hashCode ^
        spio_in.hashCode ^
        spio_answer.hashCode ^
        first_appeal_daa_in.hashCode ^
        first_appeal_daa_answer.hashCode ^
        second_appeal_cic_in.hashCode ^
        second_appeal_cic_answer.hashCode ^
        created_at.hashCode ^
        departmentModel.hashCode ^
        local_council.hashCode;
  }
}
