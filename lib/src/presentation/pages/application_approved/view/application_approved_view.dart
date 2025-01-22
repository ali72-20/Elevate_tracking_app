import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tracking_app/core/extensions/extensions.dart';
import 'package:tracking_app/core/routes/page_route_name.dart';
import 'package:tracking_app/core/utilities/style/app_fonts.dart';
import 'package:tracking_app/core/utilities/style/app_images.dart';
import 'package:tracking_app/core/utilities/style/spacing.dart';

import '../../../shared_widgets/custom_button_widget.dart';

class ApplicationApprovedView extends StatelessWidget {
  const ApplicationApprovedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(AppImages.backGroundAppApproved))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  height: 180.h,
                  width: 160.h,
                  AppImages.checkCircle,
                  semanticsLabel: 'Dart Logo',
                ),
                verticalSpace(24),
                Text(
                  context.localizations.submittedMessage,
                  style: AppFonts.font18BlackWeight600Font,
                  textAlign: TextAlign.center,
                ),
                verticalSpace(16),
                Text(
                  context.localizations.thankYouMessage,
                  style: AppFonts.font16kGrayWeight400Font,
                  textAlign: TextAlign.center,
                ),
                verticalSpace(24),
                CustomButtonWidget(
                  text: context.localizations.login,
                  cheekBackGroundColor: true,
                  onPressed: () => _goNextToLoginScreen(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _goNextToLoginScreen(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      PageRoutesName.login,
      (route) => false,
    );
  }
}
