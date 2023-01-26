import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iassos_management/screens/login/login_controller.dart';

final loginProvider = ChangeNotifierProvider<LoginController>(
  (ref) {
    return LoginController();
  },
);
