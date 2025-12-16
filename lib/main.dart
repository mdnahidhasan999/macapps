import 'package:flutter/material.dart';
import 'package:macapps/screen/task/newTaskListScreen.dart';
import 'package:macapps/utility/utility.dart';
import 'screen/onboarding/emailVerificationScreen.dart';
import 'screen/onboarding/loginScreen.dart';
import 'screen/onboarding/pinVerificationScreen.dart';
import 'screen/onboarding/registrationScreen.dart';
import 'screen/onboarding/setPassWordScreen.dart';
import 'screen/onboarding/splashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  String? token = await ReadUserData("token");

  // null-safe check
  if (token != null && token.isNotEmpty) {
    runApp(MyApp('/newTaskList'));
  } else {
    runApp(MyApp('/login'));
  }
}

class MyApp extends StatelessWidget {
  final String firstRoute;

  const MyApp(this.firstRoute, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',

      initialRoute: firstRoute,
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LogInScreen(),
        '/registration': (context) => RegistrationScreen(),
        '/emailVerification': (context) => EmailVerificationScreen(),
        '/pinVerification': (context) => PinVerificationScreen(),
        '/setPassWord': (context) => SetPasswordScreen(),
        '/newTaskList': (context) => NewTaskListScreen(),
      },
    );
  }
}
