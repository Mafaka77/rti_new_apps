// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ComplaintModel {
  int? id;
  String? citizen_question;
  String? second_appeal_cic_in;
  String? second_appeal_cic_answer;
  String? created_at;
  ComplaintModel({
    this.id,
    this.citizen_question,
    this.second_appeal_cic_in,
    this.second_appeal_cic_answer,
    this.created_at,
  });

  ComplaintModel copyWith({
    int? id,
    String? citizen_question,
    String? second_appeal_cic_in,
    String? second_appeal_cic_answer,
    String? created_at,
  }) {
    return ComplaintModel(
      id: id ?? this.id,
      citizen_question: citizen_question ?? this.citizen_question,
      second_appeal_cic_in: second_appeal_cic_in ?? this.second_appeal_cic_in,
      second_appeal_cic_answer:
          second_appeal_cic_answer ?? this.second_appeal_cic_answer,
      created_at: created_at ?? this.created_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'citizen_question': citizen_question,
      'second_appeal_cic_in': second_appeal_cic_in,
      'second_appeal_cic_answer': second_appeal_cic_answer,
      'created_at': created_at,
    };
  }

  factory ComplaintModel.fromMap(Map<String, dynamic> map) {
    return ComplaintModel(
      id: map['id'] != null ? map['id'] as int : null,
      citizen_question: map['citizen_question'] != null
          ? map['citizen_question'] as String
          : null,
      second_appeal_cic_in: map['second_appeal_cic_in'] != null
          ? map['second_appeal_cic_in'] as String
          : null,
      second_appeal_cic_answer: map['second_appeal_cic_answer'] != null
          ? map['second_appeal_cic_answer'] as String
          : null,
      created_at:
          map['created_at'] != null ? map['created_at'] as String : null,
    );
  }

  static List<ComplaintModel> fromJsonList(List list) {
    return list.map((e) => ComplaintModel.fromMap(e)).toList();
  }
}
