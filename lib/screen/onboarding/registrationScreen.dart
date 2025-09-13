import 'package:flutter/material.dart';

import '../../style.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
                Text("Join with US", style: head1Text(colorDarkBlue)),
                SizedBox(height: 1),
                Text("Learn with Nahid", style: head2Text(colorLightGray)),
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
                  onPressed: () {},
                  style: appButtonStyle(),
                  child: successButtonChild('Registration'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
