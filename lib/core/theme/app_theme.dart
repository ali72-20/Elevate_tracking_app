import 'package:tracking_app/core/helpers/redius/app_border_radius.dart';
import 'package:tracking_app/core/utilities/style/app_text_styles.dart';

import '../common/common_imports.dart';
import '../utilities/style/app_colors.dart';
class AppTheme {
  AppTheme._();


  static ThemeData defaultTheme =
  ThemeData(
    scaffoldBackgroundColor: AppColors.kWhiteBase,
      bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.transparent
      ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: AppBorderRadius.xs,
        borderSide: const BorderSide(
          color: AppColors.kGray
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.kBlue
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: AppBorderRadius.xs,
        borderSide: const BorderSide(
          color: AppColors.kBlue,
        )
      )
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.kBaseColor,
        disabledBackgroundColor: AppColors.kWhite70,
        textStyle: AppTextStyles.font16Medium
      )
    )




  );


}
