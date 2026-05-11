import 'package:flutter/material.dart';
import 'package:macapps/component/taskAppBar.dart';
import 'package:macapps/screen/task/progressTaskListScreen.dart';
import 'package:macapps/utility/utility.dart';

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
  Map<String, String> profileData = {
    'email': '',
    'firstName': '',
    'lastName': '',
  };

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

  readappBarData() async {
    String? email = await readUserData('email');
    String? firstName = await readUserData('firstName');
    String? lastName = await readUserData('lastName');
    setState(() {
      profileData = {
        'email': '$email',
        'firstName': '$firstName',
        'lastName': '$lastName',
      };
    });
  }

  @override
  void initState() {
    readappBarData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: taskAppBar(context, profileData),
      body: widgetOptions.elementAt(currentIndex),
      bottomNavigationBar: appBottomNav(currentIndex, onItemTapped),
    );
  }
}
