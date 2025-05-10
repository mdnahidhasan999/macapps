import 'package:flutter/material.dart';

class HomeActivity extends StatelessWidget {
  const HomeActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) =>
                          Activity1(message: 'This is from Home to Activity 1'),
                ),
              );
            },
            child: Text("Activity 1"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) =>
                          Activity2(message: 'This is from Home to Activity 2'),
                ),
              );
            },
            child: Text("Activity 2"),
          ),
        ],
      ),
    );
  }
}

class Activity1 extends StatelessWidget {
  final String message;

  const Activity1({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(message)),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) =>
                        Activity2(message: 'This is from Home to Activity 2'),
              ),
            );
          },
          child: Text("Go Activity 2"),
        ),
      ),
    );
  }
}

class Activity2 extends StatelessWidget {
  final String message;

  const Activity2({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(message)),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Back to Activity 1"),
        ),
      ),
    );
  }
}
