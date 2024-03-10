import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/providers/providers.dart';
import 'package:todo_app/utils/utils.dart';
import 'package:todo_app/widgets/task_details.dart';
import 'package:todo_app/widgets/task_tile.dart';

import '../data/models/task.dart';
import 'common_container.dart';

class DisplayListOfTask extends ConsumerWidget {
  const DisplayListOfTask(
      {super.key, required this.tasks, this.isCompletedTasks = false});

  final List<Task> tasks;
  final bool isCompletedTasks;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  style: context.textTheme.headlineSmall))
          : ListView.separated(
              shrinkWrap: true,
              itemCount: tasks.length,
              padding: EdgeInsets.zero,
              itemBuilder: (ctx, index) {
                final task = tasks[index];
                return InkWell(
                  onLongPress: () {
                    AppAlerts.showDeleteAlertDialog(context, ref, task);
                  },
                  onTap: () async {
                    await showModalBottomSheet(
                        context: context,
                        builder: (ctx) {
                          return TaskDetails(task: task);
                        });
                  },
                  child: TaskTile(
                      task: task,
                      onCompleted: (value) async {
                        await ref
                            .read(tasksProvider.notifier)
                            .updateTask(task)
                            .then((value) {
                          AppAlerts.displaySnackBar(
                              context,
                              task.isCompleted
                                  ? 'Task incompleted'
                                  : 'Task completed');
                        });
                      }),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  thickness: 1.5,
                );
              },
            ),
    );
  }
}
