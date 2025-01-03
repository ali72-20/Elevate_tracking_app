
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/common/apis/api_result.dart';
import 'package:tracking_app/core/helpers/app_Regex.dart';
import 'package:tracking_app/src/domain/entities/auth/change_password_entity.dart';
import 'package:tracking_app/src/domain/use_cases/change_password.dart';
import 'package:tracking_app/src/presentation/managers/Auth/change_password/change_password_actions.dart';
import 'package:tracking_app/src/presentation/managers/Auth/change_password/change_password_states.dart';

@injectable
class ChangePasswordViewModel extends Cubit<ChangePasswordStates>{
  final ChangePasswordUseCase _changePasswordUseCase;
  ChangePasswordViewModel(this._changePasswordUseCase) : super(InitialState());
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> _dispose()async {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
  }
  String? _validatePassword(String password){
    if(password.isEmpty || password == null || !AppRegex.isPasswordValid(password)){
      emit(FailureValidateAllFieldsState());
       return "inValid Password";
    }
    return null;
  }

  String? _validateConfirmPassword(String password) {
    if(_validatePassword(password) == null){
      if(password != newPasswordController.text) {
        emit(FailureValidateAllFieldsState());
        return "Password does not match";
      }
    }
    return null;
  }

  _changePassword() async{
    if(formKey.currentState!.validate()){
      emit(LoadingState());
      var result = await _changePasswordUseCase.changePassword(oldPasswordController.text, newPasswordController.text);
      switch (result) {
        case Success<ChangePasswordEntity>():
          await _dispose();
          emit(SuccessState());
          break;
        case Failures<ChangePasswordEntity>():
          emit(FailureState(exception: result.exception));
          break;
      }
    }else{
      emit(FailureValidateAllFieldsState());
    }
  }


  void doAction(ChangePasswordScreenAction action){
    switch (action) {
      case ChangePasswordAction():
        _changePassword();
        break;
    }
  }

}

enum ChangePasswordScreenInputField{
  oldPassword,
  newPassword,
  confirmPassword
}