import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/src/data/api/core/errors/error_handler.dart';
import 'package:tracking_app/src/presentation/managers/Auth/profile/profile_screen_viewmodel.dart';

import '../../../../core/common/common_imports.dart';
import '../../../../core/di/di.dart';
import '../../managers/Auth/profile/profile_screen_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    ProfileScreenViewModel _viewModel = getIt<ProfileScreenViewModel>();
    return BlocProvider(
      create: (context) => _viewModel,
      child: BlocBuilder<ProfileScreenViewModel, ProfileScreenState>(
        builder: (context, state) {
          if (state is ProfileScreenLoading) {
            _viewModel.getDriverDat();
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProfileScreenLoaded) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Profile'),
              ),
              body: Column(
                children: [
                  Text('Name: ${state.user?.firstName}'),
                  Text('Email: ${state.user?.email}'),
                  Text('Phone: ${state.user?.phone}'),
                  Text('Gender: ${state.user?.gender}'),
                ],
              ),
            );
          } else if (state is ProfileScreenError) {
            final errorHandler = ErrorHandler.fromException(
                state.message, AppLocalizations.of(context)!);

            return Center(
              child: Text('Error: ${errorHandler.errorMassage}'),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
