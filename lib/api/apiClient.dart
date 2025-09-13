import 'dart:convert';
import 'package:http/http.dart' as http;

import '../style.dart';

var baseUrl = "https://task.teamrabbil.com/api/v1";
var requestHeader = {"Content-Type": "application/jason"};

Future<bool> loginRequest(formValues) async {
  var url = Uri.parse("$baseUrl/login");
  var postBody = json.encode(formValues);
  var response = await http.post(url, headers: requestHeader, body: postBody);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if (resultCode == 200 && resultBody['status'] == 'success') {
    successToast("LogIn  Success");
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

Future<bool> verifyEmailRequest(formValues) async {
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
