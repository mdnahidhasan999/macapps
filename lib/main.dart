import 'package:flutter/material.dart';
import 'package:macapps/screen/onboarding/emailVerificationScreen.dart';
import 'package:macapps/screen/onboarding/loginScreen.dart';
import 'package:macapps/screen/onboarding/pinVerificationScreen.dart';
import 'package:macapps/screen/onboarding/registrationScreen.dart';
import 'package:macapps/screen/onboarding/setPasswordScreen.dart';
import 'package:macapps/screen/onboarding/splashScreen.dart';
import 'package:macapps/screen/task/newTaskListScreen.dart';
import 'package:macapps/utility/utility.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String? token = await readUserData('token');
  if (token == null) {
    runApp(MyApp('/login'));
  } else {
    runApp(MyApp('/newTaskList'));
  }
}

class MyApp extends StatelessWidget {
  final String firstRoute;

  const MyApp(this.firstRoute, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Task Manager",
      initialRoute: firstRoute,
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

//16-21
