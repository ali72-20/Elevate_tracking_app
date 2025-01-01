import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/extensions/extensions.dart';
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
        key: viewModel.applyFormKey,
        child: Column(
          children: [
            const CountryDropDownList(),
            verticalSpace(25),
            TextFormField(
              controller:
                  viewModel.getController(ApplyScreenFormFields.firstLegalName),
              decoration: InputDecoration(
                label: Text(
                  context.localization.firstLegalName,
                  style: AppTextStyles.font12Regular,
                ),
                hintText: context.localization.enterYourName,
                hintStyle: AppTextStyles.font14Regular
                    .copyWith(color: AppColors.kWhite70),
              ),
              validator: (value) {
                return viewModel
                    .validateField(ApplyScreenFormFields.firstLegalName);
              },
            ),
            verticalSpace(24),
            TextFormField(
              controller: viewModel
                  .getController(ApplyScreenFormFields.secondLegalName),
              decoration: InputDecoration(
                label: Text(
                  context.localization.secondLegalName,
                  style: AppTextStyles.font12Regular,
                ),
                hintText: context.localization.enterYourName,
                hintStyle: AppTextStyles.font14Regular
                    .copyWith(color: AppColors.kWhite70),
              ),
              validator: (value) {
                return viewModel
                    .validateField(ApplyScreenFormFields.secondLegalName);
              },
            ),
            verticalSpace(24),
            TextFormField(
              controller:
                  viewModel.getController(ApplyScreenFormFields.vehicleNumber),
              decoration: InputDecoration(
                label: Text(
                  context.localization.vehicleNumber,
                  style: AppTextStyles.font12Regular,
                ),
                hintText: context.localization.enterVehicleNumber,
                hintStyle: AppTextStyles.font14Regular
                    .copyWith(color: AppColors.kWhite70),
              ),
              validator: (value) {
                return viewModel
                    .validateField(ApplyScreenFormFields.vehicleNumber);
              },
            ),
            verticalSpace(24),
            TextFormField(
              decoration: InputDecoration(
                label: Text(
                  context.localization.vehicleType,
                  style: AppTextStyles.font12Regular,
                ),
              ),
            ),
            verticalSpace(24),
            TextFormField(
              readOnly: true,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.file_upload)),
                hintStyle: AppTextStyles.font14Regular
                    .copyWith(color: AppColors.kWhite70),
                hintText: context.localization.uploadVehicleLicense,
                label: Text(
                  context.localization.vehicleLicense,
                  style: AppTextStyles.font12Regular,
                ),
              ),
            ),
            verticalSpace(24),
            TextFormField(
              controller: viewModel.getController(ApplyScreenFormFields.email),
              decoration: InputDecoration(
                label: Text(
                  context.localization.email,
                  style: AppTextStyles.font12Regular,
                ),
                hintText: context.localization.enterYourEmail,
                hintStyle: AppTextStyles.font14Regular
                    .copyWith(color: AppColors.kWhite70),
              ),
              validator: (value) {
                return viewModel.validateField(ApplyScreenFormFields.email);
              },
            ),
            verticalSpace(24),
            TextFormField(
              controller:
                  viewModel.getController(ApplyScreenFormFields.phoneNumber),
              decoration: InputDecoration(
                label: Text(
                  context.localization.phoneNumber,
                  style: AppTextStyles.font12Regular,
                ),
                hintText: context.localization.enterYourPhoneNumber,
                hintStyle: AppTextStyles.font14Regular
                    .copyWith(color: AppColors.kWhite70),
              ),
              validator: (value) {
                return viewModel
                    .validateField(ApplyScreenFormFields.phoneNumber);
              },
            ),
            verticalSpace(24),
            TextFormField(
              controller:
                  viewModel.getController(ApplyScreenFormFields.idNumber),
              decoration: InputDecoration(
                label: Text(
                  context.localization.idNumber,
                  style: AppTextStyles.font12Regular,
                ),
                hintText: context.localization.enterIdNumber,
                hintStyle: AppTextStyles.font14Regular
                    .copyWith(color: AppColors.kWhite70),
              ),
              validator: (value) {
                return viewModel.validateField(ApplyScreenFormFields.idNumber);
              },
            ),
            verticalSpace(24),
            TextFormField(
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.file_upload)),
                hintStyle: AppTextStyles.font14Regular
                    .copyWith(color: AppColors.kWhite70),
                hintText: context.localization.uploadIdImage,
                label: Text(
                  context.localization.idImage,
                  style: AppTextStyles.font12Regular,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
