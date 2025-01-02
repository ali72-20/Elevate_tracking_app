import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/common/common_imports.dart';
import 'package:tracking_app/core/di/di.dart';
import 'package:tracking_app/core/routes/page_route_name.dart';
import 'package:tracking_app/src/presentation/managers/on_boarding/on_boarding_states.dart';
import 'package:tracking_app/src/presentation/managers/on_boarding/on_boarding_view_model.dart';
import 'package:tracking_app/src/presentation/pages/on_boarding/on_boarding_body.dart';
import 'package:tracking_app/src/tracking_app.dart';

class OnBoarding extends StatelessWidget {
  OnBoarding({super.key});

  final viewModel = getIt.get<OnBoardingViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => viewModel,
      child: BlocConsumer<OnBoardingViewModel, OnBoardingStates>(
        builder: (context, state) {
          return const SafeArea(
              child: Scaffold(
            body: OnBoardingBody(),
          ));
        },
        listener: (context, state) {
          switch (state) {
            case GoToLoginState _:
              navKey.currentState!.pushNamed(PageRoutesName.login);
              break;
            case GoToApplyState _:
              navKey.currentState!.pushNamed(PageRoutesName.apply);
              break;
          }
        },
      ),
    );
  }
}
