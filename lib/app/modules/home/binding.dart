import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:task_assisance/app/data/providers/task/provider.dart';
import 'package:task_assisance/app/data/service/Storage/repository.dart';
import 'package:task_assisance/app/modules/home/controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(
            taskRepository: TaskRepository(
          taskProvider: TaskProvider(),
        )));
  }
}
