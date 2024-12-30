import 'package:tracking_app/core/extensions/extensions.dart';
import 'package:tracking_app/core/utilities/style/app_fonts.dart';

import '../../../../../core/common/common_imports.dart';

class DeliverySwitchWidget extends StatelessWidget {
  const DeliverySwitchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Spacer(),
        Switch(
          value: true,
          materialTapTargetSize: MaterialTapTargetSize.padded,
          activeColor: Colors.green,
          onChanged: (value) {},
        ),
        Text(
          context.localizations.readyForDelivery,
          style: AppFonts.font18BlackWeight500Font,
        ),
      ],
    );
  }
}
