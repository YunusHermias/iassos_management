class Paid {
  String? payDate;
  double? amount;

  Paid({this.payDate, this.amount});

  Paid.fromJson(Map<String, dynamic> json) {
    payDate = json['pay_date'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pay_date'] = payDate;
    data['amount'] = amount;
    return data;
  }
}
