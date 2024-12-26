class ForgetPasswordScreenStates{}


class InitialState extends ForgetPasswordScreenStates{}
class ConfirmPasswordActiveState extends ForgetPasswordScreenStates{}
class EnterEmailState extends ForgetPasswordScreenStates{}
class EnterOtpState extends ForgetPasswordScreenStates{}
class ResetPasswordState extends ForgetPasswordScreenStates{}
class GoToLoginScreenState extends ForgetPasswordScreenStates{}
class ConfirmedEmailState extends ForgetPasswordScreenStates{}
class LoadingState extends ForgetPasswordScreenStates{}
class SuccessState extends ForgetPasswordScreenStates{
  final String? message;
  SuccessState({this.message});
}
class FailureState extends ForgetPasswordScreenStates{
  final Exception? exception;
  FailureState({this.exception});
}