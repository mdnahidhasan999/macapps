import 'package:flutter/material.dart';

import '../../api/apiClient.dart';
import '../../component/taskListView.dart';

class cancelTaskListScreen extends StatefulWidget {
  const cancelTaskListScreen({super.key});

  @override
  State<cancelTaskListScreen> createState() => _cancelTaskListScreenState();
}

class _cancelTaskListScreenState extends State<cancelTaskListScreen> {

  List TaskItems = [];
  bool isLoading = true;

  @override
  void initState() {
    CallData();
    super.initState();
  }

  CallData() async {
    var data = await TaskListRequest("Cancel");
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
