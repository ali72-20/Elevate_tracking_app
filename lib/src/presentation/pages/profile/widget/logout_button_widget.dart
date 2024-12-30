import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracking_app/core/utilities/style/app_colors.dart';
import 'package:tracking_app/core/utilities/style/app_fonts.dart';
class LogoutButtonWidget extends StatelessWidget {
  const LogoutButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return             ListTile(
      leading: TextButton.icon(onPressed: (){},
        label: Text("Logout",
          style: AppFonts.font13BlackWeight400,
        ),
        icon:  Icon(
          Icons.logout,color: AppColors.kBlackBase,
          weight: 12.w
          ,
        ),
      ),
      trailing:  const Icon(
        size: 20,
        Icons.logout,color: AppColors.kGray
      )
      ,
    );
  }
}
