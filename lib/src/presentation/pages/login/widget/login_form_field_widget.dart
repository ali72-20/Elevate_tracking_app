import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/extensions/extensions.dart';
import 'package:tracking_app/src/presentation/managers/login/login_action.dart';

import '../../../../../core/utilities/functions/validators/validations.dart';
import '../../../../../core/utilities/style/spacing.dart';
import '../../../managers/login/login_cubit.dart';
import '../../../shared_widgets/app_text_form_feild.dart';

class LoginFormFieldWidget extends StatelessWidget {
  const LoginFormFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var loginViewModel = context.read<LoginCubit>();
    return Form(
      key: loginViewModel.formKey,
      onChanged: () => loginViewModel.doAction(UpdateFormFieldAction()),
      child: Column(
        children: [
          _buildEmailField(context, loginViewModel.emailController),
          verticalSpace(24),
          _buildPasswordField(context, loginViewModel.passwordController)
        ],
      ),
    );
  }

  Widget _buildEmailField(
      BuildContext context, TextEditingController controller) {
    return CustomTextFromField(
      controller: controller,
      labelText: context.localizations.email,
      hintText: context.localizations.enterEmail,
      validator: Validations.validateEmail,
    );
  }

  Widget _buildPasswordField(
      BuildContext context, TextEditingController controller) {
    var loginCubit = BlocProvider.of<LoginCubit>(context);
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return CustomTextFromField(
          controller: controller,
          labelText: context.localizations.password,
          hintText: context.localizations.enterPassword,
          validator: Validations.validatePassword,
          isObscureText: loginCubit.isObscureText,
          suffixIcon: IconButton(
              onPressed: () => loginCubit.doAction(ChangeIsObscureTextAction()),
              icon: loginCubit.isObscureText
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off)),
        );
      },
    );
  }
}
