import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:lottie/lottie.dart';
import 'package:vehicle_task/common/constants/image_constants.dart';
import 'package:vehicle_task/pages/splash/splash_controller.dart';

import '../../common/constants/color_constants.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      body: Container(
        alignment: Alignment.center,
        child: Lottie.asset(
          ImageConstants.splashImage,
        ),
      ),
    );
  }
}
