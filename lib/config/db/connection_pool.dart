import 'dart:async';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:iassos_management/config/db/connection.dart';
import 'package:mongo_dart/mongo_dart.dart';

class HermiasConnectionPool {
  static final HermiasConnectionPool connectionPoolInstance =
      HermiasConnectionPool();
  final List<HermiasConnection> _connections = [];
  final int _poolSize = 5;
  final int _timeout = 5000;

  Future<HermiasConnection> getConnection() async {
    for (int i = 0; i < _connections.length; i++) {
      if (!_connections[i].isBusy &&
          _connections[i].dbConnection.state == State.open) {
        return _connections[i];
      }
    }
    if (_connections.length < _poolSize) {
      String? connectionString = dotenv.env['DB_CONNECTION_STRING'];
      if (connectionString == null) {
        return Future.error("Can't read .env variable");
      }
      late HermiasConnection connection;
      try {
        var dbConnection = await Db.create(connectionString)
            .timeout(Duration(milliseconds: _timeout));
        await dbConnection.open();
        connection = HermiasConnection(dbConnection, false);
        _connections.add(connection);
        return connection;
      } on TimeoutException catch (e) {
        return Future.error('Timeout while connecting to MongoDB: $e');
      } on MongoDartError catch (e) {
        return Future.error('Error while connecting to MongoDB: $e');
      }
    }
    return Future.error('No connections available in the pool');
  }

  void releaseConnection(HermiasConnection connection) {
    connection.dbConnection.close();
    _connections.remove(connection);
  }
}
