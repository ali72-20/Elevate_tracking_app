import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/extensions/extensions.dart';

import '../../../../../core/utilities/style/app_fonts.dart';
import '../../../managers/login/login_action.dart';
import '../../../managers/login/login_cubit.dart';
class ForgetPasswordButtonWidget extends StatelessWidget {
  const ForgetPasswordButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var loginViewModel=context.read<LoginCubit>();
    return   Align(
        alignment: Alignment.bottomRight,
        child: TextButton(
          onPressed: ()=>loginViewModel.doAction(NavigateToForgetPasswordScreenAction()),
          child: Text(
            context.localizations.forgetPassword,
            style: AppFonts.font12BlackWeight400Font.copyWith(
              decoration: TextDecoration.underline
            ),
            textAlign: TextAlign.left,
          ),
        ));

  }
}
