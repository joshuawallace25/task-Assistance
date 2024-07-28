import 'dart:convert';

import 'package:get/get.dart';
import 'package:task_assisance/app/core/utils/keys.dart';
import 'package:task_assisance/app/data/models/task.dart';
import 'package:task_assisance/app/data/service/Storage/service.dart';

class TaskProvider {
 final StorageService storage = Get.find<StorageService>();

/* {'task': [
    {'title': 'Work',
      'color': '#ff123456',
      'icon': 0xe123}
      ]} */

  List<Task> readTasks() {
    var tasks = <Task>[];
    jsonDecode(storage.read(taskKey).toString())
        .forEach((e) => tasks.add(Task.fromJson(e)));
    return tasks;
  }

  void writeTasks(List<Task> tasks) {
    storage.write(taskKey, jsonEncode(tasks));
  }
}
