import 'package:flutter/material.dart';

import '../../api/apiClient.dart';
import '../../component/taskListView.dart';

class progressTaskListScreen extends StatefulWidget {
  const progressTaskListScreen({super.key});

  @override
  State<progressTaskListScreen> createState() => _progressTaskListScreenState();
}

class _progressTaskListScreenState extends State<progressTaskListScreen> {
  List TaskItems = [];
  bool isLoading = true;

  @override
  void initState() {
    CallData();
    super.initState();
  }

  CallData() async {
    var data = await TaskListRequest("Progress");
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
