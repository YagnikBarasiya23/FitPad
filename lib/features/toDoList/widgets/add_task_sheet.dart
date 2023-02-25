import 'package:fitpad/features/toDoList/models/toDoList_model.dart';
import 'package:fitpad/shared/utils/constants.dart';
import 'package:fitpad/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class AddTaskSheet extends StatefulWidget {
  const AddTaskSheet({super.key});

  @override
  State<AddTaskSheet> createState() => _AddTaskSheetState();
}

class _AddTaskSheetState extends State<AddTaskSheet> {
  String? task;

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
          CustomButton(
            text: 'Add',
            onPressed: () {
              Provider.of<TaskData>(context, listen: false).addTasks(
                task.toString(),
              );

              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}