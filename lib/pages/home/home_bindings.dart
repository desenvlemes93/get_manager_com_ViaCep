import 'package:get/get.dart';
import 'package:get_state_manager/pages/home/home_controller.dart';
import 'package:get_state_manager/pages/home/home_controller_State_mixin.dart';
import 'package:get_state_manager/repository/cep_repository.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CepRepository());
    // Get.put(
    //   HomeController(
    //     Get.find(),
    //   ),
    // );
    Get.put(
      HomeControllerStateMixin(
        Get.find(),
      ),
    );
  }
}
