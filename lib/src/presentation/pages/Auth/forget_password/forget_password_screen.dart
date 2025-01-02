import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/di/di.dart';
import 'package:tracking_app/core/utilities/style/app_colors.dart';
import 'package:tracking_app/core/utilities/style/app_text_styles.dart';
import 'package:tracking_app/src/data/api/core/errors/error_handler.dart';
import 'package:tracking_app/src/presentation/managers/Auth/forget_password/forget_password_screen_actions.dart';
import 'package:tracking_app/src/presentation/managers/Auth/forget_password/forget_password_screen_states.dart';
import 'package:tracking_app/src/presentation/managers/Auth/forget_password/forget_password_screen_view_model.dart';
import 'package:tracking_app/src/presentation/pages/Auth/forget_password/enter_email_view.dart';
import 'package:tracking_app/src/presentation/pages/Auth/forget_password/otp_confirm_view.dart';

import '../../../../../core/common/common_imports.dart';
import 'reset_passowrd_view.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  final viewModel = getIt.get<ForgetPasswordScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    List<Widget> _currentView = [
      const EnterEmailView(),
      const OtpConfirmView(),
      const ResetPasswordView()
    ];
    return BlocProvider(
      create: (_) => viewModel,
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              viewModel.doAction(GoToPrevStateAction());
            },
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
          title: Text(
            AppLocalizations.of(context)!.password,
            style: AppTextStyles.font20Medium,
          ),
        ),
        body: BlocConsumer<ForgetPasswordScreenViewModel,
            ForgetPasswordScreenStates>(
          builder: (context, state) {
            return _currentView[viewModel.currentStateIndex];
          },
          listener: (context, state) {
            if (state is LoadingState) {
              ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(
                  content: Text(AppLocalizations.of(context)!.loading),
                ),
              );
            }
            if (state is SuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.message!,
                    style: AppTextStyles.font14Regular.copyWith(
                      color: AppColors.kWhiteBase,
                    ),
                  ),
                  backgroundColor: AppColors.kSuccess,
                ),
              );
            }
            if(state is FailureState){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    ErrorHandler.fromException(state.exception!, AppLocalizations.of(context)!).errorMassage,
                    style: AppTextStyles.font14Regular.copyWith(
                      color: AppColors.kWhiteBase,
                    ),
                  ),
                  backgroundColor: AppColors.kError,
                ),
              );
            }
            if (state is GoToLoginScreenState) {
              // navigate to login screen
            }
          },
        ),
      )),
    );
  }
}
