import 'package:fashion_shop_challenge/controllers/base_controller.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
                onTap: () {
                  BaseController.to.toggleTheme();
                },
                child: const Icon(Icons.settings_outlined)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              '登入您的帳戶',
              style: TextStyle(
                  fontSize: 16, color: Theme.of(context).colorScheme.onSurface),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              cursorColor: Colors.white,
              decoration: InputDecoration(
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  label: const Text('電子郵件'),
                  labelStyle: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary)),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              cursorColor: Colors.white,
              decoration: InputDecoration(
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  label: const Text('密碼'),
                  labelStyle: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary)),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).colorScheme.onSurface)),
              child: const Center(
                child: Text('登入'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '忘記密碼？',
              style: TextStyle(
                  fontSize: 14, color: Theme.of(context).colorScheme.onSurface),
            ),
            const SizedBox(
              height: 80,
            ),
            Text(
              '還不是會員嗎？',
              style: TextStyle(
                  fontSize: 14, color: Theme.of(context).colorScheme.onSurface),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).colorScheme.onSurface)),
              child: const Center(
                child: Text('註冊'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
