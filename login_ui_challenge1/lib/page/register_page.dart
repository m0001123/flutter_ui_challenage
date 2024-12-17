import 'package:flutter/material.dart';
import 'package:login_ui_challenge1/components/customer_button.dart';
import 'package:login_ui_challenge1/components/customer_textfield.dart';

import 'package:login_ui_challenge1/services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();

  void register() async {
    if (passwordController.text == repasswordController.text) {
      showDialog(
          context: context,
          builder: (context) {
            return const Center(child: CircularProgressIndicator());
          });
      var result = await AuthService()
          .register(emailController.text, passwordController.text);
      Navigator.pop(context);
      if (result == 'success') {
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(result!),
        ));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('密碼必須相同'),
      ));
    }
  }

  void googleSignIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });
    var result = await AuthService().googleSignIn();
    if (!mounted) return;
    Navigator.pop(context);
    if (result != 'success' && result != 'cancel signIn') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(result!),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),

              //logo
              Image.asset(
                'assets/images/cat.png',
                width: 100,
                height: 100,
              ),
              const SizedBox(
                height: 25,
              ),

              //welcome
              Text(
                '初次見面，很高興認識你',
                style: TextStyle(color: Colors.grey[700], fontSize: 16),
              ),
              const SizedBox(
                height: 25,
              ),

              //emial Textfield
              CustomerTextfield(
                controller: emailController,
                hintText: '請輸入電子信箱',
                obscure: false,
              ),
              const SizedBox(
                height: 25,
              ),

              //password Textfield
              CustomerTextfield(
                controller: passwordController,
                hintText: '請輸入密碼',
                obscure: true,
              ),

              const SizedBox(
                height: 25,
              ),

              //re-password Textfield
              CustomerTextfield(
                controller: repasswordController,
                hintText: '再次輸入密碼',
                obscure: true,
              ),

              const SizedBox(
                height: 25,
              ),

              //login button
              CustomerButton(
                text: '註冊',
                ontap: register,
              ),
              const SizedBox(
                height: 50,
              ),
              //divider
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey[500],
                        height: 2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        '或者',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey[500],
                        height: 2,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              //social medial log in
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: googleSignIn,
                    child: Image.asset(
                      'assets/images/google.png',
                      height: 50,
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Image.asset(
                    'assets/images/apple.png',
                    height: 50,
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
