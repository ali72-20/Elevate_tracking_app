import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/extensions/extensions.dart';
import 'package:tracking_app/core/utilities/style/app_colors.dart';
import 'package:tracking_app/core/utilities/style/app_text_styles.dart';
import 'package:tracking_app/core/utilities/style/spacing.dart';
import 'package:tracking_app/src/presentation/managers/forget_password/forget_password_screen_states.dart';
import 'package:tracking_app/src/presentation/managers/forget_password/forget_password_screen_view_model.dart';
import 'package:tracking_app/src/presentation/pages/forget_password/reset_password_form.dart';

import '../../../../core/common/common_imports.dart';
import '../../managers/forget_password/forget_password_screen_actions.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ForgetPasswordScreenViewModel>();
    return BlocConsumer<ForgetPasswordScreenViewModel,
        ForgetPasswordScreenStates>(
      builder: (context, state) {
        return _ResetPasswordViewBody(viewModel, context);
      },
      listener: (context, state) {},
    );
  }

  Widget _ResetPasswordViewBody(
      ForgetPasswordScreenViewModel viewModel, BuildContext context) {
    Color _buttonColor = AppColors.kBaseColor;
    return SizedBox(
      width: context.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.resetPassword,
              style: AppTextStyles.font18Medium,
            ),
            verticalSpace(16),
            Text(
              textAlign: TextAlign.center,
              AppLocalizations.of(context)!.resetPasswordInstruction,
              style:
                  AppTextStyles.font14Regular.copyWith(color: AppColors.kGray),
            ),
            verticalSpace(32),
            const ResetPasswordForm(),
            verticalSpace(48),
            SizedBox(
              width: context.width,
              child: BlocBuilder<ForgetPasswordScreenViewModel,
                  ForgetPasswordScreenStates>(
                builder: (context, state) {
                  if (state is NotValidPasswordState ||
                      state is NotMatchPasswordState) {
                    _buttonColor = AppColors.kGray;
                  }
                  return ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: _buttonColor),
                    onPressed: () {
                      if (_buttonColor == AppColors.kBaseColor) {
                        viewModel.doAction(ResetPasswordAction());
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: Text(
                        AppLocalizations.of(context)!.confirm,
                        style: AppTextStyles.font16Medium,
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
