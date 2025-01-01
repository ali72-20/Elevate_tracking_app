import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/utilities/style/spacing.dart';
import 'package:tracking_app/src/presentation/managers/forget_password/forget_password_screen_actions.dart';
import 'package:tracking_app/src/presentation/managers/forget_password/forget_password_screen_view_model.dart';

import '../../../../core/common/common_imports.dart';
import '../../../../core/utilities/style/app_colors.dart';
import '../../../../core/utilities/style/app_text_styles.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ForgetPasswordScreenViewModel>();
    return Form(
      key: viewModel.newPasswordKey,
      child: Column(
        children: [
          TextFormField(
            controller: viewModel.newPasswordController,
            decoration: InputDecoration(
              label: Text(
                AppLocalizations.of(context)!.newPassword,
                style: AppTextStyles.font12Regular,
              ),
              hintText: AppLocalizations.of(context)!.enterYourPassword,
              hintStyle: AppTextStyles.font14Regular
                  .copyWith(color: AppColors.kWhite70),
            ),
            validator: (value) {
              return viewModel.validateNewPassword();
            },
            onChanged: (value){
              viewModel.doAction(ValidateFieldsAction());
            },
          ),
          verticalSpace(24),
          TextFormField(
            controller: viewModel.confirmNewPasswordController,
            decoration: InputDecoration(
              label: Text(
                AppLocalizations.of(context)!.confirmPassword,
                style: AppTextStyles.font12Regular,
              ),
              hintText: AppLocalizations.of(context)!.enterYourPassword,
              hintStyle: AppTextStyles.font14Regular
                  .copyWith(color: AppColors.kWhite70),
            ),
            validator: (value){
              return viewModel.validateConfirmNewPassword();
            },
            onChanged: (value){
              viewModel.doAction(ValidateFieldsAction());
            },
          ),
        ],
      )
    );
  }
}
