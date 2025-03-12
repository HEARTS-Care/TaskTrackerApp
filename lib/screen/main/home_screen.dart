import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nasifay/config/theme/app_theme.dart';
import 'package:nasifay/controller/auth_controller.dart';
import 'package:nasifay/controller/task_controller.dart';
import 'package:nasifay/model/task_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);
    final TaskController taskController = Get.put(TaskController());
    return Padding(
      padding: EdgeInsets.all(10),
      child: Obx(() {
        if (taskController.tasks.isEmpty) {
          return Center(
            child: Text(
              'No Task Found',
              style: theme.typography.bodyMedium.copyWith(color: Colors.grey),
            ),
          );
        }
        return ListView.builder(
            itemCount: taskController.tasks.length,
            itemBuilder: (context, index) {
              TaskModel task = taskController.tasks[index];
              return Card(
                child: ListTile(
                  title: Text(
                    task.title,
                    style: theme.typography.titleMedium,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.description,
                        style: theme.typography.bodySmall
                            .copyWith(color: Colors.grey),
                      ),
                      SizedBox(height: 5),
                      DropdownButton<String>(
                        focusColor: theme.primary,
                        value: task.status,
                        items: ["Incomplete", "In Progress", "Complete"]
                            .map((status) => DropdownMenuItem(
                                  value: status,
                                  child: Text(
                                    status,
                                    style: theme.typography.bodySmall,
                                  ),
                                ))
                            .toList(),
                        onChanged: (newStatus) {
                          if (newStatus != null) {
                            taskController.updateTaskStatus(index, newStatus);
                          }
                        },
                      ),
                    ],
                  ),
                  trailing: CircleAvatar(
                    backgroundColor: theme.primary.withOpacity(0.1),
                    child: IconButton(
                      icon:
                          Icon(Icons.delete_sweep_outlined, color: Colors.red),
                      onPressed: () => taskController.deleteTask(index),
                    ),
                  ),
                ),
              );
            });
      }),
    );
  }
}
