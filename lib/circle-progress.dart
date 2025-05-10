import 'package:flutter/material.dart';

class HomeActivity extends StatelessWidget {
  const HomeActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        // child: CircularProgressIndicator(
        //   value: 0.7,
        //   strokeWidth: 5,
        //   backgroundColor: Colors.grey,
        //   color: Colors.blue,
        //   semanticsLabel: 'Loading',
        //
        // ),
        // child: LinearProgressIndicator(
        //   value: 0.5,
        //   backgroundColor: Colors.grey,
        //   color: Colors.blue,
        //   minHeight: 20,
        // ),
        child: Icon(Icons.abc, size: 100, color: Colors.blue,),
      ),
    );
  }
}
