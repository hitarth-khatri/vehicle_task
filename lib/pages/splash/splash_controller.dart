import 'dart:async';
import 'package:get/get.dart';
import '../../routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    redirectToNextScreen();
    super.onInit();
  }

  void redirectToNextScreen() {
    Timer(
      const Duration(seconds: 3),
      () {
        Get.offAllNamed(Routes.home);
      },
    );
  }
}
