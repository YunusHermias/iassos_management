import 'package:flutter/material.dart';
import 'package:iassos_management/config/db/connection.dart';
import 'package:iassos_management/config/db/connection_pool.dart';
import 'package:iassos_management/models/user.dart';
import 'package:mongo_dart/mongo_dart.dart';

class LoginController extends ChangeNotifier {
  bool isLoginInProgress = false;

  void changeLoginProgressStatus(bool value) {
    isLoginInProgress = value;
    notifyListeners();
  }

  Future<bool> login(String username, String password) async {
    HermiasConnection connection =
        await HermiasConnectionPool.connectionPoolInstance.getConnection();
    connection.isBusy = true;
    DbCollection userCollection = connection.dbConnection.collection("user");
    int isUserExists = await userCollection
        .find({"username": username, "password": password}).length;
    connection.isBusy = false;
    return isUserExists > 0;
  }
}
