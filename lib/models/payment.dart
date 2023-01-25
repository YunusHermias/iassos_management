import 'package:iassos_management/models/pay.dart';
import 'package:iassos_management/models/unpay.dart';

class Payment {
  Pay? pay;
  Unpay? unPay;

  Payment({this.pay, this.unPay});

  Payment.fromJson(Map<String, dynamic> json) {
    pay = json['pay'] != null ? Pay?.fromJson(json['pay']) : null;
    unPay = json['unpay'] != null ? Unpay?.fromJson(json['unpay']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pay'] = pay!.toJson();
    data['unpay'] = unPay!.toJson();
    return data;
  }
}
