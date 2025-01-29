import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tracking_app/core/extensions/extensions.dart';
import 'package:tracking_app/core/utilities/style/spacing.dart';
import 'package:tracking_app/src/domain/entities/country/country_entity.dart';
import 'package:tracking_app/src/presentation/managers/Auth/apply/apply_screen_view_model.dart';
import '../../../../../core/common/common_imports.dart';
import '../../../../../core/utilities/style/app_colors.dart';
import '../../../../../core/utilities/style/app_text_styles.dart';
import '../../../../domain/entities/vehciles/vehicles_entity.dart';
import 'package:image_picker/image_picker.dart';

class ApplyForm extends StatefulWidget {
  const ApplyForm({super.key});

  @override
  State<ApplyForm> createState() => _ApplyFormState();
}

class _ApplyFormState extends State<ApplyForm> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ApplyScreenViewModel>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Form(
        key: viewModel.applyFormKey,
        child: Column(
          children: [
            DropdownButtonHideUnderline(
              child: DropdownButton2<CountryEntity>(
                isExpanded: true,
                items: viewModel.countries
                    .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          "${e.flag} ${e.name}",
                        )))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    viewModel.selectedCountry = value!;
                    viewModel
                        .getController(ApplyScreenFormFields.country)
                        .text = value.name!;
                  });
                },
                value: viewModel.selectedCountry,
                buttonStyleData: ButtonStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: AppColors.kWhiteBase,
                    border: Border.all(color: AppColors.kBlackBase),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  width: context.width,
                  height: 50.h,
                ),
                menuItemStyleData: MenuItemStyleData(
                  height: 40.h,
                ),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 200.h,
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(Icons.keyboard_arrow_down_sharp),
                ),
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.kBlackBase,
                ),
              ),
            ),
            verticalSpace(24),
            TextFormField(
              controller: viewModel
                  .getController(ApplyScreenFormFields.firstLegalName),
              decoration: InputDecoration(
                label: Text(
                  context.localization.firstLegalName,
                  style: AppTextStyles.font12Regular,
                ),
                hintText: context.localization.enterFirstLegalName,
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
            DropdownButtonHideUnderline(
              child: DropdownButton2<VehiclesEntity>(
                isExpanded: true,
                items: viewModel.selectedVehicle.vehicles
                    ?.map((e) =>
                        DropdownMenuItem(value: e, child: Text(e.type ?? '')))
                    .toList(),
                value: viewModel.selectedVehicleEntity,
                onChanged: (value) {
                  setState(() {
                    viewModel.selectedVehicleEntity = value!;
                    viewModel
                        .getController(ApplyScreenFormFields.vehicleType)
                        .text = value.type!;
                  });
                },
                buttonStyleData: ButtonStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: AppColors.kWhiteBase,
                    border: Border.all(color: AppColors.kBlackBase),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  width: context.width,
                  height: 50.h,
                ),
                menuItemStyleData: MenuItemStyleData(
                  height: 40.h,
                ),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 200.h,
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(Icons.keyboard_arrow_down_sharp),
                ),
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.kBlack100,
                ),
              ),
            ),
            verticalSpace(24),
            TextFormField(
              controller:
                  viewModel.getController(ApplyScreenFormFields.vehicleLicense),
              readOnly: true,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () async {
                      var image = await ImagePicker.platform
                          .getImageFromSource(source: ImageSource.gallery);
                      viewModel.vehicleLicenseImage = File(image?.path ?? "");
                      viewModel
                          .getController(ApplyScreenFormFields.vehicleLicense)
                          .text = File(image?.name ?? "").toString();
                    },
                    icon: const Icon(Icons.file_upload)),
                hintStyle: AppTextStyles.font14Regular
                    .copyWith(color: AppColors.kWhite70),
                hintText: context.localization.uploadVehicleLicense,
                label: Text(
                  context.localization.vehicleLicense,
                  style: AppTextStyles.font12Regular,
                ),
              ),
              validator: (value) {
                return viewModel
                    .validateField(ApplyScreenFormFields.vehicleLicense);
              },
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
              readOnly: true,
              controller:
                  viewModel.getController(ApplyScreenFormFields.idImage),
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () async {
                      var image = await ImagePicker.platform
                          .getImageFromSource(source: ImageSource.gallery);
                      viewModel.idImage = File(image?.path ?? "");
                      viewModel
                          .getController(ApplyScreenFormFields.idImage)
                          .text = File(image?.name ?? "").toString();
                    },
                    icon: const Icon(Icons.file_upload)),
                hintStyle: AppTextStyles.font14Regular
                    .copyWith(color: AppColors.kWhite70),
                hintText: context.localization.uploadIdImage,
                label: Text(
                  context.localization.idImage,
                  style: AppTextStyles.font12Regular,
                ),
              ),
              validator: (value) {
                return viewModel.validateField(ApplyScreenFormFields.idImage);
              },
            ),
            verticalSpace(24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: context.width * 0.45,
                  child: TextFormField(
                    obscureText: viewModel.isObscure,
                    controller:
                        viewModel.getController(ApplyScreenFormFields.password),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              viewModel.isObscure = !viewModel.isObscure;
                            });
                          },
                          icon: Icon(viewModel.isObscure
                              ? Icons.visibility_off
                              : Icons.visibility)),
                      label: Text(
                        context.localization.password,
                        style: AppTextStyles.font12Regular,
                      ),
                      hintText: context.localization.enterYourPassword,
                      hintStyle: AppTextStyles.font14Regular
                          .copyWith(color: AppColors.kWhite70),
                    ),
                    validator: (value) {
                      return viewModel
                          .validateField(ApplyScreenFormFields.password);
                    },
                  ),
                ),
                SizedBox(
                  width: context.width * 0.45,
                  child: TextFormField(
                    obscureText: viewModel.isObscure,
                    controller: viewModel
                        .getController(ApplyScreenFormFields.confirmPassword),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              viewModel.isObscure = !viewModel.isObscure;
                            });
                          },
                          icon: Icon(viewModel.isObscure
                              ? Icons.visibility_off
                              : Icons.visibility)),
                      label: Text(
                        context.localization.confirmPassword,
                        style: AppTextStyles.font12Regular,
                      ),
                      hintText: context.localization.confirmPassword,
                      hintStyle: AppTextStyles.font14Regular
                          .copyWith(color: AppColors.kWhite70),
                    ),
                    validator: (value) {
                      return viewModel
                          .validateField(ApplyScreenFormFields.confirmPassword);
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
