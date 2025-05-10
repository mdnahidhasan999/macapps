import 'package:flutter/material.dart';

class HomeActivity extends StatelessWidget {
  const HomeActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Card(
          elevation: 80,
          color: Colors.amber,
          shadowColor: Colors.red,
          child: SizedBox(
            height: 200,
            width: 200,
            child: Center(
              child: Text('Hello, World!', style: TextStyle(fontSize: 24)),
            ),
          ),
        ),
      ),
    );
  }
}
