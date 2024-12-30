import 'package:flutter/material.dart';
import 'package:tracking_app/core/extensions/extensions.dart';
import 'package:tracking_app/core/utilities/style/spacing.dart';

import '../widget/delivery_switch_widget.dart';
import '../widget/language_button_widget.dart';
import '../widget/logout_button_widget.dart';
import '../widget/user_card_widget.dart';
import '../widget/vehicle_info_card_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localizations.profile),
      ),
      body: SingleChildScrollView(
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
      ),
    );
  }
}
