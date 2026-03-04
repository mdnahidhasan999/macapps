import 'package:flutter/material.dart';

import '../../component/appBottomNav.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int currentIndex = 0;

  onItemTapped(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Task Manager"), centerTitle: true),
      body: Center(),
      bottomNavigationBar: appBottomNav(currentIndex, onItemTapped),
    );
  }
}
