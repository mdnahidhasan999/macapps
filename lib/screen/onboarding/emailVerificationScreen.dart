import 'package:flutter/material.dart';

import '../../api/apiClient.dart';
import '../../style.dart';

class emailVerificationScreen extends StatefulWidget {
  const emailVerificationScreen({Key? key}) : super(key: key);

  @override
  State<emailVerificationScreen> createState() =>
      _emailVerificationScreenState();
}

class _emailVerificationScreenState extends State<emailVerificationScreen> {
  Map<String, String> FormValues = {"email": ""};
  bool Loading = false;

  InputOnChange(MapKey, Textvalue) {
    setState(() {
      FormValues.update(MapKey, (value) => Textvalue);
    });
  }

  FormOnSubmit() async {
    if (FormValues['email']!.isEmpty) {
      errorToast('Email Required !');
    } else {
      setState(() {
        Loading = true;
      });
      bool res = await verifyEmailRequest(FormValues['email']);
      if (res == true) {
        Navigator.pushNamed(context, "/pinVerification");
      } else {
        setState(() {
          Loading = false;
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
                Loading
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
                            "A 6 digit verification pin will send to your email address",
                            style: head6Text(colorLightGray),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            onChanged: (Textvalue) {
                              InputOnChange("email", Textvalue);
                            },
                            decoration: appInputDecoration("Email Address"),
                          ),
                          SizedBox(height: 20),
                          Container(
                            child: ElevatedButton(
                              style: appButtonStyle(),
                              child: successButtonChild('Next'),
                              onPressed: () {
                                FormOnSubmit();
                              },
                            ),
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
