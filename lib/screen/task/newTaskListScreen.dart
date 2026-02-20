import 'package:flutter/material.dart';

import '../../utility/utility.dart';

class newTaskListScreen extends StatefulWidget {
  const newTaskListScreen({super.key});

  @override
  State<newTaskListScreen> createState() => _newTaskListScreenState();
}

class _newTaskListScreenState extends State<newTaskListScreen> {
  String email = "";

  @override
  void initState() {
    callUserData();
    super.initState();
  }

  callUserData() async {
    var a = await readUserData("email");
    setState(() {
      email = a!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Task List"), centerTitle: true),
      body: Center(child: Text(email)),
    );
  }
}
