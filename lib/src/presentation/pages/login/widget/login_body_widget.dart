import 'package:flutter/material.dart';
import 'package:tracking_app/src/presentation/pages/login/widget/remember_me_and_forget_password_widget.dart';
import '../../../../../core/utilities/style/spacing.dart';
import 'login_button_submit.dart';
import 'login_form_field_widget.dart';

class LoginBodyWidget extends StatelessWidget {
  const LoginBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const LoginFormFieldWidget(),
        verticalSpace(16),
        const RememberMeAndForgetPasswordWidget(),
        verticalSpace(48),
        const LoginButtonSubmit(),
      ],
    );
  }
}
