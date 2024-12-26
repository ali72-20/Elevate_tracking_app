
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/common/apis/api_result.dart';
import 'package:tracking_app/core/extensions/extensions.dart';
import 'package:tracking_app/core/helpers/app_Regex.dart';
import 'package:tracking_app/src/domain/entities/forget_password/get_otp_response_entity.dart';
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
    emit(LoadingState());
    var response = await _forgetPasswordUseCases.getOtp(emailController.text);
    switch (response) {
      case Success<GetOtpResponseEntity>():
        _goToNextState();
        break;
      case Failures<GetOtpResponseEntity>():
        emit(FailureState(exception: response.exception));
       break;
    }
  }

  _goToNextState() {
    emit(_currentState[++_currentStateIndex]);
  }

  _confirmEmail(){
    String email = emailController.text;
    if(email.isEmpty || email == null || !AppRegex.isEmailValid(email)){

    }else{
      emit(ConfirmedEmailState());
      _getOtp();
    }
  }

  void doAction(ForgetPasswordScreenActions action){
    switch (action) {
      case GetOtpAction():
        _getOtp();
        break;
      case GoToPrevStateAction():
        emit(_currentState[--_currentStateIndex]);
       break;
      case ConfirmEmailAction():
        _confirmEmail();
        break;
    }
  }
}