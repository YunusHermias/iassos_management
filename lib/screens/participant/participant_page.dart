import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iassos_management/config/db/connection.dart';
import 'package:iassos_management/config/db/connection_pool.dart';
import 'package:iassos_management/models/paid.dart';
import 'package:iassos_management/models/participant.dart';
import 'package:iassos_management/models/pay.dart';
import 'package:iassos_management/models/payment.dart';
import 'package:iassos_management/models/social_media.dart';
import 'package:iassos_management/models/unpay.dart';

class ParticipantPage extends ConsumerWidget {
  const ParticipantPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
        child: Column(
      children: [
        Text("ParticipantPage"),
        TextButton(
          onPressed: () async {
            HermiasConnection connection =
                await HermiasConnectionPool.connectionPoolInstance.getConnection().catchError((e) => print("$e"));
            connection.isBusy = true;
            Participant user = Participant();
            user.email = 'abc@gmail.com';
            user.group = "Marmaris Grup";
            user.level = "Giris Seviye";
            user.amountToBePaidIncMonths = 400.0;
            user.classDayOfTheWeek = 2;
            user.mobile = "+90 555 679 13 78 ";
            user.name = "Ali Veli Konya";
            Payment payment = Payment(
              pay: Pay(
                  discount: 50.0,
                  remainingAmount: 200.0,
                  total: 400.0,
                  date: DateTime.now().subtract(const Duration(days: 30)).toString(),
                  paid: List.generate(2, (index) {
                    return Paid(payDate: DateTime.now().toString(), amount: 50.0 * index);
                  })),
              unPay: Unpay(
                  total: 200.0,
                  date: DateTime.now().subtract(const Duration(days: 30)).toString(),
                  discount: 50.0,
                  remainingAmount: 200.0,
                  unpaid: List.generate(1, (index) => Paid(amount: 200.0))),
            );
            user.payments = [payment];
            user.status = 1;
            user.socialMedias = [SocialMedia(link: "www.google.com.tr", name: "Sergey", title: "Google+")];
            var userCollection = connection.dbConnection.collection("participant");
            userCollection.insert(user.toJson());
            connection.isBusy = false;
          },
          child: const Text(
            "Check connection",
          ),
        )
      ],
    ));
  }
}
