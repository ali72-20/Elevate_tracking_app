import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/src/domain/entities/DriverData.dart';
import 'package:tracking_app/src/domain/use_cases/profile_usecase.dart';
import 'package:tracking_app/src/presentation/managers/Auth/profile/profile_screen_state.dart';

import '../../../../../core/common/apis/api_result.dart';

@injectable
class ProfileScreenViewModel extends Cubit<ProfileScreenState> {
  final ProfileUsecase _profileUsecase;
  ProfileScreenViewModel(this._profileUsecase) : super(ProfileScreenLoading());
  var currentUser;
  void getDriverDat() async {
    var result = await _profileUsecase.invoke();
    print(result);
    if (result is Success<DriverEntity>) {
      currentUser = result.data;
      final user = result.data;

      emit(ProfileScreenLoaded(user: user));
    } else if (result is Failures<DriverEntity>) {
      emit(ProfileScreenError(result.exception));
    }
  }
}
