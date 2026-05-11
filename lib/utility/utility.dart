import 'dart:typed_data';

import 'package:shared_preferences/shared_preferences.dart';

Future<void> storeUserData(userData) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', userData['token']);
  await prefs.setString('email', userData['data']['email']);
  await prefs.setString('firstName', userData['data']['firstName']);
  await prefs.setString('lastName', userData['data']['lastName']);
  await prefs.setString('mobile', userData['data']['mobile']);
  await prefs.setString('photo', userData['data']['photo']);
}

Future<void> writeEmailVerification(email) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('EmailVerification', email);
}

Future<void> writeOTPVerification(String otp) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('OTPVerification', otp);
}

Future<String?> readUserData(key) async {
  final prefs = await SharedPreferences.getInstance();
  String? myData = await prefs.getString(key);
  return myData;
}

Future<bool> RemoveToken() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.clear();
  return true;
}

showBase64Image(Base64String) {
  UriData? data = Uri.parse(Base64String).data;
  Uint8List myImage = data!.contentAsBytes();
  return myImage;
}
