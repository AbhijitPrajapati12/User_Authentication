import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_authenticaton/services/firebase_auth_methods.dart';
import 'package:user_authenticaton/widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.read<FirebaseAuthMethods>().user;
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (!user.isAnonymous && user.phoneNumber == null) Text(user.email!),
        if (!user.isAnonymous && user.phoneNumber == null)
          Text(user.providerData[0].providerId),
        if (user.phoneNumber != null) Text(user.phoneNumber!),
        Text(user.uid),
        if (!user.emailVerified && user.isAnonymous)
          CustomButton(
            onTap: () {
              context
                  .read<FirebaseAuthMethods>()
                  .sendEmailVerification(context);
            },
            title: 'Verify Email',
          ),
        CustomButton(
          title: 'Sign Out',
          onTap: () {
            context.read<FirebaseAuthMethods>().signOut(context);
          },
        ),
        CustomButton(
          title: 'Delete Account',
          onTap: () {
            context.read<FirebaseAuthMethods>().deleteAccount(context);
          },
        ),
      ],
    ));
  }
}
