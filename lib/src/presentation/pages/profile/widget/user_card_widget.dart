import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/utilities/style/app_fonts.dart';
import 'package:tracking_app/src/presentation/managers/profile/profile_cubit.dart';

import '../../../../../core/common/common_imports.dart';
import '../../../../../core/utilities/style/app_colors.dart';
import '../../../../../core/utilities/style/spacing.dart';

class UserCardWidget extends StatelessWidget {
  const UserCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var profileViewModel=context.read<ProfileCubit>();
    return   Card(
      elevation: 5,
      color: AppColors.kWhiteBase,
      shape:  const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: ListTile(
        contentPadding:  EdgeInsets.only(
            top: 16.h,
            bottom: 16.h,
            right: 16.w
        ),
        leading:  const CircleAvatar(
          radius: 50,
          backgroundColor: Colors.red,
        ),
        title:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              child: Text(profileViewModel.appUserEntity?.firstName.toString() ?? "",
                style:
                AppFonts.font18BlackWeight500Font,),
            ),
            verticalSpace(4),
            FittedBox(
              child: Text(profileViewModel.appUserEntity?.email.toString() ?? "",
                style:
                AppFonts.font16kBlackWeight400Font,
                maxLines: 1,
              
              ),
            ),
            FittedBox(
              child: Text(profileViewModel.appUserEntity?.phone.toString() ?? "",
               style: AppFonts.font16kBlackWeight400Font,
                maxLines: 1,
              
              ),
            ),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios_rounded),
      ),
    );
  }
}
