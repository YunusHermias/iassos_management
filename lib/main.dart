import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iassos_management/models/participant.dart';
import 'package:iassos_management/screens/home/home_page.dart';
import 'package:iassos_management/screens/login/login_page.dart';
import 'package:iassos_management/screens/participant/participant_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const ProviderScope(child: IassosManagement()));
}

class IassosManagement extends StatelessWidget {
  const IassosManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Iassos Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: navigatorKey,
      initialRoute: '/participants',
      routes: {
        '/': (context) => const LoginPage(),
        '/participants': (context) => ParticipantPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
