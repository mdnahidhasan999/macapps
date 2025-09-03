import 'package:flutter/material.dart';

InputDecoration AppInputDecoration(label) {
  return InputDecoration(
    contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 20),
    fillColor: Colors.lime,
    filled: true,

    border: OutlineInputBorder(),
    label: label,
  );
}

TextStyle appTextStyle() {
  return TextStyle(
    fontSize: 25,
    color: Colors.blue,
    fontWeight: FontWeight.bold,
  );
}

ButtonStyle appButtonStyle() {
  return ElevatedButton.styleFrom(
    backgroundColor: Colors.greenAccent,
    foregroundColor: Colors.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),

    padding: EdgeInsets.all(20),
    textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  );
}
