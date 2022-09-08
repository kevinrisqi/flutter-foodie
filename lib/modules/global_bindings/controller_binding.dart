import 'package:foodie/modules/global_controllers/connection_controller.dart';
import 'package:get/get.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConnectionManagerController>(() => ConnectionManagerController());
  }
}
