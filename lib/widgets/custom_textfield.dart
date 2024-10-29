import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const CustomTextfield({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        strokeAlign: BorderSide.strokeAlignCenter,
        width: 0,
        color: Color.fromARGB(255, 240, 243, 243),
      ),
      borderRadius: BorderRadius.all(Radius.circular(15)),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromARGB(255, 240, 243, 243),
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 17),
          border: border,
          focusedBorder: border,
          enabledBorder: border,
        ),
      ),
    );
  }
}
