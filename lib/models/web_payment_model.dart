// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class WebPaymentModel {
  int? id;
  String? tracking_id;
  String? order_id;
  String? order_status;
  String? payment_mode;
  String? amount;
  String? created_at;

  WebPaymentModel({
    this.id,
    this.tracking_id,
    this.order_id,
    this.order_status,
    this.payment_mode,
    this.amount,
    this.created_at,
  });

  WebPaymentModel copyWith({
    int? id,
    String? tracking_id,
    String? order_id,
    String? order_status,
    String? payment_mode,
    String? amount,
    String? created_at,
  }) {
    return WebPaymentModel(
      id: id ?? this.id,
      tracking_id: tracking_id ?? this.tracking_id,
      order_id: order_id ?? this.order_id,
      order_status: order_status ?? this.order_status,
      payment_mode: payment_mode ?? this.payment_mode,
      amount: amount ?? this.amount,
      created_at: created_at ?? this.created_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'tracking_id': tracking_id,
      'order_id': order_id,
      'order_status': order_status,
      'payment_mode': payment_mode,
      'amount': amount,
      'created_at': created_at,
    };
  }

  factory WebPaymentModel.fromMap(Map<String, dynamic> map) {
    return WebPaymentModel(
      id: map['id'] != null ? map['id'] as int : null,
      tracking_id:
          map['tracking_id'] != null ? map['tracking_id'] as String : null,
      order_id: map['order_id'] != null ? map['order_id'] as String : null,
      order_status:
          map['order_status'] != null ? map['order_status'] as String : null,
      payment_mode:
          map['payment_mode'] != null ? map['payment_mode'] as String : null,
      amount: map['amount'] != null ? map['amount'] as String : null,
      created_at:
          map['created_at'] != null ? map['created_at'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory WebPaymentModel.fromJson(String source) =>
      WebPaymentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  static List<WebPaymentModel> fromJsonList(List list) {
    return list.map((e) => WebPaymentModel.fromMap(e)).toList();
  }

  @override
  String toString() {
    return 'WebPaymentModel(id: $id, tracking_id: $tracking_id, order_id: $order_id, order_status: $order_status, payment_mode: $payment_mode, amount: $amount, created_at: $created_at)';
  }

  @override
  bool operator ==(covariant WebPaymentModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.tracking_id == tracking_id &&
        other.order_id == order_id &&
        other.order_status == order_status &&
        other.payment_mode == payment_mode &&
        other.amount == amount &&
        other.created_at == created_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        tracking_id.hashCode ^
        order_id.hashCode ^
        order_status.hashCode ^
        payment_mode.hashCode ^
        amount.hashCode ^
        created_at.hashCode;
  }
}
