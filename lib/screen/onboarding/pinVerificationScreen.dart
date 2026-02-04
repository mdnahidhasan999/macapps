import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../style.dart';

class pinVerificationScreen extends StatefulWidget {
  const pinVerificationScreen({super.key});

  @override
  State<pinVerificationScreen> createState() => _pinVerificationScreenState();
}

class _pinVerificationScreenState extends State<pinVerificationScreen> {
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
                Text("PIN Verification", style: head1Text(colorDarkBlue)),
                SizedBox(height: 10),
                Text(
                  "A 4 digit PIN has been sent to your email address",
                  style: head6Text(colorLightGray),
                ),
                SizedBox(height: 20),

                PinCodeTextField(
                  appContext: context,
                  length: 6,
                  pinTheme: appOTPStyle(),
                  animationType: AnimationType.fade,
                  animationDuration: Duration(milliseconds: 300),
                  enableActiveFill: true,
                  keyboardType: TextInputType.number,
                  onCompleted: (value) {},
                  onChanged: (value) {},
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: appButtonStyle(),
                  child: successButtonChild('Verify'),
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
