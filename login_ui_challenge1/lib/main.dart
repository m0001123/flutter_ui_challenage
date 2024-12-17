import 'package:flutter/material.dart';
import 'package:login_ui_challenge1/page/home_page.dart';
import 'package:login_ui_challenge1/page/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login_ui_challenge1/services/auth_service.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
            stream: AuthService().authStatus,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const HomePage();
              } else {
                return const LoginPage();
              }
            }));
  }
}
