import 'package:tracking_app/core/extensions/extensions.dart';
import 'package:tracking_app/core/routes/page_route_name.dart';
import 'package:tracking_app/core/utilities/style/app_images.dart';
import 'package:tracking_app/src/data/api/core/errors/error_messages.dart';

import '../../../src/data/api/core/errors/error_handler.dart';
import '../../../src/presentation/shared_widgets/error_screen_widget.dart';
import '../../common/common_imports.dart';

class ErrorDialog {
  static Widget buildErrorWidget(
      {required BuildContext context,
        required ErrorHandler errorHandler,
        void Function()? onPressed}) {
    if (errorHandler.code == 401 || errorHandler.code == 403) {
      return Center(
        child: ErrorScreenWidget(
          image: AppImages.error,
          text: context.localizations.pleaseEnterLogin,
          errorMassage: context.localizations.pleaseEnterLogin,
          onPressed: () => _navigateToLogin(context),
        ),
      );
    } else {
      return ErrorScreenWidget(
          text: "Try Aging",
          errorMassage: errorHandler.errorMassage,
          onPressed: onPressed);
    }
  }


  static void _navigateToLogin(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      PageRoutesName.login,
          (route) => false,
    );
  }
}