import 'package:fitpad/components/our_button.dart';
import 'package:fitpad/constants.dart';
import 'package:fitpad/models/toDoList_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class ToDoListState extends StatelessWidget {
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
                            builder: (context) => AddTaskSheet(),
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
                  child: TaskList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AddTaskSheet extends StatefulWidget {
  @override
  State<AddTaskSheet> createState() => _AddTaskSheetState();
}

class _AddTaskSheetState extends State<AddTaskSheet> {
  String? task;
  final currentUserId = FirebaseAuth.instance.currentUser!.uid;
  final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.ref().child("ToDolist");
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(69.0),
      child: Column(
        children: [
          const Text('Add your task', style: kTextStyleHeaders),
          const SizedBox(height: 30),
          TextField(
            textCapitalization: TextCapitalization.words,
            style: kTextStyleSmall,
            onChanged: (value) {
              setState(() {
                task = value;
              });
            },
          ),
          const SizedBox(height: 30),
          mainButton(
            "Add",
            () {
              Provider.of<TaskData>(context, listen: false).addTasks(
                task.toString(),
              );

              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class TaskList extends StatelessWidget {
  final currentUserId = FirebaseAuth.instance.currentUser!.uid;
  final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.ref().child("ToDolist");
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

class TaskTile extends StatelessWidget {
  TaskTile(
      {this.onChecked = false,
      this.task,
      this.checkBoxCallBack,
      this.longPressCallBack});
  String? task;
  bool onChecked;
  Function(bool?)? checkBoxCallBack;
  Function()? longPressCallBack;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallBack!,
      leading: Text(
        task.toString(),
        style: kTextStyleLarge.copyWith(
            color: Colors.black,
            decoration: onChecked == true ? TextDecoration.lineThrough : null,
            decorationThickness: 3),
      ),
      trailing: Checkbox(
        value: onChecked,
        onChanged: checkBoxCallBack!,
      ),
    );
  }
}
