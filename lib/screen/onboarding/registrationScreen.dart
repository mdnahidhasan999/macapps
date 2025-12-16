import 'package:flutter/material.dart';
import 'package:macapps/api/apiClient.dart';

import '../../style.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  Map<String, String> formValues = {
    "email": "",
    "firstName": "",
    "lastName": "",
    "mobile": "",
    "password": "",
    "photo": "",
    "cpassword": "",
  };
  bool loading = false;

  InputOnChange(MapKey, Textvalue) {
    setState(() {
      formValues.update(MapKey, (value) => Textvalue);
    });
  }

  FormOnSubmit() async {
    if (formValues['email']!.length == 0) {
      errorToast('Email is required');
    } else if (formValues['firstName']!.length == 0) {
      errorToast('First Name is required');
    } else if (formValues['lastName']!.length == 0) {
      errorToast('Last Name is required');
    } else if (formValues['mobile']!.length == 0) {
      errorToast('Mobile Number is required');
    } else if (formValues['password']!.length == 0) {
      errorToast('Password is required');
    } else if (formValues['password'] != formValues['cpassword']) {
      errorToast('Password and Confirm Password must be same');
    } else {
      setState(() {
        loading = true;
      });
      bool res = await registrationRequest(formValues);
      if (res == true) {
        //navi
        Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
      } else {
        setState(() {
          loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorLight,
      body: Stack(
        children: [
          SingleChildScrollView(
            child:
                loading
                    ? (Center(child: CircularProgressIndicator()))
                    : Container(
                      margin: EdgeInsets.fromLTRB(0, 60, 0, 0),
                      padding: EdgeInsets.all(30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Join with US", style: head1Text(colorDarkBlue)),
                          SizedBox(height: 1),
                          Text(
                            "Learn with Nahid",
                            style: head2Text(colorLightGray),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            decoration: appInputDecoration("Email Address"),
                            onChanged: (Textvalue) {
                              InputOnChange("email", Textvalue);
                            },
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            decoration: appInputDecoration("First Name"),
                            onChanged: (Textvalue) {
                              InputOnChange("firstName", Textvalue);
                            },
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            decoration: appInputDecoration("Last Name"),
                            onChanged: (Textvalue) {
                              InputOnChange("lastName", Textvalue);
                            },
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            decoration: appInputDecoration("Mobile Number"),
                            onChanged: (Textvalue) {
                              InputOnChange("mobile", Textvalue);
                            },
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            decoration: appInputDecoration("Password"),
                            onChanged: (Textvalue) {
                              InputOnChange("password", Textvalue);
                            },
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            decoration: appInputDecoration("Confirm Password"),
                            onChanged: (Textvalue) {
                              InputOnChange("cpassword", Textvalue);
                            },
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              FormOnSubmit();
                            },
                            style: appButtonStyle(),
                            child: successButtonChild('Registration'),
                          ),
                        ],
                      ),
                    ),
          ),
        ],
      ),
    );
  }
}
