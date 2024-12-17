import 'package:flutter/material.dart';
import 'package:login_ui_challenge1/components/customer_button.dart';
import 'package:login_ui_challenge1/components/customer_textfield.dart';
import 'package:login_ui_challenge1/page/register_page.dart';
import 'package:login_ui_challenge1/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void emailSignIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });
    var result = await AuthService()
        .emailSignIn(emailController.text, passwordController.text);
    if (!mounted) return;
    Navigator.pop(context);
    if (result != 'success' && result != 'cancel signIn') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(result!),
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
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),

              //logo
              Image.asset(
                'assets/images/cat.png',
                width: 100,
                height: 100,
              ),
              const SizedBox(
                height: 50,
              ),

              //welcome
              Text(
                '歡迎回來，很高興遇見你',
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

              //forgot password
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '忘記密碼?',
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 25,
              ),

              //login button
              CustomerButton(
                text: '登入',
                ontap: emailSignIn,
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
              //register
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('還沒有帳號嗎?'),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage()));
                    },
                    child: const Text(
                      '點選註冊',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
