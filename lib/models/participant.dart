import 'package:iassos_management/models/payment.dart';
import 'package:iassos_management/models/social_media.dart';

class Participant {
  String? name;
  String? mobile;
  String? email;
  int? status;
  String? group;
  String? level;
  List<SocialMedia?>? socialMedias;
  double? amountToBePaidIncMonths;
  int? classDayOfTheWeek;
  List<Payment?>? payments;

  Participant(
      {this.name,
      this.mobile,
      this.email,
      this.status,
      this.group,
      this.level,
      this.socialMedias,
      this.amountToBePaidIncMonths,
      this.classDayOfTheWeek,
      this.payments});

  Participant.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    status = json['status'];
    group = json['group'];
    level = json['level'];
    if (json['social_medias'] != null) {
      socialMedias = <SocialMedia>[];
      json['social_medias'].forEach((v) {
        socialMedias!.add(SocialMedia.fromJson(v));
      });
    }
    amountToBePaidIncMonths = json['amount_to_be_paid_inc_months'];
    classDayOfTheWeek = json['class_day_of_the_week'];
    if (json['payments'] != null) {
      payments = <Payment>[];
      json['payments'].forEach((v) {
        payments!.add(Payment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['mobile'] = mobile;
    data['email'] = email;
    data['status'] = status;
    data['group'] = group;
    data['level'] = level;
    data['social_medias'] = socialMedias != null
        ? socialMedias!.map((v) => v?.toJson()).toList()
        : null;
    data['amount_to_be_paid_inc_months'] = amountToBePaidIncMonths;
    data['class_day_of_the_week'] = classDayOfTheWeek;
    data['payments'] =
        payments != null ? payments!.map((v) => v?.toJson()).toList() : null;
    return data;
  }
}
