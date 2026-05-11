import 'package:flutter/material.dart';

import '../../api/apiClient.dart';
import '../../component/taskListView.dart';

class completedTaskListScreen extends StatefulWidget {
  const completedTaskListScreen({super.key});

  @override
  State<completedTaskListScreen> createState() => _completedTaskListScreenState();
}

class _completedTaskListScreenState extends State<completedTaskListScreen> {



  List TaskItems = [];
  bool isLoading = true;

  @override
  void initState() {
    CallData();
    super.initState();
  }

  CallData() async {
    var data = await TaskListRequest("Completed");
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
