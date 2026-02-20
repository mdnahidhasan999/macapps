import 'package:flutter/material.dart';

import '../../api/apiClient.dart';
import '../../style.dart';

class emailVerificationScreen extends StatefulWidget {
  const emailVerificationScreen({super.key});

  @override
  State<emailVerificationScreen> createState() =>
      _emailVerificationScreenState();
}

class _emailVerificationScreenState extends State<emailVerificationScreen> {
  Map<String, String> formValues = {"email": ""};
  bool isLoginLoading = false;

  inputOnChange(MapKey, TextValue) {
    setState(() {
      formValues.update(MapKey, (value) => TextValue);
    });
  }

  formOnSubmit() async {
    if (formValues['email']!.isEmpty) {
      errorToast("Please Enter Email Address");
    } else {
      setState(() {
        isLoginLoading = true;
      });
      var result = await verifyEmailRequest(formValues['email']);
      if (result == true) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/pinVerification',
          (route) => false,
        );
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
                            "Your Email Address",
                            style: head1Text(colorDarkBlue),
                          ),
                          SizedBox(height: 1),
                          Text(
                            "A 6 digit verification code will be sent to your email address",
                            style: head6Text(colorLightGray),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            decoration: appInputDecoration("Email Address"),
                          ),
                          SizedBox(height: 20),

                          ElevatedButton(
                            style: appButtonStyle(),
                            child: successButtonChild('Next'),
                            onPressed: () {},
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
