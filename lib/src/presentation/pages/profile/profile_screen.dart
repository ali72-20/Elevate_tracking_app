import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:tracking_app/core/utilities/style/spacing.dart';
import 'package:tracking_app/src/data/api/core/errors/error_handler.dart';
import 'package:tracking_app/src/presentation/managers/Auth/profile/profile_screen_viewmodel.dart';

import '../../../../core/common/common_imports.dart';
import '../../../../core/di/di.dart';
import '../../managers/Auth/profile/profile_screen_state.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isNotificationEnabled = false;

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
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Spacer(),
                        FlutterSwitch(
                          value: _isNotificationEnabled,
                          onToggle: (value) {
                            setState(() {
                              _isNotificationEnabled = value;
                            });
                          },
                          activeColor: Colors.green,
                          inactiveColor: Colors.grey,
                          padding: 4.0,
                          toggleSize: 25.0,
                          width: 52.h,
                          height: 30.h,
                          borderRadius: 100.0,
                        ),
                        horizontalSpace(8),
                        const Text('Ready for delivery',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            )),
                      ],
                    )
                  ],
                ),
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
