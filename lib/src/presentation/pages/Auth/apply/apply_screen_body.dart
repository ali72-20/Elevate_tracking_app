import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/common/common_imports.dart';
import 'package:tracking_app/core/extensions/extensions.dart';
import 'package:tracking_app/core/utilities/style/app_text_styles.dart';
import 'package:tracking_app/core/utilities/style/spacing.dart';
import 'package:tracking_app/src/presentation/managers/Auth/apply/apply_screen_view_model.dart';

import '../../../../../core/utilities/style/app_colors.dart';
import 'apply_form.dart';
import 'country_drop_down_list.dart';
import 'gender_radio_button_row.dart';

class ApplyScreenBody extends StatelessWidget {
  const ApplyScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ApplyScreenViewModel>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: _welcomeText(context),
          ),
          const SliverToBoxAdapter(
            child: ApplyForm(),
          ),
          const SliverToBoxAdapter(child: GenderRadioButtonRow()),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 48, bottom: 50),
              child: ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Text(
                      context.localization.continueKey,
                      style: AppTextStyles.font16Regular
                          .copyWith(color: AppColors.kWhiteBase),
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }

  Widget _welcomeText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.localization.welcome,
          style: AppTextStyles.font20Medium,
        ),
        verticalSpace(8),
        Text(
          context.localization.joinOurTeam,
          style: AppTextStyles.font16Medium.copyWith(color: AppColors.kGray),
        )
      ],
    );
  }
}
