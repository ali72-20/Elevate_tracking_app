import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracking_app/core/extensions/extensions.dart';
import 'package:tracking_app/core/routes/page_route_name.dart';
import 'package:tracking_app/src/data/api/core/errors/error_handler.dart';
import 'package:tracking_app/src/tracking_app.dart';

import '../../../../../core/di/di.dart';
import '../../../../../core/utilities/dialogs/awesome_dialoge.dart';
import '../../../../../core/utilities/dialogs/loading_dialog.dart';
import '../../../managers/login/login_cubit.dart';
import '../widget/login_body_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var loginViewModel = getIt.get<LoginCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => loginViewModel,
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) => _handleBlocListenerState(state),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              context.localizations.login,
            ),
          ),
          body: Padding(
              padding: EdgeInsets.all(16.r), child: const LoginBodyWidget()),
        ),
      ),
    );
  }

  void _handleBlocListenerState(LoginState state) {
    if (state is LoginLoadingState) {
      LoadingDialog.show(context);
    } else if (state is LoginFailuresState) {
      LoadingDialog.hide(context);
      final errorMassage =
          ErrorHandler.fromException(state.exception, context.localizations);
      showAwesomeDialog(
        context,
        title: "Error",
        desc: errorMassage.errorMassage,
        onOk: () {},
        dialogType: DialogType.error,
      );
    } else if (state is LoginSuccessState) {
    } else if (state is NavigateToForgetPasswordScreenState) {
      LoadingDialog.hide(context);
      _navigateToForgetPasswordScreen();
    } else if (state is NavigateToBaseScreenState) {
      LoadingDialog.hide(context);
      _navigateToBaseScreen();
    }
  }

  void _navigateToBaseScreen() {
    navKey.currentState!.pushNamedAndRemoveUntil(
      PageRoutesName.sectionScreen,
      (route) => false,
    );
  }

  void _navigateToForgetPasswordScreen() {
    Navigator.pushNamed(context, PageRoutesName.forgetPassword);
  }
}
