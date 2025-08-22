import 'package:flutter/material.dart';
import 'package:macapps/Screen/ProductGridViewScreen.dart';

import 'Screen/ProductCreateScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductGridViewscreen(),
      title: 'Flutter CRUD APP',
    );
  }
}
