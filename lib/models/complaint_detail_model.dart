// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ComplaintDetailModel {
  int? id;
  String? citizen_question;
  String? citizen_question_file;
  String? second_appeal_cic_answer;
  String? second_appeal_cic_answer_file;
  String? second_appeal_cic_out;
  String? complain;
  String? created_at;
  ComplaintDetailModel({
    this.id,
    this.citizen_question,
    this.citizen_question_file,
    this.second_appeal_cic_answer,
    this.second_appeal_cic_answer_file,
    this.second_appeal_cic_out,
    this.complain,
    this.created_at,
  });

  ComplaintDetailModel copyWith({
    int? id,
    String? citizen_question,
    String? citizen_question_file,
    String? second_appeal_cic_answer,
    String? second_appeal_cic_answer_file,
    String? second_appeal_cic_out,
    String? complain,
    String? created_at,
  }) {
    return ComplaintDetailModel(
      id: id ?? this.id,
      citizen_question: citizen_question ?? this.citizen_question,
      citizen_question_file:
          citizen_question_file ?? this.citizen_question_file,
      second_appeal_cic_answer:
          second_appeal_cic_answer ?? this.second_appeal_cic_answer,
      second_appeal_cic_answer_file:
          second_appeal_cic_answer_file ?? this.second_appeal_cic_answer_file,
      second_appeal_cic_out:
          second_appeal_cic_out ?? this.second_appeal_cic_out,
      complain: complain ?? this.complain,
      created_at: created_at ?? this.created_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'citizen_question': citizen_question,
      'citizen_question_file': citizen_question_file,
      'second_appeal_cic_answer': second_appeal_cic_answer,
      'second_appeal_cic_answer_file': second_appeal_cic_answer_file,
      'second_appeal_cic_out': second_appeal_cic_out,
      'complain': complain,
      'created_at': created_at,
    };
  }

  factory ComplaintDetailModel.fromMap(Map<String, dynamic> map) {
    return ComplaintDetailModel(
      id: map['id'] != null ? map['id'] as int : null,
      citizen_question: map['citizen_question'] != null
          ? map['citizen_question'] as String
          : null,
      citizen_question_file: map['citizen_question_file'] != null
          ? map['citizen_question_file'] as String
          : null,
      second_appeal_cic_answer: map['second_appeal_cic_answer'] != null
          ? map['second_appeal_cic_answer'] as String
          : null,
      second_appeal_cic_answer_file:
          map['second_appeal_cic_answer_file'] != null
              ? map['second_appeal_cic_answer_file'] as String
              : null,
      second_appeal_cic_out: map['second_appeal_cic_out'] != null
          ? map['second_appeal_cic_out'] as String
          : null,
      complain: map['complain'] != null ? map['complain'] as String : null,
      created_at:
          map['created_at'] != null ? map['created_at'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ComplaintDetailModel.fromJson(String source) =>
      ComplaintDetailModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ComplaintDetailModel(id: $id, citizen_question: $citizen_question, citizen_question_file: $citizen_question_file, second_appeal_cic_answer: $second_appeal_cic_answer, second_appeal_cic_answer_file: $second_appeal_cic_answer_file, second_appeal_cic_out: $second_appeal_cic_out, complain: $complain, created_at: $created_at)';
  }

  @override
  bool operator ==(covariant ComplaintDetailModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.citizen_question == citizen_question &&
        other.citizen_question_file == citizen_question_file &&
        other.second_appeal_cic_answer == second_appeal_cic_answer &&
        other.second_appeal_cic_answer_file == second_appeal_cic_answer_file &&
        other.second_appeal_cic_out == second_appeal_cic_out &&
        other.complain == complain &&
        other.created_at == created_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        citizen_question.hashCode ^
        citizen_question_file.hashCode ^
        second_appeal_cic_answer.hashCode ^
        second_appeal_cic_answer_file.hashCode ^
        second_appeal_cic_out.hashCode ^
        complain.hashCode ^
        created_at.hashCode;
  }
}
