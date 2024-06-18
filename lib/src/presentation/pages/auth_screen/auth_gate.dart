
import 'package:blogbox/src/presentation/pages/auth_screen/login_or_register.dart';
import 'package:blogbox/src/presentation/pages/splash/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          /// if user is logged in
          if (snapshot.hasData) {
            //return const MyHomePage(title: 'Journalize',);
            return const SplashScreen();
          }
          /// if user is not logged in
          else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}