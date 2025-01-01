import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/common/apis/api_result.dart';
import 'package:tracking_app/core/helpers/app_Regex.dart';
import 'package:tracking_app/src/domain/entities/forget_password/confime_otp_entity.dart';
import 'package:tracking_app/src/domain/entities/forget_password/get_otp_response_entity.dart';
import 'package:tracking_app/src/domain/entities/forget_password/reset_password_entity.dart';
import 'package:tracking_app/src/domain/use_cases/forget_password/forget_password_use_cases.dart';
import 'package:tracking_app/src/presentation/managers/Auth/forget_password/forget_password_screen_actions.dart';
import 'package:tracking_app/src/presentation/managers/Auth/forget_password/forget_password_screen_states.dart';


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
        if (!isResend) {
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
        emit(SuccessState(message: response.data!.statue));
        _goToNextState();
        break;
      case Failures<ConfirmOtpEntity>():
        emit(FailureState(exception: response.exception));
        break;
    }
  }

  String? validateNewPassword() {
    String password = newPasswordController.text;
    if (password.isEmpty ||
        password == null ||
        !AppRegex.isPasswordValid(password)) {
      emit(NotValidPasswordState());
      return "This password is Not valid";
    }
    return null;
  }

  String? validateConfirmNewPassword() {
    String confirmPassword = confirmNewPasswordController.text;
    if (confirmPassword.isEmpty ||
        confirmPassword == null ||
        !AppRegex.isPasswordValid(confirmPassword)) {
      emit(NotValidPasswordState());
      return "This password is Not valid";
    }
    if (newPasswordController.text != confirmNewPasswordController.text) {
      emit(NotMatchPasswordState());
      return "Password does not match";
    }
    return null;
  }

  bool _isValidToResetPassword() {
    if (!newPasswordKey.currentState!.validate()) {
      emit(NotValidPasswordState());
      return false;
    }
    if (validateNewPassword() != null) {
      emit(NotValidPasswordState());
      return false;
    }
    if (validateConfirmNewPassword() != null) {
      emit(NotMatchPasswordState());
      return false;
    }
    emit(ValidationSuccessState());
    return true;
  }

  _resetPassword() async {
    if (_isValidToResetPassword()) {
      emit(LoadingState());
      var response = await _forgetPasswordUseCases.resetPassword(
          emailController.text, newPasswordController.text);
      switch (response) {
        case Success<ResetPasswordEntity>():
          emit(SuccessState(message: response.data!.message));
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
    if (formKey.currentState!.validate()) {
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
      case ValidateFieldsAction():
        _isValidToResetPassword();
        break;
    }
  }
}
