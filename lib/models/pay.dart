import 'package:iassos_management/models/paid.dart';

class Pay {
  String? date;
  double? total;
  double? discount;
  double? remainingAmount;
  List<Paid>? paid;

  Pay({this.date, this.total, this.discount, this.remainingAmount, this.paid});

  Pay.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    total = json['total'];
    discount = json['discount'];
    remainingAmount = json['remaining_amount'];
    if (json['paid'] != null) {
      paid = <Paid>[];
      json['paid'].forEach((v) {
        paid!.add(Paid.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['total'] = total;
    data['discount'] = discount;
    data['remaining_amount'] = remainingAmount;
    data['paid'] = paid != null ? paid!.map((v) => v?.toJson()).toList() : null;
    return data;
  }
}
