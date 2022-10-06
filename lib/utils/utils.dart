import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

const printLogTag = "[SINGLE_TV_FLUTTER]";
//make print log enable to false to stop print printLog
const printLogEnable = true;

printLog(dynamic data) {
  if (printLogEnable) {
    if (kDebugMode) {
      print("$printLogTag: ${data.toString()}");
    }
  }
}

verticalSpacing(double value) {
  return SizedBox(height: value.h);
}

horizontalSpacing(double value) {
  return SizedBox(width: value.w);
}

showErrorDialog({required String message}) {
  return AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: "Error",
          desc: message,
          btnCancelOnPress: () {},
          btnOkOnPress: () {},
          enableEnterKey: true)
      .show();
}
