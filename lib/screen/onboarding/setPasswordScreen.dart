import 'package:flutter/material.dart';
import 'package:macapps/api/apiClient.dart';
import 'package:macapps/utility/utility.dart';

import '../../style.dart';

class setPasswordScreen extends StatefulWidget {
  const setPasswordScreen({super.key});

  @override
  State<setPasswordScreen> createState() => _setPasswordScreenState();
}

class _setPasswordScreenState extends State<setPasswordScreen> {
  Map<String, String> FormValues = {
    "email": "",
    "OTP": "",
    "password": "",
    "cpassword": "",
  };
  bool Loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  callStoreData() async {
    String? OTP = await readUserData("OTPVerification");
    String? Email = await readUserData("EmailVerification");
    InputOnChange("OTP", OTP);
    InputOnChange("email", Email);
  }

  InputOnChange(MapKey, Textvalue) {
    setState(() {
      FormValues.update(MapKey, (value) => Textvalue);
    });
  }

  FormOnSubmit() async {
    if (FormValues['password']!.isEmpty) {
      errorToast('Password Required !');
    } else if (FormValues['password'] != FormValues['cpassword']) {
      errorToast("Confirm Password should be same as Password");
    } else {
      setState(() {
        Loading = true;
      });
      bool res = await setPasswordRequest(FormValues);
      if (res == true) {
        Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
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
                TextFormField(
                  onChanged: (Textvalue) {
                    InputOnChange("password", Textvalue);
                  },
                  decoration: appInputDecoration("Password"),
                ),
                SizedBox(height: 20),

                TextFormField(
                  onChanged: (Textvalue) {
                    InputOnChange("cpassword", Textvalue);
                  },
                  decoration: appInputDecoration("Confirm Password"),
                ),
                SizedBox(height: 20),

                ElevatedButton(
                  style: appButtonStyle(),
                  child: successButtonChild('Confirm'),
                  onPressed: () {
                    FormOnSubmit();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
