import 'package:flutter/material.dart';

import '../../style.dart';

class setPasswordScreen extends StatefulWidget {
  const setPasswordScreen({super.key});

  @override
  State<setPasswordScreen> createState() => _setPasswordScreenState();
}

class _setPasswordScreenState extends State<setPasswordScreen> {
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
                Text("Set Password", style: head1Text(colorDarkBlue)),
                SizedBox(height: 1),
                Text(
                  "Minimum length password 8 characters with Latter and number combination",
                  style: head6Text(colorLightGray),
                ),
                SizedBox(height: 20),
                TextFormField(decoration: appInputDecoration("Password")),
                SizedBox(height: 20),

                TextFormField(
                  decoration: appInputDecoration("Confirm Password"),
                ),
                SizedBox(height: 20),

                ElevatedButton(
                  style: appButtonStyle(),
                  child: successButtonChild('Confirm'),
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
