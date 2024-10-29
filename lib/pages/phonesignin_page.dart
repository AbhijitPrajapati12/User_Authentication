import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:user_authenticaton/services/firebase_auth_methods.dart';
import 'package:user_authenticaton/widgets/custom_button.dart';
import 'package:user_authenticaton/widgets/custom_textfield.dart';

class PhoneSignInPage extends StatefulWidget {
  const PhoneSignInPage({super.key});

  @override
  State<PhoneSignInPage> createState() => _PhoneSignInPageState();
}

class _PhoneSignInPageState extends State<PhoneSignInPage> {
  TextEditingController phoneController = TextEditingController();

  void phoneSignin() {
    FirebaseAuthMethods(FirebaseAuth.instance)
        .phoneSignin(context, phoneController.text);
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextfield(
              controller: phoneController, hintText: 'Enter Phone Number'),
          CustomButton(title: "Send OTP", onTap: phoneSignin),
        ],
      ),
    );
  }
}
