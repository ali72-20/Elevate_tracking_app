import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:tracking_app/core/utilities/style/app_images.dart';

class LoadingDialog {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
       return  Center(
         child: Lottie.asset(
           AppImages.loading,
           width: 150.w,
           height: 150.h,
           fit: BoxFit.cover,
         ),
       );
      },
    );
  }
  static void hide(BuildContext context) {
    if(Navigator.canPop(context)){
      Navigator.pop(context);
    }
  }
}