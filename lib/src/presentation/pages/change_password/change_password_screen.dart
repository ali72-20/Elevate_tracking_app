import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:tracking_app/core/di/di.dart';
import 'package:tracking_app/core/extensions/extensions.dart';
import 'package:tracking_app/core/utilities/style/app_colors.dart';
import 'package:tracking_app/core/utilities/style/app_text_styles.dart';
import 'package:tracking_app/src/data/api/core/errors/error_handler.dart';
import 'package:tracking_app/src/presentation/managers/Auth/change_password/change_password_states.dart';
import 'package:tracking_app/src/presentation/managers/Auth/change_password/change_password_view_model.dart';

import 'change_password_screen_body.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});

  final viewModel = getIt.get<ChangePasswordViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => viewModel,
      child: BlocConsumer<ChangePasswordViewModel, ChangePasswordStates>(
        listener: (context, state) {
          if (state is FailureState) {
            IconSnackBar.show(
              context,
              label: ErrorHandler.fromException(
                      state.exception!, context.localization)
                  .errorMassage,
              snackBarType: SnackBarType.fail,
            );
          }
          if (state is SuccessState) {
            IconSnackBar.show(
              context,
              label: context.localization.passwordChangedSuccessfully,
              snackBarType: SnackBarType.success,
            );
          }
          if(state is LoadingState){
            IconSnackBar.show(context, label:context.localization.loading, snackBarType: SnackBarType.alert);
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              Scaffold(
                appBar: AppBar(
                  title: Text(
                    context.localization.resetPassword,
                    style: AppTextStyles.font20Medium,
                  ),
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back_ios_new),
                  ),
                ),
                body: const ChangePasswordScreenBody(),
              ),
              if (state is LoadingState) ...[
                Positioned.fill(
                  child: ModalBarrier(
                    dismissible: false,
                    color: AppColors.kBlack.withOpacity(.4),
                  ),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}
