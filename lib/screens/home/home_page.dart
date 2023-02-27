import 'package:flutter/material.dart';
import 'package:iassos_management/config/db/connection.dart';
import 'package:iassos_management/config/db/connection_pool.dart';
import 'package:iassos_management/main.dart';
import 'package:iassos_management/models/paid.dart';
import 'package:iassos_management/models/pay.dart';
import 'package:iassos_management/models/payment.dart';
import 'package:iassos_management/models/social_media.dart';
import 'package:iassos_management/models/unpay.dart';
import 'package:iassos_management/models/participant.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              navigatorKey.currentState?.pushNamed("/participants");
            },
            child: const Text("Add Paricipant"))
      ],
    );
  }
}
