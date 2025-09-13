import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../style.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key});

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
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
                Text("PIN Varification", style: head1Text(colorDarkBlue)),
                SizedBox(height: 1),
                Text(
                  "A 6 digit pin has been send to your mobile number",
                  style: head2Text(colorLightGray),
                ),
                SizedBox(height: 20),
                PinCodeTextField(
                  appContext: context,
                  length: 6,
                  pinTheme: appOtpStyle(),
                  animationType: AnimationType.fade,
                  animationDuration: Duration(milliseconds: 300),
                  enableActiveFill: true,
                  onCompleted: (v) {},
                  onChanged: (value) {},
                ),

                ElevatedButton(
                  onPressed: () {},
                  style: appButtonStyle(),
                  child: successButtonChild('Verify'),
                ),

              ],

            ),
          ),
        ],
      ),
    );
  }
}
