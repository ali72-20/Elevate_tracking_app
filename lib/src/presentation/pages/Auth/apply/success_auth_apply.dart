import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tracking_app/core/extensions/extensions.dart';
import 'package:tracking_app/core/utilities/style/app_colors.dart';
import 'package:tracking_app/core/utilities/style/app_images.dart';
import 'package:tracking_app/core/utilities/style/app_text_styles.dart';
import 'package:tracking_app/core/utilities/style/spacing.dart';

class SuccessAuthApply extends StatelessWidget {
  const SuccessAuthApply({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: context.width,
        height: double.infinity,
        child: Center(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppImages.successApply),
                    verticalSpace(24),
                    Text(
                      textAlign: TextAlign.center,
                      context.localization.applicationSuccess,
                      style: AppTextStyles.font18SemiBold,
                    ),
                    verticalSpace(16),
                    Text(
                      textAlign: TextAlign.center,
                      context.localization.applicationSuccessMessage,
                      style: AppTextStyles.font16Regular
                          .copyWith(color: AppColors.kGray),
                    ),
                    verticalSpace(24),
                    SizedBox(
                      width: context.width,
                      child: ElevatedButton(
                          onPressed: () {

                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            child: Text(
                              context.localization.login,
                              style: AppTextStyles.font16Medium
                                  .copyWith(color: AppColors.kWhiteBase),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SvgPicture.asset(
                  AppImages.successBg,
                  width: context.width,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
