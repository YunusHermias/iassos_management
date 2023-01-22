import 'package:flutter/material.dart';
import 'package:iassos_management/config/db/connection.dart';
import 'package:iassos_management/config/db/connection_pool.dart';
import 'package:mongo_dart/mongo_dart.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () async {
            HermiasConnection connection = await HermiasConnectionPool
                .connectionPoolInstance
                .getConnection()
                .catchError((e) => print("$e"));
            connection.isBusy = true;
            var userCollection = connection.dbConnection.collection("users");
            var cursor = userCollection.find();
            await for (var document in cursor) {
              print("Username: ${document["username"]}");
              print("Name: ${document["name"]}");
            }
            connection.isBusy = false;
          },
          child: const Text(
            "Check connection",
          ),
        )
      ],
    );
  }
}
