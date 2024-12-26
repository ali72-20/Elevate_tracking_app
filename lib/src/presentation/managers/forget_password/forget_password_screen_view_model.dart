import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/common/apis/api_result.dart';
import 'package:tracking_app/core/helpers/app_Regex.dart';
import 'package:tracking_app/src/domain/entities/forget_password/get_otp_response_entity.dart';
import 'package:tracking_app/src/domain/use_cases/forget_password/forget_password_use_cases.dart';
import 'package:tracking_app/src/presentation/managers/forget_password/forget_password_screen_actions.dart';
import 'package:tracking_app/src/presentation/managers/forget_password/forget_password_screen_states.dart';

@injectable
class ForgetPasswordScreenViewModel extends Cubit<ForgetPasswordScreenStates> {
  final ForgetPasswordUseCases _forgetPasswordUseCases;

  ForgetPasswordScreenViewModel(this._forgetPasswordUseCases)
      : super(InitialState());
  TextEditingController emailController = TextEditingController();
  bool isConfirmButtonAction = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int currentStateIndex = 0;

  _getOtp() async {
    emit(LoadingState());
    var response = await _forgetPasswordUseCases.getOtp(emailController.text);
    switch (response) {
      case Success<GetOtpResponseEntity>():
        _goToNextState();
        emit(SuccessState(message: response.data!.info));
        break;
      case Failures<GetOtpResponseEntity>():
        emit(FailureState(exception: response.exception));
        break;
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
      _getOtp();
    }
  }

  void doAction(ForgetPasswordScreenActions action) {
    switch (action) {
      case GetOtpAction():
        _getOtp();
        break;
      case GoToPrevStateAction():
        _goToPrevState();
        break;
      case ConfirmEmailAction():
        _confirmEmail();
        break;
    }
  }
}
