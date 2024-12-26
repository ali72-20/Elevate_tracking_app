
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/src/domain/use_cases/forget_password/forget_password_use_cases.dart';
import 'package:tracking_app/src/presentation/managers/forget_password/forget_password_screen_actions.dart';
import 'package:tracking_app/src/presentation/managers/forget_password/forget_password_screen_states.dart';

@injectable
class ForgetPasswordScreenViewModel extends Cubit<ForgetPasswordScreenStates>{
  final ForgetPasswordUseCases _forgetPasswordUseCases;
  ForgetPasswordScreenViewModel(this._forgetPasswordUseCases) : super(InitialState());
  TextEditingController emailController = TextEditingController();
  bool isConfirmButtonAction = false;
  final List<ForgetPasswordScreenStates> _currentState = [GoToLoginScreenState(),EnterEmailState(),EnterOtpState(),ResetPasswordState()
    ,GoToLoginScreenState()];
  int _currentStateIndex = 1;

  _getOtp() async{

  }


  void doAction(ForgetPasswordScreenActions action){
    switch (action) {
      case GetOtpAction():
        _getOtp();
        break;
      case GoToNextStateAction():
        emit(_currentState[++_currentStateIndex]);
        break;
      case GoToPrevStateAction():
        emit(_currentState[--_currentStateIndex]);
       break;
    }
  }
}