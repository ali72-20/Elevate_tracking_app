import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/extensions/extensions.dart';

import '../../../managers/login/login_action.dart';
import '../../../managers/login/login_cubit.dart';
import '../../../shared_widgets/custom_button_widget.dart';

class LoginButtonSubmit extends StatelessWidget {
  const LoginButtonSubmit({super.key});

  @override
  Widget build(BuildContext context) {
    var loginViewModel = context.read<LoginCubit>();
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return CustomButtonWidget(
          text: context.localizations.continues,
          cheekBackGroundColor: loginViewModel.isFormValid,
          onPressed: () {
            if (loginViewModel.isFormValid) {
              loginViewModel.doAction(ButtonLoginAction());
            }
          },
        );
      },
    );
  }
}
