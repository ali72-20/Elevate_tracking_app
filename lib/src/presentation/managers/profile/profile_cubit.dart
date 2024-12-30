import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:tracking_app/src/domain/use_cases/get_profile_data_use_case.dart';
import 'package:tracking_app/src/presentation/managers/profile/profile_action.dart';

import '../../../../core/common/apis/api_result.dart';
import '../../../domain/entities/app_user_entity.dart';

part 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileDataUseCase getProfileDataUseCase;
  ProfileCubit(this.getProfileDataUseCase) : super(ProfileInitial());

  Future<void>doAction(ProfileAction profileAction)async{
    switch (profileAction) {
      case GetProfileDataAction():
       return _getProfileData();
    }
  }


  AppUserEntity ?  appUserEntity ;
  Future<void> _getProfileData() async {
    emit(GetProfileDataLoadingState());
    var result = await getProfileDataUseCase.invoke();
    switch (result) {
      case Success<AppUserEntity>():
        appUserEntity = result.data;
        emit(GetProfileDataSuccessState());
      case Failures<AppUserEntity>():
        emit(GetProfileDataFailuresState(exception: result.exception ));
    }
  }

}
