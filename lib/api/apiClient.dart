import 'dart:convert';

import 'package:http/http.dart' as http;

import '../style.dart';

var baseURL = "https://task.teamrabbil.com/api/v1";
var requestHeader = {"Content-Type": "application/json"};

Future<bool> logInRequest(formValues) async {
  var url = Uri.parse("$baseURL/login");
  var postBody = json.encode(formValues);
  var response = await http.post(url, headers: requestHeader, body: postBody);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if (resultCode == 200 && resultBody['status'] == "success") {
    successToast("Request Success");
    return true;
  } else {
    errorToast("Request Failed! Try Again");
    return false;
  }
}

Future<bool> registrationRequest(formValues) async {
  var url = Uri.parse("$baseURL/registration");
  var postBody = json.encode(formValues);
  var response = await http.post(url, headers: requestHeader, body: postBody);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if (resultCode == 200 && resultBody['status'] == "success") {
    successToast("Request Success");
    return true;
  } else {
    errorToast("Request Failed! Try Again");
    return false;
  }
}

Future<bool> verifyEmailRequest(email) async {
  var url = Uri.parse("$baseURL/RecoverVerifyEmail/$email");

  var response = await http.get(url, headers: requestHeader);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if (resultCode == 200 && resultBody['status'] == "success") {
    successToast("Request Success");
    return true;
  } else {
    errorToast("Request Failed! Try Again");
    return false;
  }
}

Future<bool> verifyOTPRequest(email, otp) async {
  var url = Uri.parse("$baseURL/RecoverVerifyOTP/$email/$otp");

  var response = await http.get(url, headers: requestHeader);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if (resultCode == 200 && resultBody['status'] == "success") {
    successToast("Request Success");
    return true;
  } else {
    errorToast("Request Failed! Try Again");
    return false;
  }
}

Future<bool> setNewPasswordRequest(formValues) async {
  var url = Uri.parse("$baseURL/RecoverResetPass");
  var postBody = json.encode(formValues);

  var response = await http.post(url, headers: requestHeader, body: postBody);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if (resultCode == 200 && resultBody['status'] == "success") {
    successToast("Request Success");
    return true;
  } else {
    errorToast("Request Failed! Try Again");
    return false;
  }
}
