import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/common/apis/api_result.dart';
import 'package:tracking_app/core/helpers/app_Regex.dart';
import 'package:tracking_app/src/domain/entities/forget_password/confime_otp_entity.dart';
import 'package:tracking_app/src/domain/entities/forget_password/get_otp_response_entity.dart';
import 'package:tracking_app/src/domain/use_cases/forget_password/forget_password_use_cases.dart';
import 'package:tracking_app/src/presentation/managers/forget_password/forget_password_screen_actions.dart';
import 'package:tracking_app/src/presentation/managers/forget_password/forget_password_screen_states.dart';

import '../../../domain/entities/forget_password/reset_password_entity.dart';

@injectable
class ForgetPasswordScreenViewModel extends Cubit<ForgetPasswordScreenStates> {
  final ForgetPasswordUseCases _forgetPasswordUseCases;

  ForgetPasswordScreenViewModel(this._forgetPasswordUseCases)
      : super(InitialState());
  TextEditingController emailController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();
  bool isConfirmButtonAction = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> newPasswordKey = GlobalKey<FormState>();


  int currentStateIndex = 0;

  _getOtp({required bool isResend}) async {
    emit(LoadingState());
    var response = await _forgetPasswordUseCases.getOtp(emailController.text);
    switch (response) {
      case Success<GetOtpResponseEntity>():
        if(!isResend) {
          _goToNextState();
        }
        emit(SuccessState(message: response.data!.info));
        break;
      case Failures<GetOtpResponseEntity>():
        emit(FailureState(exception: response.exception));
        break;
    }
  }
  _confirmOtp({required String otp}) async {
    emit(LoadingState());
    var response = await _forgetPasswordUseCases.confirmOtp(otp);
    switch (response) {
      case Success<ConfirmOtpEntity>():
        emit(SuccessState());
        break;
      case Failures<ConfirmOtpEntity>():
        emit(FailureState(exception: response.exception));
        break;
    }
  }
  bool _validateNewPassword(){
    if(newPasswordController.text.isEmpty || newPasswordController.text == null) {
      return false;
    }
    return true;
  }
  bool _validateConfirmNewPassword() {
    if (confirmNewPasswordController.text.isEmpty ||
        confirmNewPasswordController.text == null) {
      return false;
    }
    return true;
  }
  bool _isPasswordMatch() {
    if (newPasswordController.text != confirmNewPasswordController.text) {
      return false;
    }
    return true;
  }
  bool _isValidToResetPassword(){
     if(newPasswordKey.currentState!.validate()){
       return false;
     }
      if(!_validateNewPassword()) {
        return false;
      }
      if(!_validateConfirmNewPassword()) {
        return false;
      }
      if(!_isPasswordMatch()) {
        return false;
      }
      if(!AppRegex.isPasswordValid(newPasswordController.text)){
        return false;
      }
      return true;
  }
  _resetPassword()async {
    if (_isValidToResetPassword()) {
      emit(LoadingState());
      var response = await _forgetPasswordUseCases.resetPassword(
          emailController.text, newPasswordController.text);
      switch (response) {
        case Success<ResetPasswordEntity>():
          emit(SuccessState());
          break;
        case Failures<ResetPasswordEntity>():
          emit(FailureState(exception: response.exception));
      }
    }
  }

  _goToNextState() {
    ++currentStateIndex;
  }
  _goToPrevState() {
    if (currentStateIndex - 1 < 0) {
      emit(GoToLoginScreenState());
      return;
    }
    --currentStateIndex;
    emit(GoToPrevState());
  }

  String? emailValidator() {
    String email = emailController.text;
    if (email.isEmpty || email == null || !AppRegex.isEmailValid(email)) {
      return "Email is not valid";
    }
    return null;
  }
  _confirmEmail() async {
    if(formKey.currentState!.validate()){
      _getOtp(isResend: false);
    }
  }

  void doAction(ForgetPasswordScreenActions action) {
    switch (action) {
      case GetOtpAction():
        _getOtp(isResend: false);
        break;
      case GoToPrevStateAction():
        _goToPrevState();
        break;
      case ConfirmEmailAction():
        _confirmEmail();
        break;
      case ResendOtpAction():
        _getOtp(isResend: true);
        break;
      case ConfirmOtpAction():
        _confirmOtp(otp: action.otp!);
        break;
      case ResetPasswordAction():
        _resetPassword();
        break;
    }
  }
}
