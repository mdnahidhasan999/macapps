import 'dart:convert';
import 'package:http/http.dart' as http;

import '../style.dart';
import '../utility/utility.dart';

var baseUrl = "https://task.teamrabbil.com/api/v1";
var requestHeader = {"Content-Type": "application/json; charset=utf-8"};

Future<bool> loginRequest(formValues) async {
  var url = Uri.parse("$baseUrl/login");
  var postBody = json.encode(formValues);
  var response = await http.post(url, headers: requestHeader, body: postBody);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if (resultCode == 200 && resultBody['status'] == 'success') {
    successToast("LogIn  Success");
    await StoreUserData(resultBody);
    return true;
  } else {
    errorToast("LogIn Failed! try again");
    return false;
  }
}

Future<bool> registrationRequest(formValues) async {
  var url = Uri.parse("$baseUrl/registration");
  var postBody = json.encode(formValues);
  var response = await http.post(url, headers: requestHeader, body: postBody);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if (resultCode == 200 && resultBody['status'] == 'success') {
    successToast("Registration Success");
    return true;
  } else {
    errorToast("Registration Failed! try again");
    return false;
  }
}

Future<bool> verifyEmailRequest(Email) async {
  var url = Uri.parse("$baseUrl/RecoverVerifyEmail/$Email");
  var response = await http.get(url, headers: requestHeader);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if (resultCode == 200 && resultBody['status'] == 'success') {
    successToast("Request Success");
    return true;
  } else {
    errorToast("Request Failed! try again");
    return false;
  }
}

Future<bool> verifyOTPRequest(Email, OTP) async {
  var url = Uri.parse("$baseUrl/RecoverVerifyOTP/$Email/$OTP");
  var response = await http.get(url, headers: requestHeader);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if (resultCode == 200 && resultBody['status'] == 'success') {
    successToast("Request Success");
    return true;
  } else {
    errorToast("Request Failed! try again");
    return false;
  }
}

Future<bool> setNewPasswordRequest(formValues) async {
  var url = Uri.parse("$baseUrl/RecoverResetPass");
  var postBody = json.encode(formValues);
  var response = await http.post(url, headers: requestHeader, body: postBody);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if (resultCode == 200 && resultBody['status'] == 'success') {
    successToast("Request Success");
    return true;
  } else {
    errorToast("Request Failed! try again");
    return false;
  }
}
