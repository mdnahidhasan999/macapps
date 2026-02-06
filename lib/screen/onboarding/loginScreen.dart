import 'package:flutter/material.dart';

import '../../api/apiClient.dart';
import '../../style.dart';

class logInScreen extends StatefulWidget {
  const logInScreen({super.key});

  @override
  State<logInScreen> createState() => _logInScreenState();
}

class _logInScreenState extends State<logInScreen> {
  Map<String, String> formValues = {"email": "", "password": ""};
  bool isLoginLoading = false;

  inputOnChange(MapKey, TextValue) {
    setState(() {
      formValues.update(MapKey, (value) => TextValue);
    });
  }

  formOnSubmit() async {
    if (formValues['email']!.isEmpty) {
      errorToast("Please Enter Email Address");
    } else if (formValues['password']!.isEmpty) {
      errorToast("Please Enter Password");
    } else {
      setState(() {
        isLoginLoading = true;
      });
      var result = await logInRequest(formValues);
      if (result == true) {
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
                            "Get Started With",
                            style: head1Text(colorDarkBlue),
                          ),
                          SizedBox(height: 1),
                          Text(
                            "Learn With Nahid Hasan",
                            style: head6Text(colorLightGray),
                          ),
                          SizedBox(height: 20),

                          TextFormField(
                            onChanged: (textValue) {
                              inputOnChange("email", textValue);
                            },

                            decoration: appInputDecoration("Email Address"),
                          ),
                          SizedBox(height: 20),

                          TextFormField(
                            onChanged: (textValue) {
                              inputOnChange("password", textValue);
                            },
                            decoration: appInputDecoration("Password"),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            style: appButtonStyle(),
                            child: successButtonChild('LogIn'),
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
//14