import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:user_authenticaton/firebase_options.dart';
import 'package:user_authenticaton/login_screen.dart';
import 'package:user_authenticaton/services/firebase_auth_methods.dart';
// import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
        // MultiProvider(
        //   providers: [
        //     Provider<FirebaseAuthMethods>(
        //       create: (_) => FirebaseAuthMethods(FirebaseAuth.instance),
        //     ),
        //     StreamProvider(
        //       create: (context) => context.read<FirebaseAuthMethods>().authState,
        //       initialData: null,
        //     ),
        //   ],
        //   child:
        const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      // home: PhoneSignInPage(),
      // ),
    );
  }
}
