class ApplyScreenStates {}
class InitialState extends ApplyScreenStates {}
class LoadingState extends ApplyScreenStates{}
class SuccessState extends ApplyScreenStates{}
class FailureState extends ApplyScreenStates{
  final Exception? exception;
  FailureState({this.exception});
}

class FormFailureState extends ApplyScreenStates{
  final String? message;
  FormFailureState({this.message});
}