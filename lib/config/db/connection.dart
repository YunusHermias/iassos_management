import 'package:mongo_dart/mongo_dart.dart';

class HermiasConnection {
  Db dbConnection;
  bool isBusy;

  HermiasConnection(this.dbConnection, this.isBusy);
}
