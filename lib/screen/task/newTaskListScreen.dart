import 'package:flutter/material.dart';

import '../../api/apiClient.dart';
import '../../component/taskListView.dart';

class newTaskListScreen extends StatefulWidget {
  const newTaskListScreen({super.key});

  @override
  State<newTaskListScreen> createState() => _newTaskListScreenState();
}

class _newTaskListScreenState extends State<newTaskListScreen> {
  List TaskItems = [];
  bool isLoading = true;

  @override
  void initState() {
    CallData();
    super.initState();
  }

  CallData() async {
    var data = await TaskListRequest("New");
    setState(() {
      isLoading = false;
      TaskItems = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? (Center(child: CircularProgressIndicator()))
        : RefreshIndicator(
          onRefresh: () async {
            await CallData();
          },
          child: TaskList(TaskItems),
        );
  }
}
