import 'dart:convert';

import 'package:http/http.dart' as http;

import '../style.dart';
import '../utility/utility.dart';

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
    await storeUserData(resultBody);
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

Future<bool> verifyEmailRequest(Email) async {
  var URL = Uri.parse("$baseURL/RecoverVerifyEmail/$Email");
  var response = await http.get(URL, headers: requestHeader);
  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);
  if (ResultCode == 200 && ResultBody['status'] == "success") {
    await writeEmailVerification(Email);
    successToast("Request Success");
    return true;
  } else {
    errorToast("Request fail ! try again");
    return false;
  }
}

Future<bool> verifyOTPRequest(email, otp) async {
  var url = Uri.parse("$baseURL/RecoverVerifyOTP/$email/$otp");

  var response = await http.get(url, headers: requestHeader);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if (resultCode == 200 && resultBody['status'] == "success") {
    await writeOTPVerification(otp);
    successToast("Request Success");
    return true;
  } else {
    errorToast("Request Failed! Try Again");
    return false;
  }
}

Future<bool> setPasswordRequest(formValues) async {
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
