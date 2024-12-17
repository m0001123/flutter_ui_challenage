import 'package:flutter/material.dart';

class CustomerTextfield extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscure;
  const CustomerTextfield({
    super.key,
    required this.hintText,
    required this.controller,
    required this.obscure,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(8)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(8)),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hintText,
        ),
        obscureText: obscure,
      ),
    );
  }
}
