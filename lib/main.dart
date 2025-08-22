import 'package:flutter/material.dart';

import 'Screen/ProductCreateScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ProductCreateScreen(), title: 'Flutter CRUD APP');
  }
}
