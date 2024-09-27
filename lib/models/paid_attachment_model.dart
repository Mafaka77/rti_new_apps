import 'dart:convert';

class PaidAttachmentModel {
  int? id;
  int? information_id;
  String? attachment_name;
  String? payment_status;
  PaidAttachmentModel({
    this.id,
    this.information_id,
    this.attachment_name,
    this.payment_status,
  });

  PaidAttachmentModel copyWith({
    int? id,
    int? information_id,
    String? attachment_name,
    String? payment_status,
  }) {
    return PaidAttachmentModel(
      id: id ?? this.id,
      information_id: information_id ?? this.information_id,
      attachment_name: attachment_name ?? this.attachment_name,
      payment_status: payment_status ?? this.payment_status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'information_id': information_id,
      'attachment_name': attachment_name,
      'payment_status': payment_status,
    };
  }

  factory PaidAttachmentModel.fromMap(Map<String, dynamic> map) {
    return PaidAttachmentModel(
      id: map['id']?.toInt(),
      information_id: map['information_id']?.toInt(),
      attachment_name: map['attachment_name'],
      payment_status: map['payment_status'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PaidAttachmentModel.fromJson(String source) =>
      PaidAttachmentModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PaidAttachmentModel(id: $id, information_id: $information_id, attachment_name: $attachment_name, payment_status: $payment_status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PaidAttachmentModel &&
        other.id == id &&
        other.information_id == information_id &&
        other.attachment_name == attachment_name &&
        other.payment_status == payment_status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        information_id.hashCode ^
        attachment_name.hashCode ^
        payment_status.hashCode;
  }
}
