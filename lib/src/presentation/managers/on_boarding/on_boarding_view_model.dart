
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/src/presentation/managers/on_boarding/on_boarding_actions.dart';
import 'package:tracking_app/src/presentation/managers/on_boarding/on_boarding_states.dart';

@injectable
class OnBoardingViewModel extends Cubit<OnBoardingStates> {
  OnBoardingViewModel():super(InitialOnBoardingState());




  void doAction(OnBoardingAction action){
    switch (action) {
      case GoToLogin():
         emit(GoToLoginState());
         break;
      case GoToApply():
        emit(GoToApplyState());
        break;
    }
  }
}
