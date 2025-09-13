import 'package:flutter/material.dart';

import '../../style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorLight,
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(30),
            child: Center(child: Text('Splash Screen')),
          ),
        ],
      ),
    );
  }
}
