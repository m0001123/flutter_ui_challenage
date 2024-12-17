import 'package:flutter/material.dart';
import 'package:login_ui_challenge1/services/auth_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('歡迎${AuthService().currentUser!.email!}'),
              const SizedBox(
                height: 25,
              ),
              IconButton(
                  onPressed: () {
                    AuthService().signOut();
                  },
                  icon: const Icon(Icons.logout))
            ],
          ),
        ),
      ),
    );
  }
}
