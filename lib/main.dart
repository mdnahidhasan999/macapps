import 'package:flutter/material.dart';

import 'circle-progress.dart';

//import 'navigation.dart';
//import 'Tab-bar.dart';
//import 'card.dart';

//import 'gesture-detector.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      home: HomeActivity(),
    );
  }
}


