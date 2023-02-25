import 'package:fitpad/features/toDoList/screens/ToDolist_screen.dart';
import 'package:fitpad/features/toDoList/widgets/add_task_sheet.dart';
import 'package:fitpad/features/toDoList/widgets/task_list.dart';
import 'package:fitpad/shared/utils/constants.dart';
import 'package:flutter/material.dart';

class ToDoListScreen extends StatelessWidget {
  const ToDoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SafeArea(
                  child: Row(
                    children: [
                      const Text(
                        "ToDoList",
                        style: kTextStyleHeadings,
                      ),
                      const SizedBox(width: 15),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            elevation: 5,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    topLeft: Radius.circular(20))),
                            backgroundColor: blueColor,
                            context: context,
                            builder: (context) => const AddTaskSheet(),
                          );
                        },
                        child: const Icon(
                          Icons.add_circle,
                          color: orangeColor,
                          size: 27,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration:
                      kContainerDecoration.copyWith(color: Colors.white),
                  height: 580,
                  child: const TaskList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
