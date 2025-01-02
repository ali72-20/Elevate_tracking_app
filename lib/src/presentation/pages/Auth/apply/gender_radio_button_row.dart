import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/common/common_imports.dart';
import 'package:tracking_app/core/extensions/extensions.dart';
import 'package:tracking_app/core/utilities/style/app_colors.dart';
import 'package:tracking_app/core/utilities/style/app_text_styles.dart';
import 'package:tracking_app/src/presentation/managers/Auth/apply/apply_screen_view_model.dart';

class GenderRadioButtonRow extends StatefulWidget {
  const GenderRadioButtonRow({super.key});

  @override
  State<GenderRadioButtonRow> createState() => _GenderRadioButtonRowState();
}

class _GenderRadioButtonRowState extends State<GenderRadioButtonRow> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ApplyScreenViewModel>();
    return Row(
      children: [
        Text(
          context.localization.gender,
          style: AppTextStyles.font18Medium.copyWith(color: AppColors.kGray),
        ),
        Radio<Gender>(
          activeColor: AppColors.kBaseColor,
          value: Gender.male,
          groupValue: viewModel.selectedGender,
          onChanged: (value) {
            setState(() {
              viewModel.selectedGender = value!;
            });
          },
        ),
        Text(
          context.localization.male,
          style: AppTextStyles.font14Regular.copyWith(color: AppColors.kGray),
        ),
        Radio<Gender>(
          activeColor: AppColors.kBaseColor,
          value: Gender.female,
          groupValue: viewModel.selectedGender,
          onChanged: (value) {
            setState(
              () {
                viewModel.selectedGender = value!;
              },
            );
          },
        ),
        Text(
          context.localization.female,
          style: AppTextStyles.font14Regular.copyWith(color: AppColors.kGray),
        )
      ],
    );
  }
}
