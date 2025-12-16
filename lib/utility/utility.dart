import 'package:shared_preferences/shared_preferences.dart';

Future<void> StoreUserData(UserDate) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', UserDate['token']);
  await prefs.setString('email', UserDate['data']['email']);
  await prefs.setString('firstName', UserDate['data']['firstName']);
  await prefs.setString('lastName', UserDate['data']['lastName']);
  await prefs.setString('mobile', UserDate['data']['mobile']);
  await prefs.setString('photo', UserDate['data']['photo']);
}

Future<String?> ReadUserData(key) async {
  final prefs = await SharedPreferences.getInstance();
  String? mydate = await prefs.getString(key);
  return mydate;
}
