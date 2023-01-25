import 'package:iassos_management/models/paid.dart';

class Unpay {
  String? date;
  double? total;
  double? discount;
  double? remainingAmount;
  List<Paid?>? unpaid;

  Unpay(
      {this.date,
      this.total,
      this.discount,
      this.remainingAmount,
      this.unpaid});

  Unpay.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    total = json['total'];
    discount = json['discount'];
    remainingAmount = json['remaining_amount'];
    if (json['unpaid'] != null) {
      unpaid = <Paid>[];
      json['unpaid'].forEach((v) {
        unpaid!.add(Paid.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['total'] = total;
    data['discount'] = discount;
    data['remaining_amount'] = remainingAmount;
    data['unpaid'] =
        unpaid != null ? unpaid!.map((v) => v?.toJson()).toList() : null;
    return data;
  }
}
