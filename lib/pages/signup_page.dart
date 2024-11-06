import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_authenticaton/services/firebase_auth_methods.dart';
import 'package:user_authenticaton/widgets/custom_button.dart';
import 'package:user_authenticaton/widgets/custom_textfield.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    //use to dispose all the data so that there is no memory leak
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void signUpUser() async {
    context.read<FirebaseAuthMethods>().signUpWithEmail(
        email: emailController.text,
        password: passwordController.text,
        context: context);

    // FirebaseAuthMethods(FirebaseAuth.instance).signUpWithEmail(
    //   email: emailController.text,
    //   password: passwordController.text,
    //   context: context,
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Sign Up',
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
            CustomButton(title: 'Sign Up', onTap: signUpUser),
          ],
        ),
      ),
    );
  }
}
