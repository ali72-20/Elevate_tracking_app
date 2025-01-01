part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
class LoginLoadingState extends LoginState{}
class LoginSuccessState extends LoginState{}
class LoginFailuresState extends LoginState{
 final Exception exception;
  LoginFailuresState({required this.exception});
}

class ChangeCheckBoxLoginState extends LoginState{}
class ChangeIsObscureTextState extends LoginState{}


class NavigateToForgetPasswordScreenState extends LoginState{}
class NavigateToBaseScreenState extends LoginState{}
class NavigateToRegisterScreenState extends LoginState{}
class UpdateValidationState extends LoginState{}
class UpdateFormFieldState extends LoginState{}