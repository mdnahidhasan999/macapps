import 'package:flutter/material.dart';

import '../../api/apiClient.dart';
import '../../style.dart';

class registrationScreen extends StatefulWidget {
  const registrationScreen({super.key});

  @override
  State<registrationScreen> createState() => _registrationScreenState();
}

class _registrationScreenState extends State<registrationScreen> {
  Map<String, String> formValues = {
    "email": "",
    "firstName": "",
    "lastName": "",
    "mobile": "",
    "photo": "",
    "password": "",
    "cPassword": "",
  };
  bool isRegistrationLoading = false;

  inputOnChange(MapKey, TextValue) {
    setState(() {
      formValues.update(MapKey, (value) => TextValue);
    });
  }

  formOnSubmit() async {
    if (formValues['email']!.isEmpty) {
      errorToast("Please Enter Email Address");
    } else if (formValues['firstName']!.isEmpty) {
      errorToast("Please Enter First Name");
    } else if (formValues['lastName']!.isEmpty) {
      errorToast("Please Enter Last Name");
    } else if (formValues['mobile']!.isEmpty) {
      errorToast("Please Enter Mobile Number");
    } else if (formValues['password']!.isEmpty) {
      errorToast("Please Enter Password");
    } else if (formValues['password'] != formValues['cPassword']) {
      errorToast("Confirm Password should be same as Password");
    } else {
      setState(() {
        isRegistrationLoading = true;
      });
      var result = await registrationRequest(formValues);
      if (result == true) {
        Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
      } else {
        setState(() {
          isRegistrationLoading = false;
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
                isRegistrationLoading
                    ? (Center(child: CircularProgressIndicator()))
                    : (SingleChildScrollView(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Join With Us ",
                            style: head1Text(colorDarkBlue),
                          ),
                          SizedBox(height: 1),
                          Text(
                            "Learn With Nahid Hasan",
                            style: head6Text(colorLightGray),
                          ),
                          SizedBox(height: 20),

                          TextFormField(
                            decoration: appInputDecoration("Email Address"),
                            onChanged: (textValue) {
                              inputOnChange("email", textValue);
                            },
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            decoration: appInputDecoration("First Name"),
                            onChanged: (textValue) {
                              inputOnChange("firstName", textValue);
                            },
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            decoration: appInputDecoration("Last Name"),
                            onChanged: (textValue) {
                              inputOnChange("lastName", textValue);
                            },
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            decoration: appInputDecoration("Mobile Number"),
                            onChanged: (textValue) {
                              inputOnChange("mobile", textValue);
                            },
                          ),
                          SizedBox(height: 20),

                          TextFormField(
                            decoration: appInputDecoration("Password"),
                            onChanged: (textValue) {
                              inputOnChange("password", textValue);
                            },
                          ),
                          SizedBox(height: 20),

                          TextFormField(
                            decoration: appInputDecoration("Confirm Password"),
                            onChanged: (textValue) {
                              inputOnChange("cPassword", textValue);
                            },
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            style: appButtonStyle(),
                            child: successButtonChild('Registration'),
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
