import 'package:flutter/material.dart';
import 'package:macapps/style.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorLight,
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Get Started With", style: head1Text(colorDarkBlue)),
                SizedBox(height: 1),
                Text("Learn with Nahid", style: head2Text(colorLightGray)),
                SizedBox(height: 20),
                TextFormField(decoration: appInputDecoration("Email Address")),
                SizedBox(height: 20),
                TextFormField(decoration: appInputDecoration("Password")),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: appButtonStyle(),
                  child: successButtonChild('LogIn'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
