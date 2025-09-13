import 'package:flutter/material.dart';

import '../../style.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
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
                Text("Set Password", style: head1Text(colorDarkBlue)),
                SizedBox(height: 1),
                Text(
                  "Minimum length password 8 character with Latter and number combination.",
                  style: head2Text(colorLightGray),
                ),
                SizedBox(height: 20),
                TextFormField(decoration: appInputDecoration("Password ")),
                SizedBox(height: 20),
                TextFormField(
                  decoration: appInputDecoration("Confirm Password"),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: appButtonStyle(),
                  child: successButtonChild('Confirm'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
