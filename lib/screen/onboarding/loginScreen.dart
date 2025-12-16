import 'package:flutter/material.dart';
import 'package:macapps/api/apiClient.dart';
import 'package:macapps/style.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  Map<String, String> formValues = {"email": "", "password": ""};
  bool loading = false;

  InputOnChange(MapKey, Textvalue) {
    setState(() {
      formValues.update(MapKey, (value) => Textvalue);
    });
  }

  FormOnSubmit() async {
    if (formValues['email']!.length == 0) {
      errorToast('Email is required');
    } else if (formValues['password']!.length == 0) {
      errorToast('Password is required');
    } else {
      setState(() {
        loading = true;
      });
      bool res = await loginRequest(formValues);
      if (res == true) {
        //navi
        Navigator.pushNamedAndRemoveUntil(
          context,
          "/newTaskList",
          (route) => false,
        );
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
          Container(
            alignment: Alignment.center,

            child:
                loading
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
                            "Learn with Nahid",
                            style: head2Text(colorLightGray),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            onChanged: (Textvalue) {
                              InputOnChange("email", Textvalue);
                            },
                            decoration: appInputDecoration("Email Address"),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            onChanged: (Textvalue) {
                              InputOnChange("password", Textvalue);
                            },
                            decoration: appInputDecoration("Password"),
                          ),
                          SizedBox(height: 20),
                          Container(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              onPressed: () {
                                FormOnSubmit();
                              },
                              style: appButtonStyle(),
                              child: successButtonChild('LogIn'),
                            ),
                          ),

                          SizedBox(height: 20),
                          Container(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                SizedBox(height: 20),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/emailVerification',
                                    );
                                  },
                                  child: Text(
                                    'Forget PassWord?',
                                    style: head7Text(colorLightGray),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/registration',
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Don't have a account?",
                                        style: head2Text(colorDarkBlue),
                                      ),
                                      Text(
                                        "Sign Up",
                                        style: head7Text(colorGreen),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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
