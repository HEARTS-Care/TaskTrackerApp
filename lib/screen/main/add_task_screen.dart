import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nasifay/components/primary_button.dart';
import 'package:nasifay/config/theme/app_theme.dart';
import 'package:nasifay/controller/task_controller.dart';
import 'package:nasifay/model/task_model.dart';

class AddTaskScreen extends StatelessWidget {
  final TaskController taskController = Get.find();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(labelText: "Title"),
          ),
          TextField(
            controller: descriptionController,
            decoration: InputDecoration(labelText: "Description"),
          ),
          SizedBox(height: 20),
          PrimaryButton(
            onPressed: () {
              TaskModel newTask = TaskModel(
                title: titleController.text,
                description: descriptionController.text,
              );
              taskController.addTask(newTask);
            },
            color: theme.primary,
            child: Text(
              "Add Task",
              style: theme.typography.labelMedium,
            ),
          )
        ],
      ),
    );
  }
}
