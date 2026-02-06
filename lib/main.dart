import 'package:flutter/material.dart';
import 'package:macapps/screen/onboarding/emailVerificationScreen.dart';
import 'package:macapps/screen/onboarding/loginScreen.dart';
import 'package:macapps/screen/onboarding/pinVerificationScreen.dart';
import 'package:macapps/screen/onboarding/registrationScreen.dart';
import 'package:macapps/screen/onboarding/setPasswordScreen.dart';
import 'package:macapps/screen/onboarding/splashScreen.dart';
import 'package:macapps/screen/task/newTaskListScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Task Manager",
      initialRoute: '/login',
      routes: {
        '/': (context) => const splashScreen(),
        '/login': (context) => logInScreen(),
        '/registration': (context) => registrationScreen(),
        '/emailVerification': (context) => emailVerificationScreen(),
        '/pinVerification': (context) => pinVerificationScreen(),
        '/setPassword': (context) => setPasswordScreen(),
        '/newTaskList': (context) => newTaskListScreen(),
      },
    );
  }
}

//15-7
