import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:tracking_app/core/common/common_imports.dart';
import 'package:tracking_app/core/extensions/extensions.dart';
import 'package:tracking_app/core/utilities/style/app_animations.dart';
import 'package:tracking_app/core/utilities/style/app_colors.dart';
import 'package:tracking_app/core/utilities/style/app_images.dart';
import 'package:tracking_app/core/utilities/style/app_text_styles.dart';
import 'package:tracking_app/core/utilities/style/spacing.dart';
import 'package:tracking_app/src/presentation/managers/on_boarding/on_boarding_actions.dart';
import 'package:tracking_app/src/presentation/managers/on_boarding/on_boarding_view_model.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<OnBoardingViewModel>();
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            width: context.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: context.width,
                  child: Lottie.asset(AppAnimations.onBoardingAnimation,
                      width: context.width,
                      height: 400.w, alignment: Alignment.center, fit: BoxFit.fill),
                ),
                Text(
                  context.localization.welcomeTo,
                  style: AppTextStyles.font20Medium,
                  textAlign: TextAlign.start,
                ),
                Text(
                  context.localization.floweryRiderApp,
                  style: AppTextStyles.font20Medium,
                  textAlign: TextAlign.start,
                ),
                verticalSpace(24),
                SizedBox(
                  width: context.width,
                  child: ElevatedButton(
                    onPressed: () {
                      viewModel.doAction(GoToLogin());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Text(
                        context.localization.login,
                        style: AppTextStyles.font20Medium
                            .copyWith(color: AppColors.kWhiteBase),
                      ),
                    ),
                  ),
                ),
                verticalSpace(16),
                SizedBox(
                  width: context.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.kWhiteBase,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                            side: const BorderSide(
                                color: AppColors.kBlack, width: 1.5))),
                    onPressed: () {
                      viewModel.doAction(GoToApply());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Text(
                        context.localization.applyNow,
                        style: AppTextStyles.font20Medium
                            .copyWith(color: AppColors.kBlack),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              "v 6.3.0 - (446)",
              style: AppTextStyles.font11Regular,
            ),
          ),
        ),
      ],
    );
  }
}
