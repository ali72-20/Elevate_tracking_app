import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/utilities/style/app_colors.dart';
import 'package:tracking_app/core/utilities/style/app_text_styles.dart';
import 'package:tracking_app/core/utilities/style/spacing.dart';
import 'package:tracking_app/src/presentation/managers/forget_password/forget_password_screen_actions.dart';
import 'package:tracking_app/src/presentation/managers/forget_password/forget_password_screen_view_model.dart';

import '../../../../core/common/common_imports.dart';

class EnterEmailWidget extends StatelessWidget {
  const EnterEmailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ForgetPasswordScreenViewModel>();
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(AppLocalizations.of(context)!.forgetPasswordKey,style: AppTextStyles.font18Medium,),
            verticalSpace(16),
            Text(AppLocalizations.of(context)!.enterEmailAssociatedWithYourAccount,style: AppTextStyles.font14Regular.copyWith(color: AppColors.kGray),),
            verticalSpace(32),
            TextFormField(
              controller: viewModel.emailController,
              decoration: InputDecoration(
                label: Text(AppLocalizations.of(context)!.email, style: AppTextStyles.font12Regular,),
                hintText: AppLocalizations.of(context)!.enterYourEmail,
                hintStyle: AppTextStyles.font14Regular.copyWith(color: AppColors.kWhite70),
              ),
              validator: (value){
                if(value!.isEmpty){
                  return AppLocalizations.of(context)!.emailNotValid;
                }
                return null;
              },
              onSaved: (value){
                viewModel.emailController.text = value!;
              },
            ),
            verticalSpace(48),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){
                  viewModel.doAction(ConfirmEmailAction());
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: Text(AppLocalizations.of(context)!.confirm,style: AppTextStyles.font16Medium,),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
