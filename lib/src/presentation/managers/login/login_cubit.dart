import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/src/domain/entities/login_entity.dart';
import '../../../../core/common/apis/api_result.dart';
import '../../../data/api/core/api_request_models/login_request/login_request.dart';
import '../../../domain/use_cases/login_use_case.dart';
import 'login_action.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;
  LoginCubit(this.loginUseCase) : super(LoginInitial());

  Future<void> doAction(LoginAction loginActionView) async {
    switch (loginActionView) {
      case ButtonLoginAction():
        return await _login();
      case NavigateToForgetPasswordScreenAction():
        return _navigateToForgetPasswordScreen();
      case NavigateToBaseScreenAction():
        return _navigateToBaseScreen();
      case NavigateToRegisterScreenAction():
        return _navigateToRegisterScreen();
      case ChangeBoxLoginAction():
        return _checkBox();
      case UpdateFormFieldAction():
        return _updateValidationState();
      case ChangeIsObscureTextAction():
        return _changePasswordVisibility();
    }
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> _login() async {
    emit(LoginLoadingState());
    LoginRequest loginRequest = LoginRequest(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
    var result = await loginUseCase.invoke(
        loginRequest: loginRequest, isRemember: isBoxChecked);
    switch (result) {
      case Success<LoginEntity>():
        emit(LoginSuccessState());
      case Failures<LoginEntity>():
        emit(LoginFailuresState(exception: result.exception));
    }
  }

  bool isFormValid = false;
  void _updateValidationState() {
    if (formKey.currentState!.validate()) {
      isFormValid = true;
    } else {
      isFormValid = false;
    }
    emit(UpdateValidationState());
  }

  void _navigateToRegisterScreen() {
    emit(NavigateToRegisterScreenState());
  }

  void _navigateToBaseScreen() {
    emit(NavigateToBaseScreenState());
  }

  void _navigateToForgetPasswordScreen() {
    emit(NavigateToForgetPasswordScreenState());
  }

  bool isBoxChecked = false;
  void _checkBox() {
    isBoxChecked = !isBoxChecked;
    emit(ChangeCheckBoxLoginState());
  }

  bool isObscureText = false;
  void _changePasswordVisibility() {
    isObscureText = !isObscureText;
    emit(ChangeIsObscureTextState());
  }
}
