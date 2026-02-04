import 'package:flutter/material.dart';

import '../../style.dart';

class logInScreen extends StatefulWidget {
  const logInScreen({super.key});

  @override
  State<logInScreen> createState() => _logInScreenState();
}

class _logInScreenState extends State<logInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          screenBackground(context),
          Container(
            padding: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Get Started With", style: head1Text(colorDarkBlue)),
                SizedBox(height: 1),
                Text(
                  "Learn With Nahid Hasan",
                  style: head6Text(colorLightGray),
                ),
                SizedBox(height: 20),

                TextFormField(decoration: appInputDecoration("Email Address")),
                SizedBox(height: 20),
                TextFormField(decoration: appInputDecoration("Password")),
                SizedBox(height: 20),
                ElevatedButton(
                  style: appButtonStyle(),
                  child: successButtonChild('LogIn'),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
