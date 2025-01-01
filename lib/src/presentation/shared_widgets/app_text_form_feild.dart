import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utilities/style/app_colors.dart';
class CustomTextFromField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final String? Function(String?)? validator;
  final bool isObscureText;
  final TextInputType inputType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function(String)? onChanged;
  final int maxLine;
  final TextStyle  ? hintStyle;
  final String obscuringCharacter;
  const CustomTextFromField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    this.validator,
    this.isObscureText = false,
    this.inputType = TextInputType.none,
    this.hintStyle,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLine = 1,
    this.onChanged,
    this.obscuringCharacter= '*',
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: inputType,
      obscureText: isObscureText,
      maxLines: maxLine,
      onChanged: onChanged,
      obscuringCharacter: obscuringCharacter,

      style: TextStyle(
        fontSize: 17.sp,
        color: AppColors.kBlack100,
        fontWeight: FontWeight.w400
      ),

      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(

        filled: true,
        errorMaxLines: 1,
        helperMaxLines: 1,
        fillColor: AppColors.kWhiteBase,
        hintText:  hintText,
        hintStyle:hintStyle ?? TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.kWhite70,
        ),
        suffixIcon: suffixIcon,
        labelText: labelText,
        enabled: true,
        floatingLabelStyle:
        WidgetStateTextStyle.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.error)) {
            return const TextStyle(color: AppColors.kRed);
          } else if (states.contains(MaterialState.focused)) {
            return const TextStyle(color: AppColors.kGray);
          }
          return const TextStyle(color: Colors.grey);
        }),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.kGray,
        ),
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.sp),
          borderSide: const BorderSide(
            color: AppColors.kGray,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.kGray,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.kGray,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.kRed,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.kRed,
          ),
        ),
        errorStyle: const TextStyle(
          color: AppColors.kRed,
          fontSize: 14,
        ),
      ),
    );
  }
}
