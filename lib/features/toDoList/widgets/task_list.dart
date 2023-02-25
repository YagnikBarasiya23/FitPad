import 'package:fitpad/features/toDoList/models/toDoList_model.dart';
import 'package:fitpad/features/toDoList/screens/ToDolist_screen.dart';
import 'package:fitpad/features/toDoList/widgets/task_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class TaskList extends StatelessWidget {
  const TaskList({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Consumer<TaskData>(
        builder: (context, taskData, child) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return TaskTile(
                onChecked: taskData.tasks[index].onChecked,
                task: taskData.tasks[index].tasks,
                checkBoxCallBack: (checkState) {
                  taskData.updateTasks(
                    taskData.tasks[index],
                  );
                },
                longPressCallBack: () {
                  taskData.deleteTasks(taskData.tasks[index]);
                },
              );
            },
            itemCount: Provider.of<TaskData>(context).tasksLength,
          );
        },
      ),
    );
  }
}