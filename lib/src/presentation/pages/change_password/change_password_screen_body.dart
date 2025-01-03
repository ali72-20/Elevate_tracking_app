import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/src/presentation/managers/Auth/change_password/change_password_view_model.dart';

class ChangePasswordScreenBody extends StatelessWidget {
  const ChangePasswordScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ChangePasswordViewModel>();
    return BlocConsumer(
        builder: (context, state) {
          return Form(
            key: viewModel.formKey,
            child: const Column(
              children: [

              ],
            ),
          );
        },
        listener: (context, state) {});
  }
}
