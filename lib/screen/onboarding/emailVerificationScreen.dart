import 'package:flutter/material.dart';

import '../../style.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
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
                Text("Your Email Address", style: head1Text(colorDarkBlue)),
                SizedBox(height: 1),
                Text(
                  "A 6 digit verification pin will send to your email address",
                  style: head2Text(colorLightGray),
                ),
                SizedBox(height: 20),
                TextFormField(decoration: appInputDecoration("Email Address")),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: appButtonStyle(),
                  child: successButtonChild('Next'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
