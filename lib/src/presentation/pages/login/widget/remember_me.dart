import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/extensions/extensions.dart';
import 'package:tracking_app/core/utilities/style/app_colors.dart';
import 'package:tracking_app/src/presentation/managers/login/login_cubit.dart';

import '../../../../../core/common/common_imports.dart';
import '../../../../../core/utilities/style/app_fonts.dart';
import '../../../managers/login/login_action.dart';

class RememberMeWidget extends StatelessWidget {
  const RememberMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var loginCubit = context.read<LoginCubit>();
    return BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
      return Row(
        children: [
          Checkbox(
            checkColor: AppColors.kWhiteBase,
            activeColor: AppColors.mainColor,
            value: loginCubit.isBoxChecked,
            onChanged: (value) => loginCubit.doAction(ChangeBoxLoginAction()),
          ),
          Text(
            context.localizations.rememberMe,
            style: AppFonts.font13BlackWeight400Font,
          ),
        ],
      );
    });
  }
}
