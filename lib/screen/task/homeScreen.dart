import 'package:flutter/material.dart';
import 'package:macapps/screen/task/progressTaskListScreen.dart';

import '../../component/appBottomNav.dart';
import 'cancelTaskScreen.dart';
import 'completedTaskLisltScreen.dart';
import 'newTaskListScreen.dart';

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

  final widgetOptions = [
    newTaskListScreen(),
    progressTaskListScreen(),
    completedTaskListScreen(),
    cancelTaskListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Task Manager"), centerTitle: true),
      body: widgetOptions.elementAt(currentIndex),
      bottomNavigationBar: appBottomNav(currentIndex, onItemTapped),
    );
  }
}
