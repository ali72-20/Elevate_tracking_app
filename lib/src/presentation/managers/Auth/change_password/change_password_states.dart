class ChangePasswordStates{}
class InitialState extends ChangePasswordStates{}
class LoadingState extends ChangePasswordStates{}
class SuccessState extends ChangePasswordStates{}
class FailureState extends ChangePasswordStates{
  final Exception? exception;
  FailureState({this.exception});
}
class SuccessValidateAllFieldsState extends ChangePasswordStates{}
class FailureValidateAllFieldsState extends ChangePasswordStates{}