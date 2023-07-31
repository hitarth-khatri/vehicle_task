import 'package:get/get.dart';
import 'package:vehicle_task/pages/splash/splash_controller.dart';

class SplashBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
  }
}
