// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:rti_new_apps/models/department_model.dart';
import 'package:rti_new_apps/models/local_council_model.dart';
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
  DepartmentModel? department;
  LocalCouncilModel? local_council;
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
    this.department,
    this.local_council,
    this.paid_attachments,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
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
      'department': department?.toMap(),
      'local_council': local_council?.toMap(),
      'paid_attachments': paid_attachments?.toMap(),
    };
  }

  factory MyRtiDetailsModel.fromMap(Map<String, dynamic> map) {
    return MyRtiDetailsModel(
      id: map['id'] != null ? map['id'] as int : null,
      citizen_name:
          map['citizen_name'] != null ? map['citizen_name'] as String : null,
      citizen_contact: map['citizen_contact'] != null
          ? map['citizen_contact'] as String
          : null,
      citizen_address: map['citizen_address'] != null
          ? map['citizen_address'] as String
          : null,
      citizen_question: map['citizen_question'] != null
          ? map['citizen_question'] as String
          : null,
      citizen_question_file: map['citizen_question_file'] != null
          ? map['citizen_question_file'] as String
          : null,
      citizen_question_department: map['citizen_question_department'] != null
          ? map['citizen_question_department'] as int
          : null,
      citizen_bpl:
          map['citizen_bpl'] != null ? map['citizen_bpl'] as int : null,
      citizen_bpl_file: map['citizen_bpl_file'] != null
          ? map['citizen_bpl_file'] as String
          : null,
      life_or_death:
          map['life_or_death'] != null ? map['life_or_death'] as int : null,
      spio_in: map['spio_in'] != null ? map['spio_in'] as String : null,
      spio_answer:
          map['spio_answer'] != null ? map['spio_answer'] as String : null,
      spio_answer_file: map['spio_answer_file'] != null
          ? map['spio_answer_file'] as String
          : null,
      spio_transfer_remark: map['spio_transfer_remark'] != null
          ? map['spio_transfer_remark'] as String
          : null,
      spio_transfer_department: map['spio_transfer_department'] != null
          ? map['spio_transfer_department'] as String
          : null,
      spio_out: map['spio_out'] != null ? map['spio_out'] as String : null,
      spio_id: map['spio_id'] != null ? map['spio_id'] as String : null,
      first_appeal_daa_in: map['first_appeal_daa_in'] != null
          ? map['first_appeal_daa_in'] as String
          : null,
      first_appeal_citizen_question:
          map['first_appeal_citizen_question'] != null
              ? map['first_appeal_citizen_question'] as String
              : null,
      first_appeal_citizen_question_file:
          map['first_appeal_citizen_question_file'] != null
              ? map['first_appeal_citizen_question_file'] as String
              : null,
      first_appeal_daa_answer: map['first_appeal_daa_answer'] != null
          ? map['first_appeal_daa_answer'] as String
          : null,
      first_appeal_daa_answer_file: map['first_appeal_daa_answer_file'] != null
          ? map['first_appeal_daa_answer_file'] as String
          : null,
      first_appeal_daa_out: map['first_appeal_daa_out'] != null
          ? map['first_appeal_daa_out'] as String
          : null,
      daa_id: map['daa_id'] != null ? map['daa_id'] as String : null,
      second_appeal_cic_in: map['second_appeal_cic_in'] != null
          ? map['second_appeal_cic_in'] as String
          : null,
      second_appeal_citizen_question:
          map['second_appeal_citizen_question'] != null
              ? map['second_appeal_citizen_question'] as String
              : null,
      second_appeal_citizen_question_file:
          map['second_appeal_citizen_question_file'] != null
              ? map['second_appeal_citizen_question_file'] as String
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
      my_file_proof:
          map['my_file_proof'] != null ? map['my_file_proof'] as String : null,
      created_at:
          map['created_at'] != null ? map['created_at'] as String : null,
      department: map['department'] != null
          ? DepartmentModel.fromMap(map['department'] as Map<String, dynamic>)
          : null,
      local_council: map['local_council'] != null
          ? LocalCouncilModel.fromMap(
              map['local_council'] as Map<String, dynamic>)
          : null,
      paid_attachments: map['paid_attachments'] != null
          ? PaidAttachmentModel.fromMap(
              map['paid_attachments'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MyRtiDetailsModel.fromJson(String source) =>
      MyRtiDetailsModel.fromMap(json.decode(source) as Map<String, dynamic>);
  static List<MyRtiDetailsModel> fromJsonList(List list) {
    return list.map((e) => MyRtiDetailsModel.fromMap(e)).toList();
  }
}
