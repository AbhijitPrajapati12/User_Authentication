import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:user_authenticaton/pages/login_page.dart';
import 'package:user_authenticaton/pages/phonesignIn_page.dart';
import 'package:user_authenticaton/pages/signup_page.dart';
import 'package:user_authenticaton/services/firebase_auth_methods.dart';
import 'package:user_authenticaton/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                title: 'Email/Password Sign Up',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const SignUpPage();
                      },
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              CustomButton(
                title: 'Email/Password Login',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const LoginPage();
                      },
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              CustomButton(
                title: 'Phone Sign In',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const PhoneSignInPage();
                      },
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              CustomButton(
                title: 'Google Sign In',
                onTap: () {
                  context.read<FirebaseAuthMethods>().signInWithGoogle(context);

                  // FirebaseAuthMethods(FirebaseAuth.instance)
                  //     .signInWithGoogle(context);
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) {
                  //       return const GoogleSigninPage();
                  //     },
                  //   ),
                  // );
                },
              ),
              const SizedBox(height: 10),
              CustomButton(
                title: 'Facebook Sign In',
                onTap: () {},
              ),
              const SizedBox(height: 10),
              CustomButton(
                title: 'Anonymous Sign In',
                onTap: () {
                  context
                      .read<FirebaseAuthMethods>()
                      .signInAnonymously(context);

                  // FirebaseAuthMethods(FirebaseAuth.instance)
                  //     .signInAnonymously(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
