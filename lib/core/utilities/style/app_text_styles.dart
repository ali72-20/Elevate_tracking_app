import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracking_app/core/utilities/style/app_colors.dart';
import 'package:tracking_app/core/utilities/style/app_font_weights.dart';

class AppTextStyles{
  AppTextStyles._();
   static TextStyle font16Medium = TextStyle(
     fontSize: 15.sp,
     color: AppColors.kWhiteBase,
     fontWeight: AppFontWeights.medium
  );
}
