import 'package:tracking_app/src/presentation/pages/login/widget/remember_me.dart';

import '../../../../../core/common/common_imports.dart';
import 'forget_password_button_widget.dart';

class RememberMeAndForgetPasswordWidget extends StatelessWidget {
  const RememberMeAndForgetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return      const Row(
      children: [
        RememberMeWidget(),
        Spacer(),
        ForgetPasswordButtonWidget(),
      ],
    );
  }
}
