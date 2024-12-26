import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utilities/style/app_colors.dart';
import '../../../core/utilities/style/app_fonts.dart';
class CustomButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final bool cheekBackGroundColor;
  final Color? color;
  final Color? textColor;
  const CustomButtonWidget(
      {super.key,
      this.onPressed,
      required this.text,
      this.cheekBackGroundColor = true,
      this.color,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: _getColor(color, cheekBackGroundColor),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.h),
              side: color != null
                  ?  const BorderSide(color: AppColors.kGray)
                  :  const BorderSide(color: AppColors.kWhiteBase)),
        ),
        child: Text(
          text,
          style: AppFonts.font16kBlackWeight500Font.copyWith(
            color: _getTextColor(textColor)
          ) // Corrected style name
        ),
      ),
    );
  }

  Color _getColor(Color? color, bool backGroundColor) {
    if (color != null) {
      return color;
    } else {
      return !cheekBackGroundColor ?AppColors.lightGray : AppColors.mainColor;
    }
  }

  Color _getTextColor(Color? color) {
    if (color != null) {
      return color;
    } else {
      return AppColors.kWhiteBase;
    }
  }
}
