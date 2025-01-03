import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/extensions/extensions.dart';
import 'package:tracking_app/core/utilities/style/app_colors.dart';
import 'package:tracking_app/core/utilities/style/app_text_styles.dart';
import 'package:tracking_app/core/utilities/style/spacing.dart';
import 'package:tracking_app/src/presentation/managers/Auth/change_password/change_password_actions.dart';
import 'package:tracking_app/src/presentation/managers/Auth/change_password/change_password_states.dart';
import 'package:tracking_app/src/presentation/managers/Auth/change_password/change_password_view_model.dart';

class ChangePasswordScreenBody extends StatelessWidget {
  const ChangePasswordScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ChangePasswordViewModel>();
    Color textFormFieldLabelColor = AppColors.kGray;
    return BlocConsumer<ChangePasswordViewModel, ChangePasswordStates>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Form(
              key: viewModel.formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: viewModel.oldPasswordController,
                    decoration: InputDecoration(
                      hintText: context.localization.currentPassword,
                      hintStyle:  AppTextStyles.font14Regular.copyWith(color: AppColors.kWhite70),
                      label: Text(
                        context.localization.currentPassword,
                        style: AppTextStyles.font14Regular.copyWith(color: textFormFieldLabelColor),
                      ),
                    ),
                    validator: (value)=>  viewModel.validateFields(ChangePasswordScreenInputField.oldPassword),
                    onChanged: (value) {
                      viewModel.doAction(CheckInputValidation());
                    },
                  ),
                  verticalSpace(24),
                  TextFormField(
                    controller: viewModel.newPasswordController,
                    decoration: InputDecoration(
                      hintText: context.localization.newPassword,
                      hintStyle: AppTextStyles.font14Regular.copyWith(color: AppColors.kWhite70),
                      label: Text(
                        context.localization.newPassword,
                        style: AppTextStyles.font14Regular.copyWith(color: textFormFieldLabelColor),
                      ),
                    ),
                    validator: (value) =>   viewModel.validateFields(ChangePasswordScreenInputField.newPassword),
                    onChanged: (value) {
                      viewModel.doAction(CheckInputValidation());
                    },
                  ),
                  verticalSpace(24),
                  TextFormField(
                    controller: viewModel.confirmPasswordController,
                    decoration: InputDecoration(
                      hintText: context.localization.confirmPassword,
                      hintStyle:  AppTextStyles.font14Regular.copyWith(color: AppColors.kWhite70),
                      label: Text(
                        context.localization.confirmPassword,
                        style: AppTextStyles.font14Regular.copyWith(color: textFormFieldLabelColor),
                      ),
                    ),
                    validator: (value) =>
                        viewModel.validateFields(ChangePasswordScreenInputField.confirmPassword),
                    onChanged: (value) {
                      viewModel.doAction(CheckInputValidation());
                    },
                  ),
                  verticalSpace(48),
                  SizedBox(
                    width: context.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          disabledBackgroundColor: AppColors.kBlack30),
                      onPressed: viewModel.isButtonEnabled
                          ? () => viewModel.doAction(ChangePasswordAction())
                          : null,
                      child: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Text(
                          context.localization.update,
                          style: AppTextStyles.font16Medium
                              .copyWith(color: AppColors.kWhiteBase),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        listener: (context, state) {
           if(state is FailureValidateAllFieldsState){
             textFormFieldLabelColor = AppColors.kRed;
           }
           if(state is SuccessValidateAllFieldsState){
             textFormFieldLabelColor = AppColors.kGray;
           }
        });
  }
}
