import 'package:flutter/material.dart';

import '../../style.dart';

class registrationScreen extends StatefulWidget {
  const registrationScreen({super.key});

  @override
  State<registrationScreen> createState() => _registrationScreenState();
}

class _registrationScreenState extends State<registrationScreen> {
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
                Text("Join With Us ", style: head1Text(colorDarkBlue)),
                SizedBox(height: 1),
                Text(
                  "Learn With Nahid Hasan",
                  style: head6Text(colorLightGray),
                ),
                SizedBox(height: 20),

                TextFormField(decoration: appInputDecoration("Email Address")),
                SizedBox(height: 20),
                TextFormField(decoration: appInputDecoration("First Name")),
                SizedBox(height: 20),
                TextFormField(decoration: appInputDecoration("Last Name")),
                SizedBox(height: 20),
                TextFormField(decoration: appInputDecoration("Mobile Number")),
                SizedBox(height: 20),

                TextFormField(decoration: appInputDecoration("Password")),
                SizedBox(height: 20),

                TextFormField(
                  decoration: appInputDecoration("Confirm Password"),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: appButtonStyle(),
                  child: successButtonChild('Registration'),
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
