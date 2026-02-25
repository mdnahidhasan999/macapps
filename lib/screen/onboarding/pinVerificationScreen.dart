import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../api/apiClient.dart';
import '../../style.dart';
import '../../utility/utility.dart';

class pinVerificationScreen extends StatefulWidget {
  const pinVerificationScreen({super.key});

  @override
  State<pinVerificationScreen> createState() => _pinVerificationScreenState();
}

class _pinVerificationScreenState extends State<pinVerificationScreen> {
  Map<String, String> formValues = {"otp": ""};
  bool isLoginLoading = false;

  inputOnChange(MapKey, TextValue) {
    setState(() {
      formValues.update(MapKey, (value) => TextValue);
    });
  }

  formOnSubmit() async {
    if (formValues['otp']!.length == 6) {
      errorToast('OTP Required!');
    } else {
      setState(() {
        isLoginLoading = true;
      });
      String? email = await readUserData('email');
      bool res = await verifyOTPRequest(email, formValues['otp']!);
      if (res == true) {
        Navigator.pushNamed(context, '/setPassword');
      } else {
        setState(() {
          isLoginLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          screenBackground(context),
          Container(
            alignment: Alignment.center,
            child:
                isLoginLoading
                    ? (Center(child: CircularProgressIndicator()))
                    : (SingleChildScrollView(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "PIN Verification",
                            style: head1Text(colorDarkBlue),
                          ),
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
                            onCompleted: (value) {
                              inputOnChange("otp", value);
                            },
                            onChanged: (value) {
                              inputOnChange("otp", value);
                            },
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            style: appButtonStyle(),
                            child: successButtonChild('Verify'),
                            onPressed: () {
                              formOnSubmit();
                            },
                          ),
                        ],
                      ),
                    )),
          ),
        ],
      ),
    );
  }
}
