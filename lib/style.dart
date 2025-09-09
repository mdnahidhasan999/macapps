import 'package:flutter/material.dart';

InputDecoration AppInputDecoration(label) {
  return InputDecoration(
    contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 20),
    fillColor: Colors.white,
    filled: true,

    border: OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.greenAccent, width: 2),
    ),

    label: label,
  );
}

ButtonStyle appButtonStyle() {
  return ElevatedButton.styleFrom(
    backgroundColor: Colors.greenAccent,
    foregroundColor: Colors.black,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),

    padding: EdgeInsets.all(20),
    textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
  );
}

SizedBox SizeBox50(child) {
  return SizedBox(
    height: 50,
    width: double.infinity,
    child: Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(8),
      child: child,
    ),
  );
}
