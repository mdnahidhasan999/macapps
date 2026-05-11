import 'package:flutter/material.dart';

import '../style.dart';

ListView TaskList(TaskItems) {
  return ListView.builder(
    itemBuilder: (context, index) {
      return Card(
        child: ItemSizeBox(
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(TaskItems[index]['title'], style: head6Text(colorDarkBlue)),
              Text(
                TaskItems[index]['description'],
                style: head6Text(colorLightGray),
              ),
              Text(TaskItems[index]['status']),
              Text(TaskItems[index]['date']),
            ],
          ),
        ),
      );
    },
    itemCount: TaskItems.length,
  );
}
