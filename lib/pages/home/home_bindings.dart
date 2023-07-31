import 'package:get/get.dart';
import 'package:vehicle_task/pages/home/home_controller.dart';

import '../../repository/auth_repository.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl());
    Get.put<HomeController>(HomeController());
  }
}
