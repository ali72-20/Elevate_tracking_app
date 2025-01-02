import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/common/common_imports.dart';
import 'package:tracking_app/core/extensions/extensions.dart';
import 'package:tracking_app/core/utilities/style/app_colors.dart';
import 'package:tracking_app/core/utilities/style/app_text_styles.dart';
import 'package:tracking_app/core/utilities/style/spacing.dart';
import 'package:tracking_app/src/presentation/managers/Auth/forget_password/forget_password_screen_view_model.dart';
import 'otp_code_form_row.dart';
import 'timer_and_resend_row_widget.dart';

class OtpConfirmView extends StatelessWidget {
  const OtpConfirmView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ForgetPasswordScreenViewModel>();
    return SizedBox(
      width: context.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.emailVerification,
              style: AppTextStyles.font18Medium,
            ),
            verticalSpace(16),
            Text(
              AppLocalizations.of(context)!.enterOtpCode,
              style:
                  AppTextStyles.font14Regular.copyWith(color: AppColors.kGray),
              textAlign: TextAlign.center,
            ),
            verticalSpace(32),
            const OtpCodeFormRow(),
            verticalSpace(24),
            const TimerAndResendRowWidget()
          ],
        ),
      ),
    );
  }
}
