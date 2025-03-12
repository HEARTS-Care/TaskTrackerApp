import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nasifay/model/task_model.dart';

class TaskController extends GetxController {
  final storage = GetStorage();
  var tasks = <TaskModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadTasks();
  }

  void loadTasks() {
    List<dynamic>? storedTasks = storage.read<List>("tasks");

    if (storedTasks != null) {
      tasks.assignAll(storedTasks.map((e) => TaskModel.fromJson(e)).toList());
    }
  }

  void saveTasks() {
    storage.write("tasks", tasks.map((e) => e.toJson()).toList());
  }

  void addTask(TaskModel task) {
    tasks.add(task);
    saveTasks();
    Get.snackbar("Success", "Task added successfully!");
  }

  void updateTask(int index, TaskModel updatedTask) {
    tasks[index] = updatedTask;
    tasks.refresh();
    saveTasks();
    Get.snackbar("Updated", "Task  updated!");
  }

  void updateTaskStatus(int index, String newStatus) {
    tasks[index].status = newStatus;
    tasks.refresh();
    saveTasks();
    Get.snackbar("Updated", "Task status updated to $newStatus");
  }

  void deleteTask(int index) {
    tasks.removeAt(index);
    saveTasks();
    Get.snackbar("Deleted", "Task removed successfully!");
  }
}
