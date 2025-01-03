import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/di/di.dart';
import 'package:tracking_app/src/presentation/managers/Auth/change_password/change_password_view_model.dart';

import 'change_password_screen_body.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});

  final viewModel = getIt.get<ChangePasswordViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => viewModel,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(),
          body: const ChangePasswordScreenBody(),
        ),
      ),
    );
  }
}
