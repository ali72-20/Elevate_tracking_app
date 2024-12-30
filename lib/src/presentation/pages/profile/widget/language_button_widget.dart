import 'package:tracking_app/core/extensions/extensions.dart';
import 'package:tracking_app/core/utilities/style/app_fonts.dart';

import '../../../../../core/common/common_imports.dart';
import '../../../../../core/utilities/style/app_colors.dart';

class LanguageButtonWidget extends StatelessWidget {
  const LanguageButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      leading: TextButton.icon(onPressed: (){},
        label: Text(context.localizations.language,
          style:
          AppFonts.font13BlackWeight400,
        ),
        icon: const Icon(Icons.translate,color: AppColors.kBlackBase,),
      ),
      trailing: Text("English",
       style:  AppFonts.font12MainWeight400,

      )
      ,
    );

  }
}
