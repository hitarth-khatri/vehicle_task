import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/color_constants.dart';
import '../constants/font_constants.dart';
import '../constants/string_constants.dart';
import 'custom_button.dart';

class CommonWidgets {
  handleErrorDialog(String msg, BuildContext context) {
    return Get.defaultDialog(
      title: "",
      contentPadding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      middleText: msg,
      onConfirm: () {
        if (Get.overlayContext != null) {
          Navigator.of(Get.overlayContext!).pop();
        }
      },
      confirm: CustomButton.fillButton(
        width: 60,
        height: 36,
        context: context,
        function: () {
          Navigator.of(Get.overlayContext!).pop();
        },
        text: StringConstants.okay,
        fontSize: FontConstants.font_18,
        backGroundColor: ColorConstants.primaryColor,
      ),
      radius: 10,
      middleTextStyle: const TextStyle(
        color: ColorConstants.blackColor,
        fontSize: FontConstants.font_14,
        fontWeight: FontWeightConstants.regular,
      ),
    );
  }

  hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static Future<bool> checkConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      showSnackBar(StringConstants.msgCheckConnection);
      return false;
    } else {
      return true;
    }
  }

  static showSnackBar(String message, {Color? bgColor}) {
    if (!Get.isSnackbarOpen) {
      Get.snackbar(
        '',
        '',
        snackPosition: SnackPosition.TOP,
        snackStyle: SnackStyle.FLOATING,
        messageText: Text(message),
        titleText: Container(),
        backgroundColor: bgColor ?? Colors.white,
        colorText: Theme.of(Get.context!).colorScheme.surface,
        isDismissible: false,
        animationDuration: const Duration(milliseconds: 500),
        duration: const Duration(seconds: 2),
        margin: const EdgeInsets.all(10.0),
      );
    }
  }

  static Widget commonText({
    Color? color,
    double? fontSize,
    double? height,
    String? text,
    FontWeight? fontWeight,
    int? maxLine = 3,
    TextAlign? textAlign,
    String fontFamily = FontFamilyConstants.barlow,
  }) {
    return Text(
      text ?? "",
      maxLines: maxLine,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        height: height,
        fontWeight: fontWeight,
        overflow: TextOverflow.ellipsis,
        fontFamily: fontFamily,
      ),
    );
  }
}
