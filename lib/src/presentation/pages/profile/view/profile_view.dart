import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/di/di.dart';
import 'package:tracking_app/core/extensions/extensions.dart';
import 'package:tracking_app/core/utilities/dialogs/error_dialog.dart';
import 'package:tracking_app/core/utilities/dialogs/loading_dialog.dart';
import 'package:tracking_app/core/utilities/style/spacing.dart';
import 'package:tracking_app/src/data/api/core/errors/error_handler.dart';
import 'package:tracking_app/src/presentation/managers/profile/profile_action.dart';
import 'package:tracking_app/src/presentation/managers/profile/profile_cubit.dart';

import '../../../../../core/utilities/dialogs/awesome_dialoge.dart';
import '../widget/delivery_switch_widget.dart';
import '../widget/language_button_widget.dart';
import '../widget/logout_button_widget.dart';
import '../widget/user_card_widget.dart';
import '../widget/vehicle_info_card_widget.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  var profileViewModel = getIt.get<ProfileCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>    profileViewModel..doAction(GetProfileDataAction())
      ,
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.localizations.profile),
        ),
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
           if(state is GetProfileDataLoadingState){
             return LoadingDialog.buildLoadingWidget(context);
           }else if(state is GetProfileDataFailuresState){
             final ErrorHandler  errorHandler=ErrorHandler.fromException(state.exception,
                 context.localizations);
            return ErrorDialog.buildErrorWidget(context: context,
                 errorHandler: errorHandler);
           }else {
             return SingleChildScrollView(
               child: Padding(
                 padding: const EdgeInsets.all(16.0),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     const DeliverySwitchWidget(),
                     verticalSpace(24),
                     const UserCardWidget(),
                     verticalSpace(8),
                     const VehicleInfoCardWidget(),
                     verticalSpace(8),
                     const LanguageButtonWidget(),
                     const LogoutButtonWidget(),
                   ],
                 ),
               ),
             );

           }
          },
        ),
      ),
    );
  }
}
