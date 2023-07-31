import 'package:flutter/material.dart';
import '../constants/color_constants.dart';
import '../constants/font_constants.dart';
import 'common_widgets.dart';

class CustomButton {
  static GestureDetector fillButton({
    required BuildContext? context,
    Color? backGroundColor,
    Color textColor = ColorConstants.whiteColor,
    String? text,
    FontWeight? fontWeight,
    String? fontFamily = FontFamilyConstants.cabin,
    VoidCallback? function,
    Gradient? gradient,
    double? fontSize,
    double width = 300.0,
    double? height = 42.0,
    bool? isLoading = false,
  }) {
    return GestureDetector(
      onTap: () {
        CommonWidgets().hideKeyboard(context!);
        function?.call();
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          color: backGroundColor,
          gradient: gradient,
        ),
        child: Center(
          child: Text(
            text ?? "",
            style: TextStyle(
              color: textColor,
              fontWeight: fontWeight ?? FontWeightConstants.semi_bold,
              fontFamily: fontFamily,
              fontSize: fontSize ?? FontConstants.font_14,
            ),
          ),
        ),
      ),
    );
  }
}
