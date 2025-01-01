import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/utilities/style/spacing.dart';
import 'package:tracking_app/src/presentation/managers/Auth/apply/apply_screen_view_model.dart';
import 'package:tracking_app/src/presentation/pages/Auth/apply/apply_screen.dart';
import 'package:tracking_app/src/presentation/pages/Auth/apply/country_drop_down_list.dart';

import '../../../../../core/common/common_imports.dart';
import '../../../../../core/utilities/style/app_colors.dart';
import '../../../../../core/utilities/style/app_text_styles.dart';

class ApplyForm extends StatelessWidget {
  const ApplyForm({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ApplyScreenViewModel>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Form(
        child: Column(
          children: [
            const CountryDropDownList(),
            verticalSpace(25),
            TextFormField(
              controller:
                  viewModel.getController(ApplyScreenFormFields.firstLegalName),
              decoration: InputDecoration(
                label: Text(
                  AppLocalizations.of(context)!.firstLegalName,
                  style: AppTextStyles.font12Regular,
                ),
                hintText: AppLocalizations.of(context)!.enterYourName,
                hintStyle: AppTextStyles.font14Regular
                    .copyWith(color: AppColors.kWhite70),
              ),
            ),
            verticalSpace(24),
            TextFormField(
              controller: viewModel
                  .getController(ApplyScreenFormFields.secondLegalName),
              decoration: InputDecoration(
                label: Text(
                  AppLocalizations.of(context)!.secondLegalName,
                  style: AppTextStyles.font12Regular,
                ),
                hintText: AppLocalizations.of(context)!.enterYourName,
                hintStyle: AppTextStyles.font14Regular
                    .copyWith(color: AppColors.kWhite70),
              ),
            ),
            verticalSpace(24),
            TextFormField(
                controller: viewModel
                    .getController(ApplyScreenFormFields.vehicleNumber),
                decoration: InputDecoration(
                  label: Text(
                    AppLocalizations.of(context)!.vehicleNumber,
                    style: AppTextStyles.font12Regular,
                  ),
                  hintText: AppLocalizations.of(context)!.enterVehicleNumber,
                  hintStyle: AppTextStyles.font14Regular
                      .copyWith(color: AppColors.kWhite70),
                )),
            verticalSpace(24),
            TextFormField(
              controller: viewModel.getController(ApplyScreenFormFields.email),
              decoration: InputDecoration(
                label: Text(
                  AppLocalizations.of(context)!.email,
                  style: AppTextStyles.font12Regular,
                ),
                hintText: AppLocalizations.of(context)!.enterYourEmail,
                hintStyle: AppTextStyles.font14Regular
                    .copyWith(color: AppColors.kWhite70),
              ),
            ),
            verticalSpace(24),
            TextFormField(
              controller:
                  viewModel.getController(ApplyScreenFormFields.phoneNumber),
              decoration: InputDecoration(
                label: Text(
                  AppLocalizations.of(context)!.phoneNumber,
                  style: AppTextStyles.font12Regular,
                ),
                hintText: AppLocalizations.of(context)!.enterYourPhoneNumber,
                hintStyle: AppTextStyles.font14Regular
                    .copyWith(color: AppColors.kWhite70),
              ),
            ),
            verticalSpace(24),
            TextFormField(
              controller: viewModel.getController(ApplyScreenFormFields.idNumber),
              decoration: InputDecoration(
                label: Text(
                  AppLocalizations.of(context)!.idNumber,
                  style: AppTextStyles.font12Regular,
                ),
                hintText: AppLocalizations.of(context)!.enterIdNumber,
                hintStyle: AppTextStyles.font14Regular
                    .copyWith(color: AppColors.kWhite70),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
