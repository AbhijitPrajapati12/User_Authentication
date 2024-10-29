import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:user_authenticaton/services/firebase_auth_methods.dart';
import 'package:user_authenticaton/widgets/custom_button.dart';
import 'package:user_authenticaton/widgets/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void loginUser() {
    FirebaseAuthMethods(FirebaseAuth.instance).loginWithEmail(
      email: emailController.text,
      password: passwordController.text,
      context: context,
    );
  }

  @override
  void dispose() {
    //use to dispose all the data so that there is no memory leak
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            CustomTextfield(
                controller: emailController, hintText: 'Enter your email'),
            CustomTextfield(
                controller: passwordController,
                hintText: 'Enter your password'),
            const SizedBox(
              height: 40,
            ),
            CustomButton(title: 'Login', onTap: loginUser),
          ],
        ),
      ),
    );
  }
}
