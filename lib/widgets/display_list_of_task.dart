import 'package:flutter/material.dart';
import 'package:todo_app/utils/utils.dart';

import '../data/models/task.dart';
import 'common_container.dart';

class DisplayListOfTask extends StatelessWidget {
  const DisplayListOfTask(
      {super.key, required this.tasks, this.isCompletedTasks = false});

  final List<Task> tasks;
  final bool isCompletedTasks;

  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;
    final height =
        isCompletedTasks ? deviceSize.height * 0.25 : deviceSize.height * 0.3;
    final emptyTaskMessage = isCompletedTasks
        ? 'There is no completed tasks yet'
        : 'There is no task too!';
    return CommonContainer(
      height: height,
      child: tasks.isEmpty
          ? Center(
              child: Text(emptyTaskMessage,
                  style: context.textTheme.headlineSmall)
      )
          : ListView.builder(
              shrinkWrap: true,
              itemCount: tasks.length,
              padding: EdgeInsets.zero,
              itemBuilder: (ctx, index) {
                return const Text('Home');
              }),
    );
  }
}