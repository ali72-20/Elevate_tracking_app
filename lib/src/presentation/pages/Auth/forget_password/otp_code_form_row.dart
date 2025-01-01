import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/src/presentation/managers/Auth/forget_password/forget_password_screen_actions.dart';

import '../../../../../core/common/common_imports.dart';
import '../../../managers/Auth/forget_password/forget_password_screen_view_model.dart';

class OtpCodeFormRow extends StatefulWidget {
  const OtpCodeFormRow({super.key});

  @override
  State<OtpCodeFormRow> createState() => _OtpCodeFormRowState();
}

class _OtpCodeFormRowState extends State<OtpCodeFormRow> {
  final List<TextEditingController> _controllers =
  List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  @override
  void dispose() {
    super.dispose();
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
  }

  void _onOtpComplete(String otp) {
    final viewModel = context.read<ForgetPasswordScreenViewModel>();
    viewModel.doAction(ConfirmOtpAction(otp: otp));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(6, (index) {
        return SizedBox(
          width: 50,
          child: TextFormField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            onSaved: (value) {},
            decoration: const InputDecoration(
              counterText: "",
            ),
            onChanged: (value) {
              if (value.isNotEmpty) {
                if (index < 5) {
                  FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
                } else {
                  final otp = _controllers.map((controller) => controller.text).join();
                  if (otp.length == 6) {
                    _onOtpComplete(otp);
                  }
                }
              } else if (value.isEmpty && index > 0) {
                FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
              }
            },
          ),
        );
      }),
    );
  }
}
