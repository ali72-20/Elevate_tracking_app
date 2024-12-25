import '../common/common_imports.dart';
import '../utilities/style/app_colors.dart';
class AppTheme {
  AppTheme._();


  static ThemeData defaultTheme =
  ThemeData(scaffoldBackgroundColor: AppColors.kWhiteBase,
      bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.transparent
      )

  );


}
