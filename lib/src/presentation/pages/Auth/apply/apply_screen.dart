import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/common/common_imports.dart';
import 'package:tracking_app/core/di/di.dart';
import 'package:tracking_app/core/extensions/extensions.dart';
import 'package:tracking_app/core/utilities/style/app_text_styles.dart';
import 'package:tracking_app/src/presentation/managers/Auth/apply/apply_screen_actions.dart';
import 'package:tracking_app/src/presentation/managers/Auth/apply/apply_screen_states.dart';
import 'package:tracking_app/src/presentation/managers/Auth/apply/apply_screen_view_model.dart';
import 'package:tracking_app/src/presentation/pages/Auth/apply/apply_screen_body.dart';

class ApplyScreen extends StatelessWidget {
  ApplyScreen({super.key});

  final viewModel = getIt.get<ApplyScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        viewModel.doAction(GetScreenDataAction());
        return viewModel;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            context.localization.apply,
            style: AppTextStyles.font20Medium,
          ),
          leading: IconButton(
              onPressed: () {
                viewModel.doAction(ApplyNewUserAction());
              }, icon: const Icon(Icons.arrow_back_ios_new)),
        ),
        body: BlocConsumer<ApplyScreenViewModel,ApplyScreenStates>(
          builder: (context,state){
            if (state is  LoadingState){
              return const Center(child: CircularProgressIndicator());
            }
            return const ApplyScreenBody();
          },
          listener: (context,state) {

          },
        )
      ),
    );
  }
}
