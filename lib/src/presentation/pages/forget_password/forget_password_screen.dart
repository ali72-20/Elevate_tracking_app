import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/di/di.dart';
import 'package:tracking_app/core/utilities/style/app_text_styles.dart';
import 'package:tracking_app/src/presentation/managers/forget_password/forget_password_screen_actions.dart';
import 'package:tracking_app/src/presentation/managers/forget_password/forget_password_screen_states.dart';
import 'package:tracking_app/src/presentation/managers/forget_password/forget_password_screen_view_model.dart';
import 'package:tracking_app/src/presentation/pages/forget_password/enter_email_widget.dart';

import '../../../../core/common/common_imports.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  final viewModel = getIt.get<ForgetPasswordScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    List<Widget> _currentView = [const EnterEmailWidget()];
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
          title: Text(AppLocalizations.of(context)!.password, style: AppTextStyles.font20Medium,),
        ),
        body: BlocConsumer<ForgetPasswordScreenViewModel,
            ForgetPasswordScreenStates>(
          builder: (context, state) {
            return const EnterEmailWidget();
          },
          listener: (context, state) {

          },
        ),
      )),
    );
  }
}
