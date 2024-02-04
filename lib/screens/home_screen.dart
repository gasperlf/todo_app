import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/config/routes/route_location.dart';
import 'package:todo_app/data/data.dart';
import 'package:todo_app/utils/utils.dart';
import 'package:todo_app/widgets/display_list_of_task.dart';
import 'package:todo_app/widgets/display_white_text.dart';

class HomeScreen extends StatelessWidget {
  static HomeScreen builder(BuildContext context, GoRouterState state) =>
      const HomeScreen();

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;

    return Scaffold(
        body: Stack(
      children: [
        Column(
          children: [
            Container(
              height: deviceSize.height * 0.3,
              width: deviceSize.width,
              color: colors.primary,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DisplayWhiteText(
                      text: 'January 19, 2023',
                      fontSize: 20,
                      fontWeight: FontWeight.normal),
                  DisplayWhiteText(text: 'My Todo List', fontSize: 40),
                ],
              ),
            ),
          ],
        ),
        Positioned(
            top: 160,
            left: 0,
            right: 0,
            child: SafeArea(
              child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const DisplayListOfTask(
                        tasks: [
                          Task(
                              title: 'Title',
                              note: '',
                              time: '10:12',
                              date: 'Jan, 26',
                              isCompleted: false,
                              category: TaskCategories.shopping),
                          Task(
                              title: 'Title',
                              note: 'note',
                              time: '10:12',
                              date: 'Jan, 26',
                              isCompleted: false,
                              category: TaskCategories.education),
                        ],
                      ),
                      const Gap(20),
                      const Text(
                        'Completed',
                      ),
                      const Gap(20),
                      const DisplayListOfTask(
                        tasks: [
                          Task(
                              title: 'Title',
                              note: 'note',
                              time: '10:12',
                              date: 'Jan, 26',
                              isCompleted: true,
                              category: TaskCategories.personal),
                          Task(
                              title: 'Title 2 title 2 title 2',
                              note: 'note',
                              time: '10:12',
                              date: 'Jan, 26',
                              isCompleted: true,
                              category: TaskCategories.work),
                        ],
                        isCompletedTasks: true,
                      ),
                      const Gap(20),
                      ElevatedButton(
                          onPressed: () =>
                              context.push(RouteLocation.createTask),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: DisplayWhiteText(text: 'Add new task'),
                          )),
                    ],
                  )),
            )),
      ],
    ));
  }
}
