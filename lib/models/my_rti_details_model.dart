import 'dart:convert';

import 'package:rti_new_apps/models/department_model.dart';
import 'package:rti_new_apps/models/paid_attachment_model.dart';

class MyRtiDetailsModel {
  int? id;
  String? citizen_name;
  String? citizen_contact;
  String? citizen_address;
  String? citizen_question;
  String? citizen_question_file;
  int? citizen_question_department;
  int? citizen_bpl;
  String? citizen_bpl_file;
  int? life_or_death;
  String? spio_in;
  String? spio_answer;
  String? spio_answer_file;
  String? spio_transfer_remark;
  String? spio_transfer_department;
  String? spio_out;
  String? spio_id;
  String? first_appeal_daa_in;
  String? first_appeal_citizen_question;
  String? first_appeal_citizen_question_file;
  String? first_appeal_daa_answer;
  String? first_appeal_daa_answer_file;
  String? first_appeal_daa_out;
  String? daa_id;
  String? second_appeal_cic_in;
  String? second_appeal_citizen_question;
  String? second_appeal_citizen_question_file;
  String? second_appeal_cic_answer;
  String? second_appeal_cic_answer_file;
  String? second_appeal_cic_out;
  String? my_file_proof;
  String? created_at;
  String? citizen_question_locall_council;
  String? local_council;
  DepartmentModel? department;
  PaidAttachmentModel? paid_attachments;
  MyRtiDetailsModel({
    this.id,
    this.citizen_name,
    this.citizen_contact,
    this.citizen_address,
    this.citizen_question,
    this.citizen_question_file,
    this.citizen_question_department,
    this.citizen_bpl,
    this.citizen_bpl_file,
    this.life_or_death,
    this.spio_in,
    this.spio_answer,
    this.spio_answer_file,
    this.spio_transfer_remark,
    this.spio_transfer_department,
    this.spio_out,
    this.spio_id,
    this.first_appeal_daa_in,
    this.first_appeal_citizen_question,
    this.first_appeal_citizen_question_file,
    this.first_appeal_daa_answer,
    this.first_appeal_daa_answer_file,
    this.first_appeal_daa_out,
    this.daa_id,
    this.second_appeal_cic_in,
    this.second_appeal_citizen_question,
    this.second_appeal_citizen_question_file,
    this.second_appeal_cic_answer,
    this.second_appeal_cic_answer_file,
    this.second_appeal_cic_out,
    this.my_file_proof,
    this.created_at,
    this.citizen_question_locall_council,
    this.local_council,
    this.department,
    this.paid_attachments,
  });

  MyRtiDetailsModel copyWith({
    int? id,
    String? citizen_name,
    String? citizen_contact,
    String? citizen_address,
    String? citizen_question,
    String? citizen_question_file,
    int? citizen_question_department,
    int? citizen_bpl,
    String? citizen_bpl_file,
    int? life_or_death,
    String? spio_in,
    String? spio_answer,
    String? spio_answer_file,
    String? spio_transfer_remark,
    String? spio_transfer_department,
    String? spio_out,
    String? spio_id,
    String? first_appeal_daa_in,
    String? first_appeal_citizen_question,
    String? first_appeal_citizen_question_file,
    String? first_appeal_daa_answer,
    String? first_appeal_daa_answer_file,
    String? first_appeal_daa_out,
    String? daa_id,
    String? second_appeal_cic_in,
    String? second_appeal_citizen_question,
    String? second_appeal_citizen_question_file,
    String? second_appeal_cic_answer,
    String? second_appeal_cic_answer_file,
    String? second_appeal_cic_out,
    String? my_file_proof,
    String? created_at,
    String? citizen_question_locall_council,
    String? local_council,
    DepartmentModel? department,
    PaidAttachmentModel? paid_attachments,
  }) {
    return MyRtiDetailsModel(
      id: id ?? this.id,
      citizen_name: citizen_name ?? this.citizen_name,
      citizen_contact: citizen_contact ?? this.citizen_contact,
      citizen_address: citizen_address ?? this.citizen_address,
      citizen_question: citizen_question ?? this.citizen_question,
      citizen_question_file:
          citizen_question_file ?? this.citizen_question_file,
      citizen_question_department:
          citizen_question_department ?? this.citizen_question_department,
      citizen_bpl: citizen_bpl ?? this.citizen_bpl,
      citizen_bpl_file: citizen_bpl_file ?? this.citizen_bpl_file,
      life_or_death: life_or_death ?? this.life_or_death,
      spio_in: spio_in ?? this.spio_in,
      spio_answer: spio_answer ?? this.spio_answer,
      spio_answer_file: spio_answer_file ?? this.spio_answer_file,
      spio_transfer_remark: spio_transfer_remark ?? this.spio_transfer_remark,
      spio_transfer_department:
          spio_transfer_department ?? this.spio_transfer_department,
      spio_out: spio_out ?? this.spio_out,
      spio_id: spio_id ?? this.spio_id,
      first_appeal_daa_in: first_appeal_daa_in ?? this.first_appeal_daa_in,
      first_appeal_citizen_question:
          first_appeal_citizen_question ?? this.first_appeal_citizen_question,
      first_appeal_citizen_question_file: first_appeal_citizen_question_file ??
          this.first_appeal_citizen_question_file,
      first_appeal_daa_answer:
          first_appeal_daa_answer ?? this.first_appeal_daa_answer,
      first_appeal_daa_answer_file:
          first_appeal_daa_answer_file ?? this.first_appeal_daa_answer_file,
      first_appeal_daa_out: first_appeal_daa_out ?? this.first_appeal_daa_out,
      daa_id: daa_id ?? this.daa_id,
      second_appeal_cic_in: second_appeal_cic_in ?? this.second_appeal_cic_in,
      second_appeal_citizen_question:
          second_appeal_citizen_question ?? this.second_appeal_citizen_question,
      second_appeal_citizen_question_file:
          second_appeal_citizen_question_file ??
              this.second_appeal_citizen_question_file,
      second_appeal_cic_answer:
          second_appeal_cic_answer ?? this.second_appeal_cic_answer,
      second_appeal_cic_answer_file:
          second_appeal_cic_answer_file ?? this.second_appeal_cic_answer_file,
      second_appeal_cic_out:
          second_appeal_cic_out ?? this.second_appeal_cic_out,
      my_file_proof: my_file_proof ?? this.my_file_proof,
      created_at: created_at ?? this.created_at,
      citizen_question_locall_council: citizen_question_locall_council ??
          this.citizen_question_locall_council,
      local_council: local_council ?? this.local_council,
      department: department ?? this.department,
      paid_attachments: paid_attachments ?? this.paid_attachments,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'citizen_name': citizen_name,
      'citizen_contact': citizen_contact,
      'citizen_address': citizen_address,
      'citizen_question': citizen_question,
      'citizen_question_file': citizen_question_file,
      'citizen_question_department': citizen_question_department,
      'citizen_bpl': citizen_bpl,
      'citizen_bpl_file': citizen_bpl_file,
      'life_or_death': life_or_death,
      'spio_in': spio_in,
      'spio_answer': spio_answer,
      'spio_answer_file': spio_answer_file,
      'spio_transfer_remark': spio_transfer_remark,
      'spio_transfer_department': spio_transfer_department,
      'spio_out': spio_out,
      'spio_id': spio_id,
      'first_appeal_daa_in': first_appeal_daa_in,
      'first_appeal_citizen_question': first_appeal_citizen_question,
      'first_appeal_citizen_question_file': first_appeal_citizen_question_file,
      'first_appeal_daa_answer': first_appeal_daa_answer,
      'first_appeal_daa_answer_file': first_appeal_daa_answer_file,
      'first_appeal_daa_out': first_appeal_daa_out,
      'daa_id': daa_id,
      'second_appeal_cic_in': second_appeal_cic_in,
      'second_appeal_citizen_question': second_appeal_citizen_question,
      'second_appeal_citizen_question_file':
          second_appeal_citizen_question_file,
      'second_appeal_cic_answer': second_appeal_cic_answer,
      'second_appeal_cic_answer_file': second_appeal_cic_answer_file,
      'second_appeal_cic_out': second_appeal_cic_out,
      'my_file_proof': my_file_proof,
      'created_at': created_at,
      'citizen_question_locall_council': citizen_question_locall_council,
      'local_council': local_council,
      'department': department?.toMap(),
      'paid_attachments': paid_attachments?.toMap(),
    };
  }

  factory MyRtiDetailsModel.fromMap(Map<String, dynamic> map) {
    return MyRtiDetailsModel(
      id: map['id']?.toInt(),
      citizen_name: map['citizen_name'],
      citizen_contact: map['citizen_contact'],
      citizen_address: map['citizen_address'],
      citizen_question: map['citizen_question'],
      citizen_question_file: map['citizen_question_file'],
      citizen_question_department: map['citizen_question_department']?.toInt(),
      citizen_bpl: map['citizen_bpl']?.toInt(),
      citizen_bpl_file: map['citizen_bpl_file'],
      life_or_death: map['life_or_death']?.toInt(),
      spio_in: map['spio_in'],
      spio_answer: map['spio_answer'],
      spio_answer_file: map['spio_answer_file'],
      spio_transfer_remark: map['spio_transfer_remark'],
      spio_transfer_department: map['spio_transfer_department'],
      spio_out: map['spio_out'],
      spio_id: map['spio_id'],
      first_appeal_daa_in: map['first_appeal_daa_in'],
      first_appeal_citizen_question: map['first_appeal_citizen_question'],
      first_appeal_citizen_question_file:
          map['first_appeal_citizen_question_file'],
      first_appeal_daa_answer: map['first_appeal_daa_answer'],
      first_appeal_daa_answer_file: map['first_appeal_daa_answer_file'],
      first_appeal_daa_out: map['first_appeal_daa_out'],
      daa_id: map['daa_id'],
      second_appeal_cic_in: map['second_appeal_cic_in'],
      second_appeal_citizen_question: map['second_appeal_citizen_question'],
      second_appeal_citizen_question_file:
          map['second_appeal_citizen_question_file'],
      second_appeal_cic_answer: map['second_appeal_cic_answer'],
      second_appeal_cic_answer_file: map['second_appeal_cic_answer_file'],
      second_appeal_cic_out: map['second_appeal_cic_out'],
      my_file_proof: map['my_file_proof'],
      created_at: map['created_at'],
      citizen_question_locall_council: map['citizen_question_locall_council'],
      local_council: map['local_council'],
      department: map['department'] != null
          ? DepartmentModel.fromMap(map['department'])
          : null,
      paid_attachments: map['paid_attachments'] != null
          ? PaidAttachmentModel.fromMap(map['paid_attachments'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MyRtiDetailsModel.fromJson(String source) =>
      MyRtiDetailsModel.fromMap(json.decode(source));
  static List<MyRtiDetailsModel> fromJsonList(List list) {
    return list.map((e) => MyRtiDetailsModel.fromMap(e)).toList();
  }

  @override
  String toString() {
    return 'MyRtiDetailsModel(id: $id, citizen_name: $citizen_name, citizen_contact: $citizen_contact, citizen_address: $citizen_address, citizen_question: $citizen_question, citizen_question_file: $citizen_question_file, citizen_question_department: $citizen_question_department, citizen_bpl: $citizen_bpl, citizen_bpl_file: $citizen_bpl_file, life_or_death: $life_or_death, spio_in: $spio_in, spio_answer: $spio_answer, spio_answer_file: $spio_answer_file, spio_transfer_remark: $spio_transfer_remark, spio_transfer_department: $spio_transfer_department, spio_out: $spio_out, spio_id: $spio_id, first_appeal_daa_in: $first_appeal_daa_in, first_appeal_citizen_question: $first_appeal_citizen_question, first_appeal_citizen_question_file: $first_appeal_citizen_question_file, first_appeal_daa_answer: $first_appeal_daa_answer, first_appeal_daa_answer_file: $first_appeal_daa_answer_file, first_appeal_daa_out: $first_appeal_daa_out, daa_id: $daa_id, second_appeal_cic_in: $second_appeal_cic_in, second_appeal_citizen_question: $second_appeal_citizen_question, second_appeal_citizen_question_file: $second_appeal_citizen_question_file, second_appeal_cic_answer: $second_appeal_cic_answer, second_appeal_cic_answer_file: $second_appeal_cic_answer_file, second_appeal_cic_out: $second_appeal_cic_out, my_file_proof: $my_file_proof, created_at: $created_at, citizen_question_locall_council: $citizen_question_locall_council, local_council: $local_council, department: $department, paid_attachments: $paid_attachments)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MyRtiDetailsModel &&
        other.id == id &&
        other.citizen_name == citizen_name &&
        other.citizen_contact == citizen_contact &&
        other.citizen_address == citizen_address &&
        other.citizen_question == citizen_question &&
        other.citizen_question_file == citizen_question_file &&
        other.citizen_question_department == citizen_question_department &&
        other.citizen_bpl == citizen_bpl &&
        other.citizen_bpl_file == citizen_bpl_file &&
        other.life_or_death == life_or_death &&
        other.spio_in == spio_in &&
        other.spio_answer == spio_answer &&
        other.spio_answer_file == spio_answer_file &&
        other.spio_transfer_remark == spio_transfer_remark &&
        other.spio_transfer_department == spio_transfer_department &&
        other.spio_out == spio_out &&
        other.spio_id == spio_id &&
        other.first_appeal_daa_in == first_appeal_daa_in &&
        other.first_appeal_citizen_question == first_appeal_citizen_question &&
        other.first_appeal_citizen_question_file ==
            first_appeal_citizen_question_file &&
        other.first_appeal_daa_answer == first_appeal_daa_answer &&
        other.first_appeal_daa_answer_file == first_appeal_daa_answer_file &&
        other.first_appeal_daa_out == first_appeal_daa_out &&
        other.daa_id == daa_id &&
        other.second_appeal_cic_in == second_appeal_cic_in &&
        other.second_appeal_citizen_question ==
            second_appeal_citizen_question &&
        other.second_appeal_citizen_question_file ==
            second_appeal_citizen_question_file &&
        other.second_appeal_cic_answer == second_appeal_cic_answer &&
        other.second_appeal_cic_answer_file == second_appeal_cic_answer_file &&
        other.second_appeal_cic_out == second_appeal_cic_out &&
        other.my_file_proof == my_file_proof &&
        other.created_at == created_at &&
        other.citizen_question_locall_council ==
            citizen_question_locall_council &&
        other.local_council == local_council &&
        other.department == department &&
        other.paid_attachments == paid_attachments;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        citizen_name.hashCode ^
        citizen_contact.hashCode ^
        citizen_address.hashCode ^
        citizen_question.hashCode ^
        citizen_question_file.hashCode ^
        citizen_question_department.hashCode ^
        citizen_bpl.hashCode ^
        citizen_bpl_file.hashCode ^
        life_or_death.hashCode ^
        spio_in.hashCode ^
        spio_answer.hashCode ^
        spio_answer_file.hashCode ^
        spio_transfer_remark.hashCode ^
        spio_transfer_department.hashCode ^
        spio_out.hashCode ^
        spio_id.hashCode ^
        first_appeal_daa_in.hashCode ^
        first_appeal_citizen_question.hashCode ^
        first_appeal_citizen_question_file.hashCode ^
        first_appeal_daa_answer.hashCode ^
        first_appeal_daa_answer_file.hashCode ^
        first_appeal_daa_out.hashCode ^
        daa_id.hashCode ^
        second_appeal_cic_in.hashCode ^
        second_appeal_citizen_question.hashCode ^
        second_appeal_citizen_question_file.hashCode ^
        second_appeal_cic_answer.hashCode ^
        second_appeal_cic_answer_file.hashCode ^
        second_appeal_cic_out.hashCode ^
        my_file_proof.hashCode ^
        created_at.hashCode ^
        citizen_question_locall_council.hashCode ^
        local_council.hashCode ^
        department.hashCode ^
        paid_attachments.hashCode;
  }
}
