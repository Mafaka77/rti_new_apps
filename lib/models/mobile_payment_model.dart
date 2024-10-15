// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MobilePaymentModel {
  int? id;
  String? transactionId;
  String? orderId;
  String? currency;
  String? status;
  String? amount;
  String? created_at;
  String? source;
  String? failure_reason;
  MobilePaymentModel({
    this.id,
    this.transactionId,
    this.orderId,
    this.currency,
    this.status,
    this.amount,
    this.created_at,
    this.source,
    this.failure_reason,
  });

  MobilePaymentModel copyWith({
    int? id,
    String? transactionId,
    String? orderId,
    String? currency,
    String? status,
    String? amount,
    String? created_at,
    String? source,
    String? failure_reason,
  }) {
    return MobilePaymentModel(
      id: id ?? this.id,
      transactionId: transactionId ?? this.transactionId,
      orderId: orderId ?? this.orderId,
      currency: currency ?? this.currency,
      status: status ?? this.status,
      amount: amount ?? this.amount,
      created_at: created_at ?? this.created_at,
      source: source ?? this.source,
      failure_reason: failure_reason ?? this.failure_reason,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'transactionId': transactionId,
      'orderId': orderId,
      'currency': currency,
      'status': status,
      'amount': amount,
      'created_at': created_at,
      'source': source,
      'failure_reason': failure_reason,
    };
  }

  factory MobilePaymentModel.fromMap(Map<String, dynamic> map) {
    return MobilePaymentModel(
      id: map['id'] != null ? map['id'] as int : null,
      transactionId:
          map['transactionId'] != null ? map['transactionId'] as String : null,
      orderId: map['orderId'] != null ? map['orderId'] as String : null,
      currency: map['currency'] != null ? map['currency'] as String : null,
      status: map['status'] != null ? map['status'] as String : null,
      amount: map['amount'] != null ? map['amount'] as String : null,
      created_at:
          map['created_at'] != null ? map['created_at'] as String : null,
      source: map['source'] != null ? map['source'] as String : null,
      failure_reason: map['failure_reason'] != null
          ? map['failure_reason'] as String
          : null,
    );
  }
  static List<MobilePaymentModel> fromJsonList(List list) {
    return list.map((e) => MobilePaymentModel.fromMap(e)).toList();
  }

  String toJson() => json.encode(toMap());

  factory MobilePaymentModel.fromJson(String source) =>
      MobilePaymentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
