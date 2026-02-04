import 'package:flutter/material.dart';

import '../../style.dart';

class emailVerificationScreen extends StatefulWidget {
  const emailVerificationScreen({super.key});

  @override
  State<emailVerificationScreen> createState() =>
      _emailVerificationScreenState();
}

class _emailVerificationScreenState extends State<emailVerificationScreen> {
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
                Text("Your Email Address", style: head1Text(colorDarkBlue)),
                SizedBox(height: 1),
                Text(
                  "A 6 digit verification code will be sent to your email address",
                  style: head6Text(colorLightGray),
                ),
                SizedBox(height: 20),
                TextFormField(decoration: appInputDecoration("Email Address")),
                SizedBox(height: 20),

                ElevatedButton(
                  style: appButtonStyle(),
                  child: successButtonChild('Next'),
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
