import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/common_imports.dart';
import '../../../../core/utilities/style/app_colors.dart';
import '../../../../core/utilities/style/app_text_styles.dart';
import '../../managers/forget_password/forget_password_screen_actions.dart';
import '../../managers/forget_password/forget_password_screen_view_model.dart';

class TimerAndResendRowWidget extends StatefulWidget {
  const TimerAndResendRowWidget({super.key});

  @override
  State<TimerAndResendRowWidget> createState() =>
      _TimerAndResendRowWidgetState();
}

class _TimerAndResendRowWidgetState extends State<TimerAndResendRowWidget> {
  int _timeRemaining = 30;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeRemaining == 0) {
        timer.cancel();
      } else {
        setState(() {
          _timeRemaining--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ForgetPasswordScreenViewModel>();
    return _timeRemaining == 0
        ? _resendOtp(context, viewModel)
        : _buildTimer(_timeRemaining);
  }
}

Widget _buildTimer(int time) {
  return Text(
    "Resend after: 00:$time",
    style: AppTextStyles.font16Regular.copyWith(color: AppColors.kBlack),
  );
}

Widget _resendOtp(
    BuildContext context, ForgetPasswordScreenViewModel viewModel) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        AppLocalizations.of(context)!.didnotReceiveCode,
        style: AppTextStyles.font16Regular.copyWith(color: AppColors.kBlack),
      ),
      InkWell(
        onTap: () {
          viewModel.doAction(ResendOtpAction());
        },
        child: Text(
          textAlign: TextAlign.center,
          AppLocalizations.of(context)!.resend,
          style: AppTextStyles.font16Regular.copyWith(
              color: AppColors.kBaseColor,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.kBaseColor),
        ),
      ),
    ],
  );
}
