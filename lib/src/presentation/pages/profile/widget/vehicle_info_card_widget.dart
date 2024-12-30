import 'package:tracking_app/core/utilities/style/app_fonts.dart';

import '../../../../../core/common/common_imports.dart';
import '../../../../../core/utilities/style/app_colors.dart';
import '../../../../../core/utilities/style/spacing.dart';

class VehicleInfoCardWidget extends StatelessWidget {
  const VehicleInfoCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return   Card(
      elevation: 5,
      color: AppColors.kWhiteBase,
      shadowColor:AppColors.kWhiteBase,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: ListTile(
        contentPadding:  const EdgeInsets.all(16),
        title:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("omar makram dater",
              style: AppFonts.font18BlackWeight500Font,
            ),
            verticalSpace(4),
            Text("John Doe@gmail.com",
              style: AppFonts.font16kBlackWeight400Font,

            ),
            verticalSpace(8),
            Text("01154544334",
              style: AppFonts.font16kBlackWeight400Font,
            ),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios_rounded),
      ),
    );

  }
}
